using System;
using System.Threading.Tasks;
using Castle.Windsor;
using Castle.Windsor.MsDependencyInjection;
using Kaizen.ApiGateway.WindsorInstaller;
using Kaizen.Common.Service;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NLog.Web;

namespace Kaizen.ApiGateway
{
	public class Program
	{
		public static async Task Main(string[] args)
		{
			var loggerName = typeof(Program).FullName;

			await ServiceHelper.ExecuteInNlogWrap(
				loggerName,
				() => CreateHostBuilder(args).Build().RunAsync()
			);
		}

		public static IHostBuilder CreateHostBuilder(string[] args)
		{
			var rabbitHost = Environment.GetEnvironmentVariable("RABBITHOST");
			var rabbitUser = Environment.GetEnvironmentVariable("RABBITUSER");
			var rabbitPassword = Environment.GetEnvironmentVariable("RABBITPASSWORD");

			var installer = new KaizenApiGatewayInstaller(rabbitHost, rabbitUser, rabbitPassword);

			return Host.CreateDefaultBuilder(args)
				.ConfigureWebHostDefaults(webBuilder => webBuilder.UseStartup<Startup>())
				.ConfigureLogging(logging =>
				{
					logging.ClearProviders();
					logging.SetMinimumLevel(LogLevel.Trace);
				}).UseNLog()
				.UseServiceProviderFactory(hbc => new WindsorServiceProviderFactory())
				.ConfigureContainer<IWindsorContainer>((hbc, builder) => builder.Install(installer));
		}
	}
}
