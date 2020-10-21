using Kaizen.Common.Service;

namespace Kaizen.Skill.Api.Filter
{
	public class SkillCategoryFilterContract : FilterContractBase
	{
		public IncludeActiveOption? IncludeActive { get; set; }
	}
}