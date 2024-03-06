using System;
using System.Threading;
using System.Threading.Tasks;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillLevel;

/// <summary> Attach prerequisite request handler. </summary>
public class SkillLevelPrerequisiteAttachRequestHandler(ISkillLevelRepository skillLevelRepository)
    : IRequestHandler<SkillLevelPrerequisiteAttachRequest, SkillLevelPrerequisiteItem>
{
    /// <inheritdoc />
    public async Task<SkillLevelPrerequisiteItem> Handle(SkillLevelPrerequisiteAttachRequest request, CancellationToken cancellationToken)
    {
        var forLevel = await skillLevelRepository.DiscoverAsync(request.ForSkillLevel, cancellationToken);
        if (forLevel == null)
        {
            throw new InvalidOperationException($"no such skill level - {request.ForSkillLevel}");
        }

        var requiredLevel = await skillLevelRepository.DiscoverAsync(request.ReuireSkillLevel, cancellationToken);
        if (requiredLevel == null)
        {
            throw new InvalidOperationException($"no such skill level - {request.ReuireSkillLevel}");
        }

        await skillLevelRepository.AttachPrerequisite(forLevel, requiredLevel, cancellationToken);
        return new SkillLevelPrerequisiteItem
        {
            RequiredSkillId = requiredLevel.Id,
            ForSkillLevelId = forLevel.Id
        };
    }
}