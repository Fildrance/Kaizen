using System;
using System.IO;
using Castle.Windsor;
using Castle.Windsor.MsDependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NLog;
using NLog.Config;
using NLog.Web;

namespace Kaizen.ApiGateway
{
	public class Program
    {
        public static void Main(string[] args)
        {
            var curDir = Directory.GetCurrentDirectory();
            var nlogFilePath = Path.Combine(curDir, "nlog.config");
            var cfg = new XmlLoggingConfiguration(nlogFilePath);
            LogManager.Configuration = cfg;
            var logger = LogManager.GetLogger(typeof(Program).FullName);
            try
            {
                logger.Debug("init main");
                CreateHostBuilder(args).Build().Run();
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

        public static IHostBuilder CreateHostBuilder(string[] args)
        {
            var rabbitHost = Environment.GetEnvironmentVariable("RABBITHOST");
            var rabbitUser = Environment.GetEnvironmentVariable("RABBITUSER");
            var rabbitPassword = Environment.GetEnvironmentVariable("RABBITPASSWORD");

            return Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                }).ConfigureLogging(logging =>
                {
                    logging.ClearProviders();
                    logging.SetMinimumLevel(Microsoft.Extensions.Logging.LogLevel.Trace);
                }).UseNLog()
                .UseServiceProviderFactory(hbc => new WindsorServiceProviderFactory())
                .ConfigureContainer<IWindsorContainer>((hbc, builder) =>
                {
                    builder.Install(new KaizenApiGatewayInstaller(rabbitHost, rabbitUser, rabbitPassword));
                });
        }
    }
}
