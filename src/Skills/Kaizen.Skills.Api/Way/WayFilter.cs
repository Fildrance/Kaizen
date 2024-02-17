using Enterprise.ApplicationBootstrap.Core.Api.Models;
using MediatR;

namespace Kaizen.Skills.Api.Way;

public class WayFilter : FilterContractBase, IRequest<Page<WayItem>>
{
    public IncludeActiveOption? IncludeActive { get; set; }
}