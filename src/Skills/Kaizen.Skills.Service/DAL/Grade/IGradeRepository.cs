using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Service.DAL.Entities;
using Kaizen.Skills.Api.Grade;

namespace Kaizen.Skills.Service.DAL.Grade;

public interface IGradeRepository : IDiscoverer<GradeSelector, GradeEntity>, IRepository<GradeEntity, int>
{
}