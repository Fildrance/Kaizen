using System;
using System.IO;
using System.Threading.Tasks;
using Castle.Windsor;
using FluentMigrator.Runner;
using MassTransit;
using Microsoft.Extensions.DependencyInjection;
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
                await program.DoRunAsync(logger);
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

        private async Task DoRunAsync(ILogger logger)
        {
            var env = Environment.GetEnvironmentVariables();

            var host = env["DBHOST"];
            var port = env["DBPORT"] ?? 5432;
            var dbName = env["DBNAME"];
            var dbUser = env["DBUSER"];
            var dbPassword = env["DBPASSWORD"];

            var connectionString = $"Host={host};Port={port};Database={dbName};Username={dbUser};Password={dbPassword}";

            var rabbitHost = (string)env["RABBITHOST"];
            var rabbitUser = (string)env["RABBITUSER"];
            var rabbitPassword = (string)env["RABBITPASSWORD"];

            var installer = new SkillInstaller(rabbitHost, rabbitUser, rabbitPassword, connectionString);

            var container = new WindsorContainer()
                .Install(installer);

            // todo: move to common lib
            logger.Info($"Creating service provider for fluent migrator for connection string '{connectionString}'.");
            var serviceProvider = new ServiceCollection()
                // Add common FluentMigrator services
                .AddFluentMigratorCore()
                .ConfigureRunner(rb => rb
                    // Add SQLite support to FluentMigrator
                    .AddPostgres()
                    // Set the connection string
                    .WithGlobalConnectionString(connectionString)
                    // Define the assembly containing the migrations
                    .ScanIn(GetType().Assembly).For.Migrations())
                // Enable logging to console in the FluentMigrator way
                .AddLogging(lb => lb.AddFluentMigratorConsole())
                // Build the service provider
                .BuildServiceProvider(false);

            logger.Info("statring fluent migrator");
            using (var scope = serviceProvider.CreateScope())
            {
                // Instantiate the runner
                var runner = serviceProvider.GetRequiredService<IMigrationRunner>();

                // Execute the migrations
                runner.MigrateUp();
            }
            logger.Info("migrator finished updates");

            var busControl = container.Kernel.Resolve<IBusControl>();
            busControl.Start();

            var hostBuilder = new HostBuilder().ConfigureServices((hostContext, services) => { });
            await hostBuilder.RunConsoleAsync();
        }
    }
}
