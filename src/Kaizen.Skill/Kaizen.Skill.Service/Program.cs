using System;
using System.IO;
using System.Threading.Tasks;
using Castle.Windsor;
using MassTransit;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using NLog;

namespace Kaizen.Skill.Service
{
    class Program
    {
        static async Task Main(string[] args)
        {

            var curDir = Directory.GetCurrentDirectory();
            var cfg = new NLog.Config.XmlLoggingConfiguration(Path.Combine(curDir, "nlog.config"));
            LogManager.Configuration = cfg;
            var logger = LogManager.GetLogger(typeof(Program).FullName);
            try
            {
                logger.Debug("init main");
                var program = new Program();
                await program.DoRunAsync();
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

        private async Task DoRunAsync()
        {
            var env = Environment.GetEnvironmentVariables();

            var host = env["DBHOST"];
            var port = env["DBPORT"] ?? 5432;
            var dbName = env["DBNAME"];

            var connectionString = $"Host={host};Port={port};Database={dbName};Username=postgres;Password=admin128";

            var rabbitHost = (string)env["RABBITHOST"];
            var rabbitUser = (string)env["RABBITUSER"];
            var rabbitPassword = (string)env["RABBITPASSWORD"];

            var installer = new SkillInstaller(rabbitHost, rabbitUser, rabbitPassword, connectionString);

            var container = new WindsorContainer()
                .Install(installer);

            var busControl = container.Kernel.Resolve<IBusControl>();
            busControl.Start();

            var hostBuilder = new HostBuilder().ConfigureServices((hostContext, services) => { });
            await hostBuilder.RunConsoleAsync();
        }
    }
}
