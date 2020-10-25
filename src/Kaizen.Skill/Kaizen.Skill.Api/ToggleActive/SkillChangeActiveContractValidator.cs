using FluentValidation;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.ToggleActive
{
	public class SkillChangeActiveContractValidator : AbstractValidator<SkillChangeActiveContract>
	{
		public SkillChangeActiveContractValidator(IValidator<SkillSelector> selectorValidator)
		{
			RuleFor(x => x.IsActive).NotNull();
			RuleFor(x => x.ToUpdate).NotNull().SetValidator(selectorValidator);
		}
	}
}
