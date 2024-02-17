using FluentValidation;

namespace Kaizen.Skills.Api.SkillLevel.Validators;

public class SkillLevelUpdateContractValidator : AbstractValidator<SkillLevelUpdateRequest>
{
    public SkillLevelUpdateContractValidator(IValidator<SkillLevelSelector> selectorValidator)
    {
        RuleFor(x => x.ToUpdate)
            .NotNull()
            .SetValidator(selectorValidator);
        RuleFor(x => x.ShortDescription)
            .MaximumLength(2000);
        RuleFor(x => x.Name)
            .NotNull()
            .NotEmpty()
            .MaximumLength(1023);
        RuleFor(x => x.FullDescription)
            .MaximumLength(8000);
        RuleFor(x => x.Weight)
            .GreaterThanOrEqualTo(0);
    }
}