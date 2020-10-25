using JetBrains.Annotations;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.ToggleActive;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Api.Update;
using MassTransit;
using System.Threading.Tasks;
using Kaizen.Common.Service;

namespace Kaizen.Skill.Api.Services
{
	/// <summary> Default implementation. </summary>
	public class SkillService : BusBasedService, ISkillService
	{
		public SkillService(IBusControl busControl) : base(busControl)
		{
		}

		public Task<SkillCategoryItem> ChangeActvie([NotNull] SkillCategoryChangeActiveContract contract)
		{
			return DoRequest<SkillCategoryChangeActiveContract, SkillCategoryItem>(contract);
		}

		public Task<SkillItem> ChangeActvie([NotNull] SkillChangeActiveContract contract)
		{
			return DoRequest<SkillChangeActiveContract, SkillItem>(contract);
		}

		public Task<SkillCategoryItem> Create(SkillCategoryCreateContract contract)
		{
			return DoRequest<SkillCategoryCreateContract, SkillCategoryItem>(contract);
		}

		public Task<SkillItem> Create([NotNull] SkillCreateContract contract)
		{
			return DoRequest<SkillCreateContract, SkillItem>(contract);
		}

		public Task<Page<SkillCategoryItem>> Query(SkillCategoryFilterContract filter)
		{
			return DoRequest<SkillCategoryFilterContract, Page<SkillCategoryItem>>(filter);
		}

		public Task<SkillCategoryItem> Update([NotNull] SkillCategoryUpdateContract contract)
		{
			return DoRequest<SkillCategoryUpdateContract, SkillCategoryItem>(contract);
		}

		public Task<SkillItem> Update([NotNull] SkillUpdateContract contract)
		{
			return DoRequest<SkillUpdateContract, SkillItem>(contract);
		}
	}
}
