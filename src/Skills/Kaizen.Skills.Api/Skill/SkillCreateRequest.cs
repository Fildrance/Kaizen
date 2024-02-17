using Kaizen.Skills.Api.SkillCategory;
using MediatR;

namespace Kaizen.Skills.Api.Skill;

public class SkillCreateRequest : IRequest<SkillItem>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public SkillCategorySelector Parent { get; set; }
}