using Kaizen.ApiGateway.Middleware;
using MassTransit;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;

namespace Kaizen.ApiGateway
{
	public class Startup
	{
		public Startup(IConfiguration configuration, IWebHostEnvironment _)
		{
			Configuration = configuration;
		}

		public IConfiguration Configuration { get; }

		public void ConfigureServices(IServiceCollection services)
		{
			services.AddControllers()
				.AddJsonOptions(options => options.JsonSerializerOptions.PropertyNamingPolicy = null);

			services.AddMassTransitHostedService();

			services.AddAuthentication("Bearer")
				.AddJwtBearer("Bearer", options =>
				{
					var authority = Configuration.GetValue<string>("TokenAuthority");
					options.Authority = $"{authority}/";
					options.TokenValidationParameters = new TokenValidationParameters
					{
						ValidateAudience = false
					};
				});
			services.AddAuthorization(options =>
			{
				options.AddPolicy(ApiGatewayConstants.ApiScopePolicyConstant, policy =>
				{
					policy.RequireAuthenticatedUser();
					policy.RequireClaim("scope", "kaizen-api");
				});
			});
			services.AddCors(options =>
			{
				options.AddPolicy("default", policy =>
				{
					var appUri = Configuration.GetValue<string>("AppUri");

					policy.WithOrigins(appUri)
						.AllowAnyHeader()
						.AllowAnyMethod();
				});
			});
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			app.UseMiddleware<RequestLoggingMiddleware>();

			app.UseMiddleware<ValidationExceptionPackagingMiddleware>();

			app.UseRouting();

			app.UseAuthentication();
			app.UseAuthorization();

			app.UseEndpoints(endpoints =>
			{
				endpoints.MapControllers()
					.RequireAuthorization(ApiGatewayConstants.ApiScopePolicyConstant);
			});
		}
	}
}
