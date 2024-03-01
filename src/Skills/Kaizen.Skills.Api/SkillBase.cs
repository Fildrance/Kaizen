using Kaizen.Skills.Api.SkillCategory;

namespace Kaizen.Skills.Api;

public abstract class SkillBase
{
    public int Id { get; set; }
    public bool IsActive { get; set; }

    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public abstract SkillAggregationLevel NodeType { get; }
}