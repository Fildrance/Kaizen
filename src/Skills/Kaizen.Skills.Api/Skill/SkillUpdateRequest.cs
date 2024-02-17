using MediatR;

namespace Kaizen.Skills.Api.Skill;

public class SkillUpdateRequest : IRequest<SkillItem>
{
    public SkillSelector ToUpdate { get; set; }
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public bool? IsActive { get; set; }
}