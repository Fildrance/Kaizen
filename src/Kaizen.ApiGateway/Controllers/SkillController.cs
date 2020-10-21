using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Api.Services;
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

		private readonly ISkillService _service;

		public SkillController(ISkillService service)
		{
			_service = service ?? throw new ArgumentNullException(nameof(service));
		}

		[HttpPost]
		[Route("api/skill-category")]
		public Task<SkillCategoryItem> Create(SkillCategoryCreateContract contract)
		{
			return _service.Create(contract);
		}

		[HttpGet]
		[Route("api/skill-category/list")]
		public Task<Page<SkillCategoryItem>> List(SkillCategoryFilterContract filter)
		{
			return _service.Query(filter);
		}
	}
}
