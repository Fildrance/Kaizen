using FluentValidation;

namespace Kaizen.Skills.Api.SkillCategory.Validators;

public class SkillCategoryUpdateContractValidator : AbstractValidator<SkillCategoryUpdateRequest>
{
    public SkillCategoryUpdateContractValidator(IValidator<SkillCategorySelector> selectorValidator)
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