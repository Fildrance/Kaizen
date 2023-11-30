using FluentValidation;

namespace Kaizen.Skill.Api.Create.Validators
{
    public class SkillCategoryCreateContractValidator : AbstractValidator<SkillCategoryCreateContract>
    {
        public SkillCategoryCreateContractValidator()
        {
            RuleFor(x => x.ShortDescription)
                .MaximumLength(2000);
            RuleFor(x => x.Name)
                .NotNull()
                .NotEmpty()
                .MaximumLength(511);
        }
    }
}
