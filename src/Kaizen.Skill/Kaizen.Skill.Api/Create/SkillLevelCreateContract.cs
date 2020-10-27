using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.Create
{
	public class SkillLevelCreateContract
	{
		public string Name { get; set; }
		public string ShortDescription { get; set; }

		public string FullDescription { get; set; }
		public int? Weight { get; set; }

		public SkillSelector Parent { get; set; }
	}
}
