using MediatR;

namespace Kaizen.Skills.Api.Skill;

public class SkillSelector : IRequest<SkillItem>
{
    public int? Id { get; set; }

    public static SkillSelector ById(int id)
    {
        return new SkillSelector
        {
            Id = id
        };
    }
}