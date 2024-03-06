using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.SkillLevel;

/// <summary>
/// Request for attaching prerequisite to skill-level.
/// </summary>
public class SkillLevelPrerequisiteAttachRequest : IRequest<SkillLevelPrerequisiteItem>
{
    /// <summary>
    /// For which skill level this requirement is.
    /// </summary>
    [NotNull]
    public SkillLevelSelector ForSkillLevel { get; set; }

    /// <summary>
    /// What skill level is required.
    /// </summary>
    [NotNull]
    public SkillLevelSelector ReuireSkillLevel { get; set; }
}