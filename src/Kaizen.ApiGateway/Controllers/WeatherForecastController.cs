using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Kaizen.ApiGateway;
using MassTransit;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using NLog;

namespace TestMassTransit.Controllers
{
    [ApiController]
    public class WeatherForecastController : ControllerBase
    {
        static readonly NLog.ILogger Logger = LogManager.GetLogger(typeof(WeatherForecastController).FullName);
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;
        IPublishEndpoint _publishEndpoint;
        ISendEndpointProvider _sendEndpointProvider;

        public WeatherForecastController(ILogger<WeatherForecastController> logger, IPublishEndpoint publishEndpoint, ISendEndpointProvider sendEndpointProvider)
        {
            _logger = logger;
            _publishEndpoint = publishEndpoint;
            _sendEndpointProvider = sendEndpointProvider;
        }

        [HttpGet]
        [Route("api/weather")]
        public async Task<IEnumerable<WeatherForecast>> Get()
        {
            Logger.Info("goin to start sendin stuff");
            var k = new SubmitOrder("i was talking to your mom!");
            await _publishEndpoint.Publish<SubmitOrder>(k);

            Logger.Info("sent PUBLISH");

            var ep = await _sendEndpointProvider.GetSendEndpoint(new Uri("queue:test1"));
            var w = new SubmitOrder("no no no no! look at the top of his head!");
            await ep.Send<SubmitOrder>(w);

            Logger.Info("sent SEND");

            return DoOtherStuff();
        }

        private IEnumerable<WeatherForecast> DoOtherStuff()
        {
            var rng = new Random();
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();
        }
    }
    
    public class WeatherForecast
    {
        public DateTime Date { get; set; }

        public int TemperatureC { get; set; }

        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

        public string Summary { get; set; }
    }
}