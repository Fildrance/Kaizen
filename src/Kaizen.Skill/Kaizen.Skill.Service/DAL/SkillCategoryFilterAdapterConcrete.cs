using Kaizen.Common.DAL.Repository;
using Kaizen.Skill.Api.Filter;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.DAL
{
	public class SkillCategoryFilterAdapterConcrete : IFilterAdapterConcrete<SkillCategoryFilterContract, SkillCategoryEntity>
	{
		public Task<IQueryable<SkillCategoryEntity>> ApplySortAsync(IQueryable<SkillCategoryEntity> query, SkillCategoryFilterContract filter)
		{
			query = query.Include(x => x.Skils).ThenInclude(x => x.SkillLevels);
			if (filter.IncludeActive == IncludeActiveOption.IncludeOnlyActive)
			{
				query = query.Where(x => x.IsActive);
			}
			else if (filter.IncludeActive == IncludeActiveOption.IncludeOnlyInactive)
			{
				query = query.Where(x => !x.IsActive);
			}
			return Task.FromResult(query);
		}

		public Task<IQueryable<SkillCategoryEntity>> ApplyFilterAsync(IQueryable<SkillCategoryEntity> query, SkillCategoryFilterContract filter)
		{
			return Task.FromResult<IQueryable<SkillCategoryEntity>>(query.OrderBy(x => x.Id));
		}
	}
}
