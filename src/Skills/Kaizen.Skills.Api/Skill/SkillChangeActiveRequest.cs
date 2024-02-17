using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.Skill;

public class SkillChangeActiveRequest : IRequest<SkillItem>
{
    public SkillSelector ToUpdate { get; set; }
    [NotNull]
    public bool? IsActive { get; set; }
}