using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Skill;

/// <summary> Skill level repository, can discover and query repositories. </summary>
public interface ISkillLevelRepository : IDiscoverer<SkillLevelSelector, SkillLevelEntity>, IRepository<SkillLevelEntity, int>
{

}