using FluentValidation;

namespace Kaizen.Skill.Api.Selectors
{
	public class SkillSelectorValidator : AbstractValidator<SkillSelector>
	{
		public SkillSelectorValidator()
		{
			RuleFor(x => x.Id).NotNull();
		}
	}
}
