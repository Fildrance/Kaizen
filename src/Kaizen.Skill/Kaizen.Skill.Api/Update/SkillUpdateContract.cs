using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.Update
{
	public class SkillUpdateContract
	{
		public SkillSelector ToUpdate { get; set; }
		public string Name { get; set; }
		public string ShortDescription { get; set; }
		public bool? IsActive { get; set; }		
	}
}
