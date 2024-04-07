using FluentValidation;

namespace Kaizen.Skills.Api.SkillCategory.Validators;

public class SkillCategoryCreateContractValidator : AbstractValidator<SkillCategoryCreateRequest>
{
    public SkillCategoryCreateContractValidator()
    {
        RuleFor(x => x.ShortDescription)
            .MaximumLength(2000);
        RuleFor(x => x.Name)
            .NotNull()
            .NotEmpty()
            .MaximumLength(511);
    }
}