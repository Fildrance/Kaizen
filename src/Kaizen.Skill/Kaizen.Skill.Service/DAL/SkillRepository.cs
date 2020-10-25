using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Discover.EntityExtractor;
using Kaizen.Skill.Api.Selectors;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace Kaizen.Skill.Service.DAL
{
	public class SkillRepository : DiscoveringRepositoryBase<SkillSelector, SkillEntity, int>, ISkillRepository
	{
		public SkillRepository(
			DbContext context,
			IEnumerable<IAdditionalExtractConfiguration<SkillSelector, SkillEntity>> additionalConfigurations
		) : base(context, additionalConfigurations)
		{
		}
		protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillSelector, SkillEntity> builder)
		{
			builder.AddDiscoverRule(x => x.Id.HasValue, x => GetById(x.Id.Value));
		}
	}
}