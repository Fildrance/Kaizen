﻿using System.Collections.Generic;
using System.Linq;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.Resolvers.SpecializedResolvers;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using FluentValidation;
using Kaizen.Common.Service;
using MassTransit;
using MassTransit.Context;
using NLog.Extensions.Logging;

namespace Kaizen.ApiGateway.WindsorInstaller
{
	internal class KaizenApiGatewayInstaller : IWindsorInstaller
	{
		private string _rabbitHost;
		private string _rabbitUser;
		private string _rabbitPassword;

		public KaizenApiGatewayInstaller(string rabbitHost, string rabbitUser, string rabbitPassword)
		{
			_rabbitHost = rabbitHost;
			_rabbitUser = rabbitUser;
			_rabbitPassword = rabbitPassword;
		}

		public void Install(IWindsorContainer container, IConfigurationStore store)
		{
			// setup mass transit to log to nlog
			LogContext.ConfigureCurrentLogContext(new NLogLoggerFactory());

			container.Kernel.Resolver.AddSubResolver(new CollectionResolver(container.Kernel, true));

			container.AddMassTransit(x =>
			{
				x.UsingRabbitMq((context, cfg) =>
				{
					cfg.Host(
						"rabbitmq://" + _rabbitHost,
						x =>
						{
							x.Username(_rabbitUser);
							x.Password(_rabbitPassword);
						}
					);
					cfg.UseSendFilter(typeof(ValidatingSendFilter<>), context);
				});
			});

			container.Register(
				Component.For<IReadOnlyCollection<IValidator>>().UsingFactoryMethod(kernel => kernel.ResolveAll<IValidator>().ToArray()).LifestyleSingleton()
			);
			
			// to recieve messages we have to start bus (this includes receiving responses).
			container.Resolve<IBusControl>().Start();
		}
	}
}