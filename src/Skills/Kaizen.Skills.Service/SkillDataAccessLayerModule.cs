using Enterprise.ApplicationBootstrap.Core;
using Enterprise.ApplicationBootstrap.DataAccessLayer.PgSql;
using FluentMigrator.Runner.VersionTableInfo;
using Kaizen.Skills.Service.DAL;
using Kaizen.Skills.Service.DAL.Grade;
using Kaizen.Skills.Service.DAL.Skill;
using Kaizen.Skills.Service.DAL.Way;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Kaizen.Skills.Service;

/// <summary> Module for pg sql adapter for EntityFramework.</summary>
/// <param name="connectionStringName">Name for connection string of database field in configuration under ConnectionStrings section.</param>
/// <param name="context">App initialization context.</param>
/// <param name="enableLogging">Marker, is entity framework logging enabled.</param>
public class SkillDataAccessLayerModule(string connectionStringName, AppInitializationContext context, bool enableLogging = false)
    : NpgsqlDataAccessLayerModuleBase(connectionStringName, context)
{
    /// <inheritdoc />
    public override bool IsEntityFrameworkLoggingEnabled => enableLogging;

    /// <inheritdoc />
    public override void Configure(IServiceCollection services, IConfiguration configuration)
    {
        base.Configure(services, configuration);

        services.AddSingleton<ISkillCategoryRepository, SkillCategoryRepository>();
        services.Decorate<ISkillCategoryRepository>(repository =>
        {
            repository.ConfigureExtractor();
            return repository;
        });
        services.AddSingleton<ISkillRepository, SkillRepository>();
        services.Decorate<ISkillRepository>(repository =>
        {
            repository.ConfigureExtractor();
            return repository;
        });
        services.AddSingleton<ISkillLevelRepository, SkillLevelRepository>();
        services.Decorate<ISkillLevelRepository>(repository =>
        {
            repository.ConfigureExtractor();
            return repository;
        });

        services.AddSingleton<IGradeRepository, GradeRepository>();
        services.Decorate<IGradeRepository>(repository =>
        {
            repository.ConfigureExtractor();
            return repository;
        });
        services.AddSingleton<IWayRepository, WayRepository>();
        services.Decorate<IWayRepository>(repository =>
        {
            repository.ConfigureExtractor();
            return repository;
        });

        services.AddScoped(typeof(IVersionTableMetaData), typeof(VersionTable));
    }
}