using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.Way;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Way;

public class WayRepository(
    IDbContextManager dbContextManager,
    IEnumerable<IAdditionalExtractConfiguration<WaySelector, WayEntity>> additionalExtractConfiguration,
    IFilterAdapter<WayFilter, WayEntity> filterAdapter
) : DiscoveringRepositoryBase<WaySelector, WayEntity, int>(dbContextManager, additionalExtractConfiguration), IWayRepository
{
    /// <inheritdoc />
    public Task<Page<WayEntity>> QueryAsync(WayFilter filter, Session session, CancellationToken ct)
    {
        return filterAdapter.QueryAsync(filter, session, ct);
    }

    /// <inheritdoc />
    protected override void DoConfigureExtractor(EntityExtractorBuilder<WaySelector, WayEntity> builder)
    {
        builder.AddDiscoverRule(x => x.Id.HasValue, (x, ct) => GetById(x.Id.Value, ct));
    }
}