using Kaizen.Skill.Service.DAL;
using System.Collections.Generic;

namespace Kaizen.Skill.Service
{
	public class SkillEntity : SkillBaseEntity
	{
		public SkillCategoryEntity Category { get; set; }
		public IList<SkillLevelEntity> SkillLevels { get; set; }
	}
}
