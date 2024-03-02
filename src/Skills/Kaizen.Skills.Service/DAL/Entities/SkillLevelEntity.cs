using System.Collections.Generic;

namespace Kaizen.Skills.Service.DAL.Entities;

public class SkillLevelEntity : SkillBaseEntity
{
    /// <inheritdoc />
    public SkillLevelEntity()
    {
    }

    /// <inheritdoc />
    public SkillLevelEntity(string name, string shortDescription, SkillEntity skill)
    {
        Name = name;
        ShortDescription = shortDescription;
        Skill = skill;
    }

    public int SkillId { get; set; }
    public SkillEntity Skill { get; set; }

    public int? Weight { get; set; }
    public string Description { get; set; }

    public IList<SkillLevelPrerequisiteEntity> Prerequisites { get; set; }
}