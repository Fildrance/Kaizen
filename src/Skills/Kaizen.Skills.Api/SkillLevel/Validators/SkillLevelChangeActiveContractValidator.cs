using FluentValidation;
using Kaizen.Skills.Api.SkillLevel;

namespace Kaizen.Skills.Api.SkillLevel.Validators;

public class SkillLevelChangeActiveContractValidator : AbstractValidator<SkillLevelChangeActiveRequest>
{
    public SkillLevelChangeActiveContractValidator(IValidator<SkillLevelSelector> selectorValidator)
    {
        RuleFor(x => x.IsActive)
            .NotNull();
        RuleFor(x => x.ToUpdate)
            .NotNull()
            .SetValidator(selectorValidator);
    }
}