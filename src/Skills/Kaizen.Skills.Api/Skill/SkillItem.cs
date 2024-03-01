using System.Collections.Generic;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillLevel;

namespace Kaizen.Skills.Api.Skill;

public class SkillItem : SkillBase
{
    public IList<SkillLevelItem> Items { get; set; }

    /// <inheritdoc />
    public override SkillAggregationLevel NodeType => SkillAggregationLevel.Skill;
}