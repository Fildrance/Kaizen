using MediatR;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillCategoryCreateRequest : IRequest<SkillCategoryItem>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
}