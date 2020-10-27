using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.Update
{
	public class SkillLevelUpdateContract
	{
		public SkillLevelSelector ToUpdate { get; set; }
		public string Name { get; set; }
		public string ShortDescription { get; set; }
		public bool? IsActive { get; set; }

		public string FullDescription { get; set; }
		public int? Weight { get; set; }
	}
}
