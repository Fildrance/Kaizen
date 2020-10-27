using FluentValidation;
using Kaizen.Skill.Api.Selectors;
using Kaizen.Skill.Api.Update;

namespace Kaizen.Skill.Api.Create
{
	public class SkillLevelUpdateContractValidator : AbstractValidator<SkillLevelUpdateContract>
	{
		public SkillLevelUpdateContractValidator(IValidator<SkillLevelSelector> selectorValidator)
		{
			RuleFor(x => x.ToUpdate)
				.NotNull()
				.SetValidator(selectorValidator);
			RuleFor(x => x.ShortDescription)
				.MaximumLength(2000);
			RuleFor(x => x.Name)
				.NotNull()
				.NotEmpty()
				.MaximumLength(1023);
			RuleFor(x => x.FullDescription)
				.MaximumLength(8000);
			RuleFor(x => x.Weight)
				.GreaterThanOrEqualTo(0);
		}
	}
}
