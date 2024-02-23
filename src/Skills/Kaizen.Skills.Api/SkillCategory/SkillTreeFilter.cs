using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillTreeFilter : IRequest<SkillCategoryItem[]>
{
    [CanBeNull] public IncludeActiveOption? IncludeActive { get; set; }
}