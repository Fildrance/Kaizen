using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Repository;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Service.DAL
{
	/// <summary> Skill level repository, can discover and query repositories. </summary>
	public interface ISkillLevelRepository : IDiscoverer<SkillLevelSelector, SkillLevelEntity>, IRepository<SkillLevelEntity, int>
	{

	}

}