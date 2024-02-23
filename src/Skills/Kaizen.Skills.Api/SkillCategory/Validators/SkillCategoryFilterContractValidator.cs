using FluentValidation;

namespace Kaizen.Skills.Api.SkillCategory.Validators;

public class SkillCategoryFilterContractValidator : AbstractValidator<SkillTreeFilter>
{
    public SkillCategoryFilterContractValidator()
    {
        RuleFor(x => x.IncludeActive).NotNull().NotEqual(IncludeActiveOption.None);
    }
}