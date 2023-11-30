using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Comments.Api;
using Kaizen.Comments.Service.DAL;
using Kaizen.Common.DAL.Container;
using Kaizen.Common.Service;
using MassTransit;
using NLog;

namespace Kaizen.Comments.Service.WindsorInstaller
{
	public class CommentsInstaller : CommonInstaller
	{
		private static readonly ILogger Logger = LogManager.GetLogger(typeof(CommentsInstaller).FullName);

		private readonly string _rabbitHost;
		private readonly string _rabbitUser;
		private readonly string _rabbitPassword;

		public CommentsInstaller(string rabbitHost, string rabbitUser, string rabbitPassword) : base(typeof(CommentsInstaller).Assembly)
		{
			_rabbitHost = rabbitHost;
			_rabbitUser = rabbitUser;
			_rabbitPassword = rabbitPassword;

			BusFactory = (busContext, container) => MyBusFactory(container);

			UseMassTransit = true;
			ScanConsumers = true;
			UsingMapper = true;
			UsingRelationalDatabase = false;
			UsingFluentMigrator = false;
		}

		protected override void InstallMore(IWindsorContainer container, IConfigurationStore store)
		{
			container.Register(
				Component.For(typeof(IMongoRepository<>)).ImplementedBy(typeof(MongoRepository<>))
			);
		}

		public IBusControl MyBusFactory(IWindsorContainer container)
		{
			return BusFactoryCore(
				container,
				_rabbitHost,
				_rabbitUser,
				_rabbitPassword
				//(cfg, cont) => cfg.AllServiceConsumersToEndpoint(CommentsConstants.CommentsQueueName, cont, RootAssembly, Logger)
			);
		}
	}
}
