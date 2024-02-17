using Kaizen.Skills.Api.Skill;
using MediatR;

namespace Kaizen.Skills.Api.SkillLevel;

public class SkillLevelCreateRequest : IRequest<SkillLevelItem>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }

    public string FullDescription { get; set; }
    public int? Weight { get; set; }

    public SkillSelector Parent { get; set; }
}