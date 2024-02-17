using FluentValidation;

namespace Kaizen.Skills.Api.SkillLevel.Validators;

public class SkillLevelSelectorValidator : AbstractValidator<SkillLevelSelector>
{
    public SkillLevelSelectorValidator()
    {
        RuleFor(x => x.Id).NotNull();
    }
}