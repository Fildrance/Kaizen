using Kaizen.Skills.Api.SkillCategory;

namespace Kaizen.Skills.Api.SkillTree;

public class SkillTreeItem
{
    public int Id { get; set; }

    public string Name { get; set; }
    public bool IsActive { get; set; }
    public SkillAggregationLevel NodeType { get; set; }

    public SkillTreeItem[] Items { get; set; }
}