using System;
using System.Threading.Tasks;
using MassTransit;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using NLog;

namespace Kaizen.ApiGateway
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var rabbitUser = Environment.GetEnvironmentVariable("RABBITUSER");
            var rabbitPassword = Environment.GetEnvironmentVariable("RABBITPASSWORD");
            var rabbitHost = Environment.GetEnvironmentVariable("RABBITHOST");

            services.AddControllers();
            services.AddMassTransit(x =>
            {
                x.AddConsumer<MyConsumer>();
                x.AddRequestClient<SubmitOrder>();
                x.UsingRabbitMq((context, cfg) =>
                {
                    cfg.Host(
                        "rabbitmq://" + rabbitHost,
                        x =>
                        {
                            x.Username(rabbitUser);
                            x.Password(rabbitPassword);
                        }
                    );
                    cfg.ReceiveEndpoint("test1", e =>
                    {
                        e.ConfigureConsumer<MyConsumer>(context);
                    });
                });
            });

            services.AddMassTransitHostedService();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            //app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }

    public class SubmitOrder
    {
        public string S { get; set; }
        public SubmitOrder(string s)
        {
            S = s;
        }

        public override string ToString()
        {
            return S;
        }
    }

    public class MyConsumer : IConsumer<SubmitOrder>
    {
        static readonly NLog.ILogger Logger = LogManager.GetLogger(typeof(MyConsumer).FullName);
        public Task Consume(ConsumeContext<SubmitOrder> context)
        {
            Logger.Info("consumed " + context.Message);
            return Task.CompletedTask;
        }
    }
}
