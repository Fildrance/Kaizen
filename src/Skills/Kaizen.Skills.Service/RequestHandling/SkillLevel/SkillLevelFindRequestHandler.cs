using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Entities;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillLevel;

/// <summary>
/// Handler for finding skill level.
/// </summary>
/// <param name="discoverer">Repository for skill level.</param>
/// <param name="mapper">Automapper.</param>
public class SkillLevelFindRequestHandler(
    IDiscoverer<SkillLevelSelector, SkillLevelEntity> discoverer,
    IMapper mapper
) : IRequestHandler<SkillLevelSelector, SkillLevelItem>
{
    /// <inheritdoc />
    public async Task<SkillLevelItem> Handle(SkillLevelSelector request, CancellationToken cancellationToken)
    {
        var entity = await discoverer.DiscoverAsync(request, cancellationToken);
        if (entity == null)
        {
            return null;
        }

        return mapper.Map<SkillLevelItem>(entity);
    }
}