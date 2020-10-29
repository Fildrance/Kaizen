using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Common.DAL.Container;
using Kaizen.Common.Service;
using Kaizen.Skill.Api;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using NLog;

namespace Kaizen.Skill.Service.WindsorInstaller
{
	public class SkillInstaller : CommonInstaller
	{
		private static readonly ILogger Logger = LogManager.GetLogger(typeof(SkillInstaller).FullName);

		private readonly string _rabbitHost;
		private readonly string _rabbitUser;
		private readonly string _rabbitPassword;

		public SkillInstaller(string rabbitHost, string rabbitUser, string rabbitPassword, string connectionString) : base(typeof(SkillInstaller).Assembly)
		{
			_rabbitHost = rabbitHost;
			_rabbitUser = rabbitUser;
			_rabbitPassword = rabbitPassword;

			BusFactory = (busContext, container) => MyBusFactory(container);

			UseMassTransit = true;
			ScanConsumers = true;
			UsingMapper = true;
			UsingRelationalDatabase = true;
			UsingFluentMigrator = true;

			ConnectionString = connectionString;
		}

		protected override void InstallMore(IWindsorContainer container, IConfigurationStore store)
		{
			container.Register(
				Component.For<ISkillCategoryRepository>().ImplementedBy<SkillCategoryRepository>().OnCreate(x => x.ConfigureExtractor()),
				Component.For<ISkillRepository>().ImplementedBy<SkillRepository>().OnCreate(x => x.ConfigureExtractor()),
				Component.For<ISkillLevelRepository>().ImplementedBy<SkillLevelRepository>().OnCreate(x => x.ConfigureExtractor())
			);
		}

		public IBusControl MyBusFactory(IWindsorContainer container)
		{
			return BusFactoryCore(
				container,
				_rabbitHost,
				_rabbitUser,
				_rabbitPassword,
				(cfg, container) => cfg.AllServiceConsumersToEndpoint(SkillConstants.IncomingQueueName, container, RootAssembly, Logger)
			);
		}
	}
}