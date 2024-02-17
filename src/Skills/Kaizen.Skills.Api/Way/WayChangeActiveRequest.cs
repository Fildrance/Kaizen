using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.Way;

public class WayChangeActiveRequest : IRequest<WayItem>
{
    public WaySelector ToUpdate { get; set; }
    [NotNull]
    public bool? IsActive { get; set; }
}