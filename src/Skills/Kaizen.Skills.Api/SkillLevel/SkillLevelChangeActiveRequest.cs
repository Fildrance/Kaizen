using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.SkillLevel;

public class SkillLevelChangeActiveRequest : IRequest<SkillLevelItem>
{
    public SkillLevelSelector ToUpdate { get; set; }
    [NotNull]
    public bool? IsActive { get; set; }
}