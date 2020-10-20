using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Common.DAL.Container;
using Kaizen.Common.DAL.Discover.EntityExtractor;
using Kaizen.Skill.Api;
using Kaizen.Skill.Service.Consumers;
using Kaizen.Skill.Service.DAL;
using MassTransit;

namespace Kaizen.Skill.Service.WindsorInstaller
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

			BusFactory = (busContext, container) => MyBusFactory(container);

			UseMassTransit = true;
			ScanConsumers = true;
			UsingMapper = true;
			UsingDatabase = true;
			UsingFluentMigrator = true;

			ConnectionString = connectionString;
			RootAssembly = GetType().Assembly;
		}

		protected override void InstallMore(IWindsorContainer container, IConfigurationStore store)
		{
			container.Register(
				Component.For<SkillRepository>().ImplementedBy<SkillRepository>().OnCreate(x => x.ConfigureExtractor()),
				Classes.FromAssembly(GetType().Assembly).BasedOn(typeof(IAdditionalExtractConfiguration<,>)).WithService.DefaultInterfaces()
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