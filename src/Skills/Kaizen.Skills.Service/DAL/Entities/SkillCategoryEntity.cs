using System.Collections.Generic;

namespace Kaizen.Skills.Service.DAL.Entities;

public class SkillCategoryEntity : SkillBaseEntity
{
    public SkillCategoryEntity()
    {
    }

    public SkillCategoryEntity(string name, string shortDescription)
    {
        Name = name;
        ShortDescription = shortDescription;
    }

    public IList<SkillEntity> Skils { get; set; }
}