using System.Collections.Generic;

namespace Kaizen.Skill.Api.Items
{
	public class SkillItem : SkillBase
	{
		public override string NodeType => "skill";

		public IList<SkillLevelItem> Items { get; set; }
	}
}
