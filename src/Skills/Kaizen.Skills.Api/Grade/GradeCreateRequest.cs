using MediatR;

namespace Kaizen.Skills.Api.Grade;

public class GradeCreateRequest : IRequest<GradeItem>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
}