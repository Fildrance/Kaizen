using FluentValidation;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.ToggleActive
{
	public class SkillLevelChangeActiveContractValidator : AbstractValidator<SkillLevelChangeActiveContract>
	{
		public SkillLevelChangeActiveContractValidator(IValidator<SkillLevelSelector> selectorValidator)
		{
			RuleFor(x => x.IsActive)
				.NotNull();
			RuleFor(x => x.ToUpdate)
				.NotNull()
				.SetValidator(selectorValidator);
		}
	}
}
