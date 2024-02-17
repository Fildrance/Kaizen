using FluentValidation;
using Kaizen.Skills.Api.SkillCategory;

namespace Kaizen.Skills.Api.SkillCategory.Validators;

public class SkillCategoryChangeActiveContractValidator : AbstractValidator<SkillCategoryChangeActiveRequest>
{
    public SkillCategoryChangeActiveContractValidator(IValidator<SkillCategorySelector> selectorValidator)
    {
        RuleFor(x => x.IsActive).NotNull();
        RuleFor(x => x.ToUpdate).NotNull().SetValidator(selectorValidator);
    }
}