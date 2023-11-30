using FluentValidation;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.Create.Validators
{
    public class SkillCreateContractValidator : AbstractValidator<SkillCreateContract>
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
}
