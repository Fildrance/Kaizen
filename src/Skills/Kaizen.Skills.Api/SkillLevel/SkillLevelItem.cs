namespace Kaizen.Skills.Api.SkillLevel;

public class SkillLevelItem : SkillBase
{
    public int Weight { get; set; }
    public string FullDescription { get; set; }

    public override string NodeType => "skill-level";
}