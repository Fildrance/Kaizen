using FluentValidation;

namespace Kaizen.Skill.Api.Filter
{
	public class SkillCategoryFilterContractValidator : AbstractValidator<SkillCategoryFilterContract>
	{
		public SkillCategoryFilterContractValidator()
		{
			RuleFor(x => x.IncludeActive).NotNull().NotEqual(IncludeActiveOption.None);
		}
	}
}