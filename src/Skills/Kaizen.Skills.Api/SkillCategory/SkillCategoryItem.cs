using System.Collections.Generic;
using Kaizen.Skills.Api.Skill;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillCategoryItem : SkillBase
{
    public override string NodeType => "skill-category";

    public IList<SkillItem> Items { get; set; }
}