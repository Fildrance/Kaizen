using FluentValidation;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Api.SkillCategory;

namespace Kaizen.Skills.Api.Skill.Validators;

public class SkillCreateContractValidator : AbstractValidator<SkillCreateRequest>
{
    public SkillCreateContractValidator(IValidator<SkillCategorySelector> categorySelectorValidator)
    {
        RuleFor(x => x.ShortDescription)
            .MaximumLength(2000);
        RuleFor(x => x.Name)
            .NotNull()
            .NotEmpty()
            .MaximumLength(511);
        RuleFor(x => x.Parent)
            .NotNull()
            .SetValidator(categorySelectorValidator);
    }
}