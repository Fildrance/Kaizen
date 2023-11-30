using FluentValidation;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.ToggleActive.Validators
{
    public class SkillCategoryChangeActiveContractValidator : AbstractValidator<SkillCategoryChangeActiveContract>
    {
        public SkillCategoryChangeActiveContractValidator(IValidator<SkillCategorySelector> selectorValidator)
        {
            RuleFor(x => x.IsActive).NotNull();
            RuleFor(x => x.ToUpdate).NotNull().SetValidator(selectorValidator);
        }
    }
}
