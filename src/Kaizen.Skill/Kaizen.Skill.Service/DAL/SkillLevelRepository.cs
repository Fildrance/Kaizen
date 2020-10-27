using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Discover.EntityExtractor;
using Kaizen.Skill.Api.Selectors;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace Kaizen.Skill.Service.DAL
{
	public class SkillLevelRepository : DiscoveringRepositoryBase<SkillLevelSelector, SkillLevelEntity, int>, ISkillLevelRepository
	{
		public SkillLevelRepository(
			DbContext context,
			IEnumerable<IAdditionalExtractConfiguration<SkillLevelSelector, SkillLevelEntity>> additionalConfigurations
		) : base(context, additionalConfigurations)
		{
		}
		protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillLevelSelector, SkillLevelEntity> builder)
		{
			builder.AddDiscoverRule(x => x.Id.HasValue, x => GetById(x.Id.Value));
		}
	}
}