using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Common.Container;
using Kaizen.Skill.Api;
using Kaizen.Skill.Service.Consumers;
using Kaizen.Skill.Service.DAL;
using MassTransit;

namespace Kaizen.Skill.Service
{
	public class SkillInstaller : CommonInstaller
	{
		private string _rabbitHost;
		private string _rabbitUser;
		private string _rabbitPassword;

		public SkillInstaller(string rabbitHost, string rabbitUser, string rabbitPassword, string connectionString)
		{
			_rabbitHost = rabbitHost;
			_rabbitUser = rabbitUser;
			_rabbitPassword = rabbitPassword;

			this.BusFactory = (busContext, container) => MyBusFactory(container);

			this.UseMassTransit = true;
			this.ScanConsumers = true;
			this.UsingMapper = true;
			this.UsingDatabase = true;
			this.ConnectionString = connectionString;
			this.RootAssembly = GetType().Assembly;
		}

		protected override void InstallMore(IWindsorContainer container, IConfigurationStore store)
		{
			container.Register(
				Component.For<SkillRepository>().ImplementedBy<SkillRepository>()
			);
		}

		public IBusControl MyBusFactory(IWindsorContainer container)
		{
			return BusFactoryCore(
				container,
				_rabbitHost,
				_rabbitUser,
				_rabbitPassword,
				(cfg, container) =>
				{
					cfg.ReceiveEndpoint(SkillConstants.IncomingQueueName, endpoint => endpoint.Consumer<SkillCategoryCreateConsumer>(container));
				}
			);
		}
	}
}