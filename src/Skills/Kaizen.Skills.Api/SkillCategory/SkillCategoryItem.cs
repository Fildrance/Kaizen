using System.Collections.Generic;
using Kaizen.Skills.Api.Skill;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillCategoryItem : SkillBase
{
    public IList<SkillItem> Items { get; set; }

    /// <inheritdoc />
    public override SkillAggregationLevel NodeType => SkillAggregationLevel.SkillCategory;
}