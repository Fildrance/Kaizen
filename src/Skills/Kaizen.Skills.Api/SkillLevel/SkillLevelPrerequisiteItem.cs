namespace Kaizen.Skills.Api.SkillLevel;

/// <summary>
/// One instance of skill level prerequisite.
/// </summary>
public class SkillLevelPrerequisiteItem
{
    /// <summary>
    /// For which skill level this requirement is.
    /// </summary>
    public int ForSkillLevelId { get; set; }

    /// <summary>
    /// What skill level is required.
    /// </summary>
    public int RequiredSkillId { get; set; }
}