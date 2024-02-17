namespace Kaizen.Skills.Service.DAL.Entities;

public class SkillLevelPrerequisiteEntity
{
    public int SkillLevelId { get; set; }
    public SkillLevelEntity ForSkillLevel { get; set; }
    public int RequiredSkillLevelId { get; set; }
    public SkillLevelEntity PrerequiteIs { get; set; }
}