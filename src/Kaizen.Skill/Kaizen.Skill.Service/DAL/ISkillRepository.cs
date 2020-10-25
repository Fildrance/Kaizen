using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Repository;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Service.DAL
{
	/// <summary> Skill repository, can discover and query repositories. </summary>
	public interface ISkillRepository : IDiscoverer<SkillSelector, SkillEntity>, IRepository<SkillEntity, int>
	{

	}
}