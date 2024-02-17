using Kaizen.Skills.Service.DAL.Entities;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api;
using Kaizen.Skills.Api.Way;
using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skills.Service.DAL.Way;

public class WayFilterAdapterConcrete : IFilterAdapterConcrete<WayFilter, WayEntity>
{
    /// <inheritdoc />
    public Task<IQueryable<WayEntity>> ApplySortAsync(IQueryable<WayEntity> query, WayFilter filter, CancellationToken ct)
    {
        query = query.Include(x => x.Grades);
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

    /// <inheritdoc />
    public Task<IQueryable<WayEntity>> ApplyFilterAsync(IQueryable<WayEntity> query, WayFilter filter, CancellationToken ct)
    {
        return Task.FromResult<IQueryable<WayEntity>>(query.OrderBy(x => x.Id));
    }
}