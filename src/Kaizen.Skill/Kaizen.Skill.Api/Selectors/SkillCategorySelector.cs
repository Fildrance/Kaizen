namespace Kaizen.Skill.Api.Selector
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
