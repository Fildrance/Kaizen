using FluentValidation;

namespace Kaizen.Skill.Api.Selector
{
	public class SkillCategorySelectorValidator : AbstractValidator<SkillCategorySelector>
	{
		public SkillCategorySelectorValidator()
		{
			RuleFor(x => x.Id).NotNull();
		}
	}
}
