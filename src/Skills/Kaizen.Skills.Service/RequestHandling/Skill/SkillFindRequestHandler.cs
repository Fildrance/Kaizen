using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Service.DAL.Entities;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.Skill;

/// <summary>
/// Handler for finding skill.
/// </summary>
/// <param name="discoverer">Repository for skill.</param>
/// <param name="mapper">Automapper.</param>
public class SkillFindRequestHandler(
    IDiscoverer<SkillSelector, SkillEntity> discoverer,
    IMapper mapper
) : IRequestHandler<SkillSelector, SkillItem>
{
    /// <inheritdoc />
    public async Task<SkillItem> Handle(SkillSelector request, CancellationToken cancellationToken)
    {
        var entity = await discoverer.DiscoverAsync(request, cancellationToken);
        if (entity == null)
        {
            return null;
        }

        return mapper.Map<SkillItem>(entity);
    }
}