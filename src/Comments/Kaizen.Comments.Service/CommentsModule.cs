using Enterprise.ApplicationBootstrap.Core.Api.Modules;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using MongoDB.Bson.Serialization.Serializers;
using MongoDB.Bson.Serialization;
using MongoDB.Bson;
using MongoDB.Driver;

namespace Kaizen.Comments.Service;

internal class CommentsModule : IServiceCollectionAwareModule
{
    /// <inheritdoc />
    public string ModuleIdentity => "CommentsModule";

    /// <inheritdoc />
    public void Configure(IServiceCollection services, IConfiguration configuration)
    {
        BsonSerializer.RegisterSerializer(new GuidSerializer(BsonType.String));

        services.Configure<MongoSettings>(configuration.GetSection(MongoSettings.SectionName));

        services.AddSingleton<IMongoClient>(sp => new MongoClient(configuration.GetConnectionString("CommentsMongo")));
        services.AddSingleton<IMongoDatabase>(sp =>
        {
            var dbName = sp.GetRequiredService<IOptions<MongoSettings>>()
                           .Value
                           .DbName;
            return sp.GetRequiredService<IMongoClient>()
                     .GetDatabase(dbName);
        });
    }
}

internal class MongoSettings
{
    public const string SectionName = "MongoSettings";

    public string DbName { get; set; }
}