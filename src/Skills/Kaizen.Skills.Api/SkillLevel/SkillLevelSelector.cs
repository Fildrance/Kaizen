using MediatR;

namespace Kaizen.Skills.Api.SkillLevel;

public class SkillLevelSelector : IRequest<SkillLevelItem>
{
    public int? Id { get; set; }

    public static SkillLevelSelector ById(int id)
    {
        return new SkillLevelSelector
        {
            Id = id
        };
    }
}