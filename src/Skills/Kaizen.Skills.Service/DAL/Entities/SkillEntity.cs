using System.Collections.Generic;

namespace Kaizen.Skills.Service.DAL.Entities;

public class SkillEntity : SkillBaseEntity
{
    /// <inheritdoc />
    public SkillEntity()
    {
    }

    /// <inheritdoc />
    public SkillEntity(string name, string description, SkillCategoryEntity category)
    {
        Name = name;
        Description = description;
        Category = category;
    }

    public string Description { get; set; }

    public int CategoryId { get; set; }

    public SkillCategoryEntity Category { get; set; }
    public IList<SkillLevelEntity> SkillLevels { get; set; }
}