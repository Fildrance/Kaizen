using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.Create
{
	public class SkillCreateContract
	{
		public string Name { get; set; }
		public string ShortDescription { get; set; }
		public SkillCategorySelector Parent { get; set; }
	}
}
