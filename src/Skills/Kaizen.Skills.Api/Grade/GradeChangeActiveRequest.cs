using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.Grade;

public class GradeChangeActiveRequest : IRequest<GradeItem>
{
    public GradeSelector ToUpdate { get; set; }
    [NotNull]
    public bool? IsActive { get; set; }
}