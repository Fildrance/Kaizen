using Kaizen.Skill.Api.Selector;

namespace Kaizen.Skill.Api.Create
{
	public class SkillCategoryUpdateContract
	{
		public string Name { get; set; }
		public string ShortDescription { get; set; }
		public bool? IsActive { get; set; }
		public SkillCategorySelector ToUpdate { get; set; }
	}
}
