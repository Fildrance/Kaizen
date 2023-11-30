using FluentValidation;

namespace Kaizen.Skill.Api.Selectors.Validators
{
    public class SkillSelectorValidator : AbstractValidator<SkillSelector>
    {
        public SkillSelectorValidator()
        {
            RuleFor(x => x.Id).NotNull();
        }
    }
}
