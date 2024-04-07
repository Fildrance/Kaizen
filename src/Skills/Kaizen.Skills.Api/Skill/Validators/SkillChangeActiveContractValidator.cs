using FluentValidation;

namespace Kaizen.Skills.Api.Skill.Validators;

public class SkillChangeActiveContractValidator : AbstractValidator<SkillChangeActiveRequest>
{
    public SkillChangeActiveContractValidator(IValidator<SkillSelector> selectorValidator)
    {
        RuleFor(x => x.IsActive).NotNull();
        RuleFor(x => x.ToUpdate).NotNull().SetValidator(selectorValidator);
    }
}