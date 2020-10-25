using FluentValidation;

namespace Kaizen.Skill.Api.Selectors
{
	public class SkillCategorySelectorValidator : AbstractValidator<SkillCategorySelector>
	{
		public SkillCategorySelectorValidator()
		{
			RuleFor(x => x.Id).NotNull();
		}
	}
}
