using MediatR;

namespace Kaizen.Skills.Api.Grade;

public class GradeRequirementRemoveRequest : IRequest<Unit>
{
    public GradeRequirementSelector Selector { get; set; }
}