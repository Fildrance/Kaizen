﻿using JetBrains.Annotations;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Api.ToggleActive
{
	public class SkillCategoryChangeActiveContract
	{
		[NotNull]
		public SkillCategorySelector ToUpdate { get; set; }
		[NotNull]
		public bool? IsActive { get; set; }
	}
}
