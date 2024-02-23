using MediatR;

namespace Kaizen.Skills.Api.SkillLevel;

public class SkillLevelUpdateRequest : IRequest<SkillLevelItem>
{
    public SkillLevelSelector ToUpdate { get; set; }
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public bool? IsActive { get; set; }

    public string Description { get; set; }
    public int? Weight { get; set; }
}