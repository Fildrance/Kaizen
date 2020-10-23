namespace Kaizen.Skill.Api
{
	public abstract class SkillBase
	{
		public string Name { get; set; }
		public string ShortDescription { get; set; }
		public abstract string NodeType { get; }
	}
}
