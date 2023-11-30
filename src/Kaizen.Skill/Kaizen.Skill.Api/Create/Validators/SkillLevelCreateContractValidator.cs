using FluentValidation;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.Create.Validators
{
    public class SkillLevelCreateContractValidator : AbstractValidator<SkillLevelCreateContract>
    {
        public SkillLevelCreateContractValidator(IValidator<SkillSelector> skillSelectorValidator)
        {
            RuleFor(x => x.ShortDescription)
                .MaximumLength(2000);
            RuleFor(x => x.Name)
                .NotNull()
                .NotEmpty()
                .MaximumLength(1023);
            RuleFor(x => x.Parent)
                .NotNull()
                .SetValidator(skillSelectorValidator);
            RuleFor(x => x.FullDescription)
                .MaximumLength(8000);
            RuleFor(x => x.Weight)
                .GreaterThanOrEqualTo(0);
        }
    }
}
