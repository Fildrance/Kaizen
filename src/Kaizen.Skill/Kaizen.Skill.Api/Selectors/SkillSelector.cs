namespace Kaizen.Skill.Api.Selectors
{
	public class SkillSelector
	{
		public int? Id { get; set; }

		public static SkillSelector ById(int id)
		{
			return new SkillSelector
			{
				Id = id
			};
		}
	}
}
