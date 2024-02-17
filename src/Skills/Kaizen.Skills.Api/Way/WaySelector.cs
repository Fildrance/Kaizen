using MediatR;

namespace Kaizen.Skills.Api.Way;

public class WaySelector : IRequest<WayItem>
{
    public int? Id { get; set; }

    public static WaySelector ById(int id)
    {
        return new WaySelector
        {
            Id = id
        };
    }
}