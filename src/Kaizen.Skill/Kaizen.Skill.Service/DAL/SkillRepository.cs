using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Discover.EntityExtractor;
using Kaizen.Common.DAL.Repository;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Selector;
using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skill.Service.DAL
{

	public class SkillRepository : DiscoveringRepositoryBase<SkillCategorySelector, SkillCategoryEntity, int>, ISkillRepository
	{
		private readonly IFilterAdapter<SkillCategoryFilterContract, SkillCategoryEntity> _filterAdapter;

		public SkillRepository(
			DbContext context,
			IEnumerable<IAdditionalExtractConfiguration<SkillCategorySelector, SkillCategoryEntity>> additionalExtractConfiguration,
			IFilterAdapter<SkillCategoryFilterContract, SkillCategoryEntity> filterAdapter
		) : base(context, additionalExtractConfiguration)
		{
			_filterAdapter = filterAdapter ?? throw new ArgumentNullException(nameof(filterAdapter));
		}

		public Task<QueryResult<SkillCategoryEntity>> QueryAsync(SkillCategoryFilterContract filter)
		{
			return _filterAdapter.QueryAsync(filter);
		}

		protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillCategorySelector, SkillCategoryEntity> builder)
		{
			builder.AddDiscoverRule(x => x.Id.HasValue, x => GetById(x.Id.Value));
		}
	}
}