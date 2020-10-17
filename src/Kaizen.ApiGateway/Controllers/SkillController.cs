using Kaizen.Skill.Api;
using Kaizen.Skill.Api.Create;
using MassTransit;
using Microsoft.AspNetCore.Mvc;
using NLog;
using System;
using System.Threading.Tasks;

namespace Kaizen.ApiGateway.Controllers
{
	[ApiController]
	public class SkillController : ControllerBase
	{
		private static readonly ILogger Logger = LogManager.GetLogger(typeof(SkillController).FullName);

		ISendEndpointProvider _sendEndpointProvider;

		public SkillController(ISendEndpointProvider sendEndpointProvider)
		{
			_sendEndpointProvider = sendEndpointProvider;
		}

        [HttpGet]
        [Route("api/skill-category")]
        public async Task<int> Get()
        {
            // todo: replace with actual call
            Logger.Info("goin to start sendin stuff");

            var ep = await _sendEndpointProvider.GetSendEndpoint(new Uri("queue:" + SkillConstants.IncomingQueueName));
            var contract = new SkillCategoryCreateContract
            {
                Name = "cat1"
            };
            await ep.Send(contract);

            Logger.Info("sent SEND");

            return -1;
        }
    }
}
