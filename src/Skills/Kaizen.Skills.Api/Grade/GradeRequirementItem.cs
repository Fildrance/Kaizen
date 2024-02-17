namespace Kaizen.Skills.Api.Grade;

public class GradeRequirementItem
{
    public int Id { get; set; }
    public int SkillLevelId { get; set; }
    public int SkillLevelName { get; set; }
    public RequirementType RequirementType { get; set; }
}