using Kaizen.Common.DAL.Discover;
using Kaizen.Common.DAL.Repository;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Selectors;

namespace Kaizen.Skill.Service.DAL
{
	/// <summary> Skill category repository, can discover and query repositories. </summary>
	public interface ISkillCategoryRepository : IDiscoverer<SkillCategorySelector, SkillCategoryEntity>, IFilterAdapter<SkillCategoryFilterContract, SkillCategoryEntity>, IRepository<SkillCategoryEntity, int>
	{

	}
}