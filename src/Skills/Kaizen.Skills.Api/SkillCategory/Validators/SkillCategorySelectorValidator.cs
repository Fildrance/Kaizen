using FluentValidation;

namespace Kaizen.Skills.Api.SkillCategory.Validators;

public class SkillCategorySelectorValidator : AbstractValidator<SkillCategorySelector>
{
    public SkillCategorySelectorValidator()
    {
        RuleFor(x => x.Id).NotNull();
    }
}