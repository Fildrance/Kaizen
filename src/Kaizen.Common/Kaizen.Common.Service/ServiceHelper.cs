using System;
using System.IO;
using System.Threading.Tasks;
using Castle.MicroKernel.Registration;
using Castle.Windsor;
using Castle.Windsor.MsDependencyInjection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using NLog;
using NLog.Config;

namespace Kaizen.Common.Service
{
    public static class ServiceHelper
    {
        public static async Task ExecuteInNlogWrap(string loggerName, Func<Task> hostRunTaskFactory)
        {
            var curDir = Directory.GetCurrentDirectory();
            var cfg = new XmlLoggingConfiguration(Path.Combine(curDir, "nlog.config"));
            LogManager.Configuration = cfg;
            var logger = LogManager.GetLogger(loggerName);
            try
            {
                await hostRunTaskFactory();
            }
            catch (Exception exception)
            {
                //NLog: catch setup errors
                logger.Error(exception, "Stopped program because of exception");
                throw;
            }
            finally
            {
                // Ensure to flush and stop internal timers/threads before application-exit (Avoid segmentation fault on Linux)
                LogManager.Shutdown();
            }
        }

        public static Task CreateConsoleHostAndRun<TService>(Action<IServiceCollection> configureServices, params IWindsorInstaller[] installers) where TService : class, IHostedService
        {
            var hostBuilder = new HostBuilder()
                .ConfigureServices((_, serviceCollection) => configureServices?.Invoke(serviceCollection))
                .UseServiceProviderFactory(hbc => new WindsorServiceProviderFactory())
                .ConfigureContainer<IWindsorContainer>((hbc, builder) => builder.Install(installers))
                .ConfigureServices((hostContext, services) => services.AddHostedService<TService>());
            return hostBuilder.RunConsoleAsync();
        }

        public static Task CreateConsoleHostAndRun<TService>(params IWindsorInstaller[] installers) where TService : class, IHostedService
        {
           return CreateConsoleHostAndRun<TService>(null, installers);
        }
    }
}