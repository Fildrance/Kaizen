using AutoMapper;
using Enterprise.ApplicationBootstrap.Core.Api.Modules;
using Enterprise.ApplicationBootstrap.WebApi;
using Kaizen.Skills.Service.Mapping;
using Kaizen.Skills.Service.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Kaizen.Skills.Service;

public class SkillModule : IServiceCollectionAwareModule
{
    /// <inheritdoc />
    public string ModuleIdentity => "SkillModule";

    /// <inheritdoc />
    public void Configure(IServiceCollection services, IConfiguration configuration)
    {
        services.ConfigureHttpJsonOptions(options =>
        {
            options.SerializerOptions.PropertyNamingPolicy = null;
        });

        services.AddSingleton<IMapper, Mapper>();
        services.AddSingleton<Profile, SkillMappingProfile>();
        services.AddSingleton<AutoMapper.IConfigurationProvider>(sp =>
        {
            var profiles = sp.GetServices<Profile>();
            return new MapperConfiguration(e => e.AddProfiles(profiles));
        });

        services.AddSingleton<ISkillService, SkillService>();
        services.AddSingleton<IGradeService, GradeService>();

        services.AddCors(x =>
        {
            x.AddPolicy(WebApiServiceProgramBase.PolicyName,
                builder =>
                {
                    builder
                        .SetIsOriginAllowed(s => s.StartsWith("http://localhost:4200"))
                        .AllowAnyMethod()
                        .AllowAnyHeader()
                        .AllowCredentials();
                });
        });
    }
}