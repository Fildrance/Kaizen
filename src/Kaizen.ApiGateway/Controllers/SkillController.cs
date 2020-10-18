using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.Items;
using MassTransit;
using Microsoft.AspNetCore.Mvc;
using NLog;
using System.Threading.Tasks;

namespace Kaizen.ApiGateway.Controllers
{
	[ApiController]
    public class SkillController : ControllerBase
    {
        private static readonly ILogger Logger = LogManager.GetLogger(typeof(SkillController).FullName);

        IRequestClient<SkillCategoryCreateContract> _client;

        public SkillController(IRequestClient<SkillCategoryCreateContract> client)
        {
            _client = client;
        }

        [HttpPost]
        [Route("api/skill-category")]
        public async Task<SkillCategoryItem> Create(SkillCategoryCreateContract contract)
        {
            Logger.Trace("Received request to create SkillCategory.");
            var resp = await _client.GetResponse<SkillCategoryItem>(contract);
            Logger.Trace($"Received response - created SkillCategory with id {resp.Message.Id}.");
            return resp.Message;
        }
    }
}
