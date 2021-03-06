﻿using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.Update
{
	public class SkillCategoryUpdateContract
	{
		public string Name { get; set; }
		public string ShortDescription { get; set; }
		public bool? IsActive { get; set; }
		public SkillCategorySelector ToUpdate { get; set; }
	}
}
