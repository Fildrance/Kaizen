using JetBrains.Annotations;
using Kaizen.Skill.Api.Selector;

namespace Kaizen.Skill.Api.Deactivate
{
	public class SkillCategoryChangeActiveContract
	{
		[NotNull]
		public SkillCategorySelector ToUpdate { get; set; }
		[NotNull]
		public bool? IsActive { get; set; }
	}
}
