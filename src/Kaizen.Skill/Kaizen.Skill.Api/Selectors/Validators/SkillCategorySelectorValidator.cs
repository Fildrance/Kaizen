using FluentValidation;

namespace Kaizen.Skill.Api.Selectors.Validators
{
    public class SkillCategorySelectorValidator : AbstractValidator<SkillCategorySelector>
    {
        public SkillCategorySelectorValidator()
        {
            RuleFor(x => x.Id).NotNull();
        }
    }
}
