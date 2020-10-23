using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using AutoMapper;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.Resolvers.SpecializedResolvers;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Common.DAL.Configuration;
using Kaizen.Common.DAL.Discover.EntityExtractor;
using Kaizen.Common.DAL.Repository;
using MassTransit;
using MassTransit.Context;
using MassTransit.RabbitMqTransport;
using MassTransit.WindsorIntegration;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using NLog.Extensions.Logging;
using IRegistration = Castle.MicroKernel.Registration.IRegistration;

namespace Kaizen.Common.DAL.Container
{
	// todo: change to composite pattern and collect installation parts.
	/// <summary> Common installer for service assembly. Can help with using postgres db, scans and creating automapper, scan of mass-transit consumers and creating bus. </summary>
	public class CommonInstaller : IWindsorInstaller
	{
		private static readonly LoggerFactory DbLoggerFactory = new LoggerFactory(new[] { new NLogLoggerProvider() });

		public bool UsingDatabase { get; set; }
		public string ConnectionString { get; set; }
		public bool UsingMapper { get; set; }
		public Assembly RootAssembly { get; set; }
		public bool ScanConsumers { get; set; }
		public bool UseMassTransit { get; set; }
		public Func<IBusRegistrationContext, IWindsorContainer, IBusControl> BusFactory { get; set; }
		public Action<IWindsorContainerBusConfigurator> ConfigBus { get; set; }
		public bool UsingFluentMigrator { get; set; }

		public void Install(IWindsorContainer container, IConfigurationStore store)
		{
			if (null == RootAssembly)
			{
				throw new InvalidOperationException($"Cannot install '{this.GetType().FullName}' - no value set in {nameof(RootAssembly)} property.");
			}

			container.Kernel.Resolver.AddSubResolver(new CollectionResolver(container.Kernel, true));

			var registrations = GenerateRegistrations(container);
			container.Register(registrations.ToArray());

			if (UseMassTransit)
			{
				container.AddMassTransit(x =>
				{
					x.AddBus(context => BusFactory(context, container));
					ConfigBus?.Invoke(x);
				});
			}
			InstallMore(container, store);
		}

		protected virtual void InstallMore(IWindsorContainer container, IConfigurationStore store)
		{

		}

		protected virtual IBusControl BusFactoryCore(
			IWindsorContainer container,
			string rabbitHost,
			string rabbitUser,
			string rabbitPassword,
			Action<IRabbitMqBusFactoryConfigurator, IWindsorContainer> configure = null
		)
		{
			return Bus.Factory.CreateUsingRabbitMq(config =>
			{
				config.Host(rabbitHost, host =>
				{
					host.Username(rabbitUser);
					host.Password(rabbitPassword);
				});

				configure?.Invoke(config, container);
			});
		}

		private IEnumerable<IRegistration> GenerateRegistrations(IWindsorContainer container)
		{
			// setup mass transit to log to nlog
			LogContext.ConfigureCurrentLogContext(new NLogLoggerFactory());

			var scanThisAssembly = Classes.FromAssemblyInThisApplication(RootAssembly);

			if (ScanConsumers)
			{
				var consumerInterface = typeof(IConsumer<>);

				yield return scanThisAssembly.BasedOn(consumerInterface).WithService.AllInterfaces().WithServiceSelf();
			}
			if (UsingDatabase)
			{
				if (string.IsNullOrWhiteSpace(ConnectionString))
				{
					var message = $"Cannot initiate ef working with db, no connection string passed. Property {nameof(UsingDatabase)} should be used only with property {nameof(ConnectionString)} filled correctly.";
					throw new InvalidOperationException(message);
				}
				var builder = new DbContextOptionsBuilder();

				builder.UseNpgsql(ConnectionString);
				builder.UseLoggerFactory(DbLoggerFactory);

				yield return Component.For<DbContext>().ImplementedBy<CustomDbContext>();
				yield return Component.For<DbContextOptions>().Instance(builder.Options);
				yield return Component.For(typeof(IFilterAdapter<,>)).ImplementedBy(typeof(GenericFilterAdapter<,>));
				yield return scanThisAssembly.BasedOn(typeof(IFilterAdapterConcrete<,>)).WithServiceAllInterfaces();
				yield return scanThisAssembly.BasedOn(typeof(IAdditionalExtractConfiguration<,>)).WithService.DefaultInterfaces();
				yield return scanThisAssembly.BasedOn<IContextConfiguration>().WithService.FromInterface();

				if (UsingFluentMigrator)
				{
					container.Kernel.Register(
						Component.For<DbConnectionData>().Instance(new DbConnectionData { ConnectionString = ConnectionString })
					);
				}
			}
			if (UsingMapper)
			{
				yield return scanThisAssembly.BasedOn<Profile>().WithService.Base();
				yield return Component.For<IMapper>()
					.UsingFactoryMethod(context =>
						new MapperConfiguration(map => map.AddProfiles(context.ResolveAll<Profile>())).CreateMapper()
					).LifestyleSingleton();
			}

		}
	}
}