using MediatR;

namespace Kaizen.Skills.Api.Grade;

public class GradeUpdateRequest : IRequest<GradeItem>
{
    public GradeSelector ToUpdate { get; set; }

    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public bool? IsActive { get; set; }
}