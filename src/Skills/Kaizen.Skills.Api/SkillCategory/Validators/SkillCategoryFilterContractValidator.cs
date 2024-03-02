using FluentValidation;
using Kaizen.Skills.Api.SkillTree;

namespace Kaizen.Skills.Api.SkillCategory.Validators;

public class SkillCategoryFilterContractValidator : AbstractValidator<SkillTreeFilter>
{
    public SkillCategoryFilterContractValidator()
    {
        RuleFor(x => x.IncludeActive).NotNull().NotEqual(IncludeActiveOption.None);
    }
}