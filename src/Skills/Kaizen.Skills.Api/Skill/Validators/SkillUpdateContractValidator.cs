using FluentValidation;

namespace Kaizen.Skills.Api.Skill.Validators;

public class SkillUpdateContractValidator : AbstractValidator<SkillUpdateRequest>
{
    public SkillUpdateContractValidator(IValidator<SkillSelector> selectorValidator)
    {
        RuleFor(x => x.ShortDescription)
            .MaximumLength(2000);
        RuleFor(x => x.Name)
            .NotNull()
            .NotEmpty()
            .MaximumLength(511);
        RuleFor(x => x.ToUpdate)
            .NotNull()
            .SetValidator(selectorValidator);
    }
}