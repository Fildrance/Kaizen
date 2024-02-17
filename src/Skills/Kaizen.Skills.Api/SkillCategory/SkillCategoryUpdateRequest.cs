using MediatR;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillCategoryUpdateRequest : IRequest<SkillCategoryItem>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public bool? IsActive { get; set; }
    public SkillCategorySelector ToUpdate { get; set; }
}