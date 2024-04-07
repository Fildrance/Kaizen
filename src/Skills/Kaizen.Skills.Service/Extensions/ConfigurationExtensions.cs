using Microsoft.Extensions.Configuration;

namespace Kaizen.Skills.Service.Extensions;

/// <summary> Extension methods for <see cref="IConfiguration"/>. </summary>
public static class ConfigurationExtensions
{
    /// <summary> Checks if application configuration have 'dryRun' flag. </summary>
    public static bool IsDryRun(this IConfiguration configuration)
    {
        return bool.TryParse(configuration[SwaggerHostFactory.DryRunKeyName], out var isDryRun) && isDryRun;
    }
}