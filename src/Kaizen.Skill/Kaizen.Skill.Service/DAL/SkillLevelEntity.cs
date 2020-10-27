namespace Kaizen.Skill.Service.DAL
{
	public class SkillLevelEntity : SkillBaseEntity
	{
		public SkillEntity Skill { get; set; }

		public int? Weight { get; set; }
		public string FullDescription { get; set; }
	}
}
