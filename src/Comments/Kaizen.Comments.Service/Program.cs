using System.Collections.Generic;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core;
using Enterprise.ApplicationBootstrap.Core.Api.Modules;
using Enterprise.ApplicationBootstrap.Core.Topology;
using Enterprise.ApplicationBootstrap.Telemetry;
using Enterprise.ApplicationBootstrap.WebApi;
using Microsoft.AspNetCore.Builder;

namespace Kaizen.Comments.Service;

class Program : WebApiServiceProgramBase
{
    static Task Main(string[] args)
    {
        var app = WebApplication.CreateBuilder();
        return new Program().BuildApplication(app, args)
                            .RunAsync();
    }

    /// <inheritdoc />
    protected override TelemetrySetupInvokerBase GetInvoker()
        => new TelemetrySetupInvoker();

    /// <inheritdoc />
    protected override IReadOnlyCollection<IModule> GetWebApiModules(AppInitializationContext context)
    {
        return new IModule[]
        {
            new CommentsModule(),
            new CommentsEndpointModule()
        };
    }
}