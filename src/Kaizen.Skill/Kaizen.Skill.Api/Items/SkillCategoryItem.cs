using System.Collections.Generic;

namespace Kaizen.Skill.Api.Items
{
	public class SkillCategoryItem : SkillBase
	{
		public override string NodeType => "skill-category";

		public IList<SkillItem> Items { get; set; }
	}
}
