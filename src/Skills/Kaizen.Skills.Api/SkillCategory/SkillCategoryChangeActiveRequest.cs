using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillCategoryChangeActiveRequest : IRequest<SkillCategoryItem>
{
    [NotNull]
    public SkillCategorySelector ToUpdate { get; set; }
    [NotNull]
    public bool? IsActive { get; set; }
}