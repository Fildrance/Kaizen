using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Service.DAL.Entities;
using Kaizen.Skills.Api.Way;

namespace Kaizen.Skills.Service.DAL.Way;

public interface IWayRepository : IDiscoverer<WaySelector, WayEntity>, IFilterAdapter<WayFilter, WayEntity>, IRepository<WayEntity, int>
{
}