using FluentValidation;
using Kaizen.Skill.Api.Selector;

namespace Kaizen.Skill.Api.Deactivate
{
	public class SkillCategoryChangeActiveContractValidator: AbstractValidator<SkillCategoryChangeActiveContract>
	{
		public SkillCategoryChangeActiveContractValidator(IValidator<SkillCategorySelector> selectorValidator)
		{
			RuleFor(x => x.IsActive).NotNull();
			RuleFor(x => x.ToUpdate).NotNull().SetValidator(selectorValidator);
		}
	}
}
