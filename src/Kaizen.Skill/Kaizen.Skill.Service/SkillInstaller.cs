using AutoMapper;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Skill.Api;
using Kaizen.Skill.Service.Consumers;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using MassTransit.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using NLog.Extensions.Logging;

namespace Kaizen.Skill.Service
{
	public class SkillInstaller : IWindsorInstaller
	{
		public static readonly LoggerFactory DbLoggerFactory = new LoggerFactory(new[] { new NLogLoggerProvider() });

		private string _rabbitHost;
		private string _rabbitUser;
		private string _rabbitPassword;
		private string _connectionString;

		public SkillInstaller(string rabbitHost, string rabbitUser, string rabbitPassword, string connectionString)
		{
			_rabbitHost = rabbitHost;
			_rabbitUser = rabbitUser;
			_rabbitPassword = rabbitPassword;
			_connectionString = connectionString;
		}

		public void Install(IWindsorContainer container, IConfigurationStore store)
		{
			// setup mass transit to log to nlog
			LogContext.ConfigureCurrentLogContext(new NLogLoggerFactory());

			container.AddMassTransit(x =>
			{
				x.AddBus(x => BusFactory(container));
				x.AddConsumersFromContainer(container);
			});

			var builder = new DbContextOptionsBuilder();

			builder.UseNpgsql(_connectionString);
			builder.UseLoggerFactory(DbLoggerFactory);

			var consumerInterface = typeof(IConsumer<>);
			var scanThisAssembly = Classes.FromAssemblyInThisApplication(GetType().Assembly);

			container.Register(
				Component.For<DbContext>().ImplementedBy<DbContext>(),
				Component.For<DbContextOptions>().Instance(builder.Options),
				Component.For<IMapper>().UsingFactoryMethod(context => new MapperConfiguration(map => map.AddProfiles(context.ResolveAll<Profile>())).CreateMapper()).LifestyleSingleton(),
				Component.For<SkillRepository>().ImplementedBy<SkillRepository>(),
				scanThisAssembly.BasedOn(consumerInterface).WithService.FromInterface().WithServiceSelf(),
				scanThisAssembly.BasedOn<Profile>().WithService.Base()
			);
		}

		public IBusControl BusFactory(IWindsorContainer container)
		{
			return Bus.Factory.CreateUsingRabbitMq(config =>
			{
				config.Host(_rabbitHost, host =>
				{
					host.Username(_rabbitUser);
					host.Password(_rabbitPassword);
				});

				config.ReceiveEndpoint(SkillConstants.IncomingQueueName, endpoint =>
				{
					endpoint.Consumer<SkillCategoryCreateConsumer>(container);
				});
			});
		}
	}
}