using System.Collections.Generic;

namespace Kaizen.Skill.Service.DAL
{
	public class SkillCategoryEntity : SkillBaseEntity
    {
        public IList<SkillEntity> Skils { get; set; }
    }
}
