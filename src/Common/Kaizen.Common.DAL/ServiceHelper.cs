using System.Threading.Tasks;
using Castle.MicroKernel.Registration;
using Microsoft.Extensions.Hosting;
using Kaizen.Common.Service;
using Microsoft.Extensions.DependencyInjection;
using FluentMigrator.Runner;
using System.Reflection;

namespace Kaizen.Common.DAL;

public static class ServiceDALHelper
{
    public static Task CreateConsoleHostWithMigratorAndRun<TService>(params IWindsorInstaller[] installers) where TService : class, IHostedService
    {
        return ServiceHelper.CreateConsoleHostAndRun<TService>(
            serviceCollection => serviceCollection
                                 // Add common FluentMigrator services
                                 .AddFluentMigratorCore()
                                 .ConfigureRunner(
                                     rb =>
                                         rb.AddPostgres()
                                           .WithGlobalConnectionString(x => x.GetService<DbConnectionData>().ConnectionString)
                                           // Define the assembly containing the migrations
                                           .ScanIn(Assembly.GetEntryAssembly()).For.Migrations()
                                 ),
            // Enable logging to console in the FluentMigrator way
            installers
        );
    }
}