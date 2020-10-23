namespace Kaizen.Skill.Api.Items
{
	public class SkillCategoryItem : SkillBase
	{
		public int Id { get; set; }
		public bool IsActive { get; set; }

		public override string NodeType => "skill-category";
	}
}
