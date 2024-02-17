using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Skill;

/// <summary> Skill repository, can discover and query repositories. </summary>
public interface ISkillRepository : IDiscoverer<SkillSelector, SkillEntity>, IRepository<SkillEntity, int>
{

}