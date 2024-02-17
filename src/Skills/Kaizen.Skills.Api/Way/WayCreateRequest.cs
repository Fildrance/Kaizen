using MediatR;

namespace Kaizen.Skills.Api.Way;

public class WayCreateRequest : IRequest<WayItem>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
}