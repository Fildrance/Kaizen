using FluentValidation;

namespace Kaizen.Skill.Api.Selectors
{
	public class SkillLevelSelectorValidator : AbstractValidator<SkillLevelSelector>
	{
		public SkillLevelSelectorValidator()
		{
			RuleFor(x => x.Id).NotNull();
		}
	}
}
