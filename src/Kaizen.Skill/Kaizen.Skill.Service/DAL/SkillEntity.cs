using Kaizen.Skill.Service.DAL;

namespace Kaizen.Skill.Service
{
	public class SkillEntity : SkillBaseEntity
	{
		public SkillCategoryEntity Category { get; set; }
	}
}
