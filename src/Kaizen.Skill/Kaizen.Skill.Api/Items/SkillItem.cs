namespace Kaizen.Skill.Api.Items
{
	public class SkillItem : SkillBase

	{
		public int Id { get; set; }
		public bool IsActive { get; set; }

		public override string NodeType => "skill";
	}
}
