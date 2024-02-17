using FluentValidation;

namespace Kaizen.Skills.Api.SkillCategory.Validators;

public class SkillCategoryFilterContractValidator : AbstractValidator<SkillTreeFilter>
{
    public SkillCategoryFilterContractValidator()
    {
        RuleFor(x => x.IncludeActive).NotNull().NotEqual(IncludeActiveOption.None);
        RuleFor(x => x.AggregationLevel).Must(x => x is SkillAggregationLevel.Skill or SkillAggregationLevel.SkillCategory or SkillAggregationLevel.SkillLevel);
    }
}