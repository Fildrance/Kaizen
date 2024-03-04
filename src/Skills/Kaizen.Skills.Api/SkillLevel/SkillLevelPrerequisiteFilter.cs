using Enterprise.ApplicationBootstrap.Core.Api.Models;
using MediatR;

namespace Kaizen.Skills.Api.SkillLevel;

public class SkillLevelPrerequisiteFilter : FilterContractBase, IRequest<Page<SkillLevelPrerequisiteItem>>
{
    public bool IncludeOnlyBoundWithActiveSkillLevels { get; set; }
}