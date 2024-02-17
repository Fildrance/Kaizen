using Kaizen.Skills.Api.SkillLevel;
using MediatR;

namespace Kaizen.Skills.Api.Grade;

public class GradeRequirementAddRequest : IRequest<GradeRequirementItem>
{
    public SkillLevelSelector SkillLevel { get; set; }
}