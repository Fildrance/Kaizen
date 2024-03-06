using System.Threading;
using System.Threading.Tasks;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillLevel;

/// <summary> Detach prerequisite request handler. </summary>
public class SkillLevelPrerequisiteDetachRequestHandler(ISkillLevelRepository repository) : IRequestHandler<SkillLevelPrerequisiteDetachRequest, Unit>
{
    /// <inheritdoc />
    public async Task<Unit> Handle(SkillLevelPrerequisiteDetachRequest request, CancellationToken cancellationToken)
    {
        await repository.DetachPrerequisite(request.ForSkillLevel, request.ReuireSkillLevel, cancellationToken);
        return Unit.Value;
    }
}