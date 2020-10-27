using FluentValidation;
using Kaizen.Skill.Api.Selectors;
using Kaizen.Skill.Api.Update;

namespace Kaizen.Skill.Api.Create
{
	public class SkillUpdateContractValidator : AbstractValidator<SkillUpdateContract>
	{
		public SkillUpdateContractValidator(IValidator<SkillSelector> selectorValidator)
		{
			RuleFor(x => x.ShortDescription)
				.MaximumLength(2000);
			RuleFor(x => x.Name)
				.NotNull()
				.NotEmpty()
				.MaximumLength(511);
			RuleFor(x => x.ToUpdate)
				.NotNull()
				.SetValidator(selectorValidator);
		}
	}
}
