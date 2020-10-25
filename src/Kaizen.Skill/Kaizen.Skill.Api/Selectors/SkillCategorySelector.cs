namespace Kaizen.Skill.Api.Selectors
{
	public class SkillCategorySelector
	{
		public int? Id { get; set; }

		public static SkillCategorySelector ById(int id)
		{
			return new SkillCategorySelector
			{
				Id = id
			};
		}
	}
}
