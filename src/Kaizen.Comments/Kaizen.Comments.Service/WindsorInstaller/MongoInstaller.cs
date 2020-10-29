using Castle.MicroKernel;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;
using MongoDB.Driver;

namespace Kaizen.Comments.Service.WindsorInstaller
{
	public class MongoInstaller : IWindsorInstaller
    {
        private readonly string _connectionString;
        private readonly string _dbName;

        public MongoInstaller(string connectionString, string dbName)
		{
			_connectionString = connectionString;
            _dbName = dbName;
		}

		public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            BsonSerializer.RegisterSerializer(new GuidSerializer(BsonType.String));

            container.Register(
                Component.For<IMongoClient>().UsingFactoryMethod(k => new MongoClient(_connectionString)).LifestyleSingleton(),
                Component.For<IMongoDatabase>().UsingFactoryMethod(GetMongoDatabase)
            );
        }

        private IMongoDatabase GetMongoDatabase(IKernel kernel)
        {
            return kernel.Resolve<IMongoClient>().GetDatabase(_dbName);
        }
    }
}
