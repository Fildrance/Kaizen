using System.Collections.Generic;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core;
using Enterprise.ApplicationBootstrap.Core.Api.Modules;
using Enterprise.ApplicationBootstrap.Core.Topology;
using Enterprise.ApplicationBootstrap.Telemetry;
using Enterprise.ApplicationBootstrap.WebApi;
using Enterprise.ApplicationBootstrap.WebApi.OpenAPi;
using Microsoft.AspNetCore.Builder;

namespace Kaizen.Skills.Service;

class Program : WebApiServiceProgramBase
{
    static Task Main(string[] args)
    {
        var webApplicationBuilder = WebApplication.CreateBuilder();
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
            new KeycloakModule(),
        };
}