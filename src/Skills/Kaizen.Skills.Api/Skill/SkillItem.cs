using System.Collections.Generic;
using Kaizen.Skills.Api.SkillLevel;

namespace Kaizen.Skills.Api.Skill;

public class SkillItem : SkillBase
{
    public override string NodeType => "skill";

    public IList<SkillLevelItem> Items { get; set; }
}