using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Repository;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Selector;

namespace Kaizen.Skill.Service.DAL
{
	/// <summary> Skill repository, can discover and query repositories. </summary>
	public interface ISkillRepository : IDiscoverer<SkillCategorySelector, SkillCategoryEntity>, IFilterAdapter<SkillCategoryFilterContract, SkillCategoryEntity>, IRepository<SkillCategoryEntity, int>
	{

	}
}