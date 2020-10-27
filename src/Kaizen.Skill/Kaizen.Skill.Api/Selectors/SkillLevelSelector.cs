namespace Kaizen.Skill.Api.Selectors
{
	public class SkillLevelSelector
	{
		public int? Id { get; set; }

		public static SkillLevelSelector ById(int id)
		{
			return new SkillLevelSelector
			{
				Id = id
			};
		}
	}
}
