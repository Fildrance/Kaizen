using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.SkillTree;

public class SkillTreeFilter : IRequest<SkillTreeItem[]>
{
    [CanBeNull] public IncludeActiveOption? IncludeActive { get; set; }
}