using Kaizen.Skills.Api.SkillCategory;

namespace Kaizen.Skills.Api.SkillLevel;

public class SkillLevelItem : SkillBase
{
    public int Weight { get; set; }
    public string Description { get; set; }

    public SkillLevelPrerequisiteItem[] Prerequisites { get; set; }

    public override SkillAggregationLevel NodeType => SkillAggregationLevel.SkillLevel;
}