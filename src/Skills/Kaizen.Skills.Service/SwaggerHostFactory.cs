using JetBrains.Annotations;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;

namespace Kaizen.Skills.Service;

/// <summary> Host factory for swagger generation. </summary>
[UsedImplicitly]
public class SwaggerHostFactory : Program
{
    /// <summary> Key for marker of dry application launch - the one that is used for local analysis and should not invoke integrated systems. </summary>
    public const string DryRunKeyName = "dryRun";

    /// <summary> Creates host for swagger generation. </summary>
    [UsedImplicitly]
    public static IHost CreateHost()
    {
        var commandLineArguments = new[] { $"--{DryRunKeyName} true", "--IsMigrationsEnabled false" };
        var webApplicationBuilder = WebApplication.CreateBuilder(commandLineArguments);
        return new SwaggerHostFactory()
            .BuildApplication(webApplicationBuilder, commandLineArguments);
    }
}