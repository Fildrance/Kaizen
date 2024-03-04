using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillLevel;

/// <summary>
/// Handler for skill level prerequisite query.
/// </summary>
/// <param name="skillLevelRepository">Repository for skill level entities.</param>
/// <param name="mapper">Automapper.</param>
public class SkillLevelPrerequisiteQueryHandler(ISkillLevelRepository skillLevelRepository, IMapper mapper)
    : IRequestHandler<SkillLevelPrerequisiteFilter, Page<SkillLevelPrerequisiteItem>>
{
    /// <inheritdoc />
    public async Task<Page<SkillLevelPrerequisiteItem>> Handle(SkillLevelPrerequisiteFilter request, CancellationToken cancellationToken)
    {
        var result = await skillLevelRepository.QueryPrerequisites(request, cancellationToken);
        var mapped = result.Items.Select(mapper.Map<SkillLevelPrerequisiteItem>)
                           .ToArray();
        return new Page<SkillLevelPrerequisiteItem>(mapped, result.TotalCount);
    }
}