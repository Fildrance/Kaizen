using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper.Internal;
using Enterprise.ApplicationBootstrap.Core;
using Enterprise.ApplicationBootstrap.Core.Api.Modules;
using Enterprise.ApplicationBootstrap.Core.Topology;
using Enterprise.ApplicationBootstrap.Telemetry;
using Enterprise.ApplicationBootstrap.WebApi;
using Enterprise.ApplicationBootstrap.WebApi.OpenAPi;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

namespace Kaizen.Skills.Service;

public class Program : WebApiServiceProgramBase
{
    static Task Main(string[] args)
    {
        var webApplicationBuilder = WebApplication.CreateBuilder(args.Concat(new[] { "IsMigrationsEnabled=true" }).ToArray());
        return new Program().BuildApplication(webApplicationBuilder, args)
                            .RunAsync();
    }

    /// <inheritdoc />
    protected override TelemetrySetupInvokerBase GetInvoker()
    {
        return new TelemetrySetupInvoker();
    }

    /// <inheritdoc />
    protected override IReadOnlyCollection<IModule> GetWebApiModules(AppInitializationContext context)
        => new IModule[]
        {
            new SkillModule(),
            new SkillDataAccessLayerModule("SkillsRepository", context),
            new SkillEndpointConfigurationModule(),
            //new DefaultApiVersionModule(),
            new DefaultOpenApiModule(context),
            new KeycloakModule(context.Configuration),
        };

    /// <inheritdoc />
    protected override IConfigurationBuilder SetupConfiguration(IConfigurationBuilder configurationManager, IHostEnvironment hostEnvironment, string[] commandLineArgs)
    {
        configurationManager.AddCommandLine(commandLineArgs);
        return base.SetupConfiguration(configurationManager, hostEnvironment, commandLineArgs);
    }
}