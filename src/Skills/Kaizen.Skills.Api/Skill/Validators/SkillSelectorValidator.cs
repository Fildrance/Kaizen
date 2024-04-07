using FluentValidation;

namespace Kaizen.Skills.Api.Skill.Validators;

public class SkillSelectorValidator : AbstractValidator<SkillSelector>
{
    public SkillSelectorValidator()
    {
        RuleFor(x => x.Id).NotNull();
    }
}