using Kaizen.Common.Service;
using Kaizen.Skill.Service.DAL;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace Kaizen.Common.DAL.Repository
{
	/// <summary> Generic implementation of filter adapter, takes care of take/skip logic. </summary>
	public class GenericFilterAdapter<TFilterContract, TEntity> : IFilterAdapter<TFilterContract, TEntity>
		where TEntity : class
		where TFilterContract : FilterContractBase
	{
		private readonly IFilterAdapterConcrete<TFilterContract, TEntity> _filterAdapterConcrete;
		private readonly DbContext _dbContext;

		public GenericFilterAdapter(IFilterAdapterConcrete<TFilterContract, TEntity> filterAdapterConcrete, DbContext dbContext)
		{
			_filterAdapterConcrete = filterAdapterConcrete;
			_dbContext = dbContext;
		}

		public async Task<QueryResult<TEntity>> QueryAsync(TFilterContract filter)
		{
			IQueryable<TEntity> query = _dbContext.Set<TEntity>();

			query = await _filterAdapterConcrete.ApplyFilterAsync(query, filter);

			var totalCount = await query.CountAsync();

			query = await _filterAdapterConcrete.ApplySortAsync(query, filter);

			if (filter.Take.HasValue)
			{
				query = query.Take(filter.Take.Value);
			}

			if (filter.Skip.HasValue)
			{
				query = query.Skip(filter.Skip.Value);
			}

			var result = await query.ToArrayAsync();
			return new QueryResult<TEntity>(result, totalCount);
		}
	}
}
