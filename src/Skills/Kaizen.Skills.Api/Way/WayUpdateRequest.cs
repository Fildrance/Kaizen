using MediatR;

namespace Kaizen.Skills.Api.Way;

public class WayUpdateRequest : IRequest<WayItem>
{
    public WaySelector ToUpdate { get; set; }

    public string Name { get; set; }
    public string ShortDescription { get; set; }

    public bool? IsActive { get; set; }
}