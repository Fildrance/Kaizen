using FluentValidation;
using Kaizen.Skills.Api.Skill;

namespace Kaizen.Skills.Api.Skill.Validators;

public class SkillSelectorValidator : AbstractValidator<SkillSelector>
{
    public SkillSelectorValidator()
    {
        RuleFor(x => x.Id).NotNull();
    }
}