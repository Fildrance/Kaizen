using Castle.MicroKernel.Registration;
using Castle.MicroKernel.Resolvers.SpecializedResolvers;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Common.Service;
using Kaizen.Skill.Api;
using Kaizen.Skill.Api.Create;
using MassTransit;

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

				});
				x.AddRequestClient<SkillCategoryCreateContract>(RabbitUriHelper.QueueUri(SkillConstants.IncomingQueueName));
			});

			// to recieve messages we have to start bus (this includes receiving responses).
			container.Resolve<IBusControl>().Start();
		}
	}
}