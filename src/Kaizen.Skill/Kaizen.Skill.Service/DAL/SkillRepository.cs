using System.Collections.Generic;
using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Discover.EntityExtractor;
using Kaizen.Skill.Api.Selector;
using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skill.Service.DAL
{
	public class SkillRepository : DiscoveringRepositoryBase<SkillCategorySelector, SkillCategoryEntity, int>
	{
		public SkillRepository(
			DbContext context,
			IEnumerable<IAdditionalExtractConfiguration<SkillCategorySelector, SkillCategoryEntity>> additionalExtractConfiguration
		) : base(context, additionalExtractConfiguration)
		{
		}

		protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillCategorySelector, SkillCategoryEntity> builder)
		{
			builder.AddDiscoverRule(x => x.Id.HasValue, x => GetById(x.Id.Value));
		}
	}
}