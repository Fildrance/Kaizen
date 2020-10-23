using JetBrains.Annotations;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Items;
using MassTransit;
using System.Threading.Tasks;

namespace Kaizen.Skill.Api.Services
{
	/// <summary> Default implementation. </summary>
	public class SkillService : BusBasedService, ISkillService
	{
		public SkillService(IBusControl busControl) : base(busControl)
		{
		}

		public Task<SkillCategoryItem> Create(SkillCategoryCreateContract contract)
		{
			return DoRequest<SkillCategoryCreateContract, SkillCategoryItem>(contract);
		}

		public Task<Page<SkillCategoryItem>> Query(SkillCategoryFilterContract filter)
		{
			return DoRequest<SkillCategoryFilterContract, Page<SkillCategoryItem>>(filter);
		}

		public Task<SkillCategoryItem> Update([NotNull] SkillCategoryUpdateContract contract)
		{
			return DoRequest<SkillCategoryUpdateContract, SkillCategoryItem>(contract);
		}
	}
}
