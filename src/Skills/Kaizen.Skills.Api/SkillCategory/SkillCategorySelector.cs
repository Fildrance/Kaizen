using MediatR;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillCategorySelector : IRequest<SkillCategoryItem>
{
    public int? Id { get; set; }

    public static SkillCategorySelector ById(int id)
    {
        return new SkillCategorySelector
        {
            Id = id
        };
    }
}