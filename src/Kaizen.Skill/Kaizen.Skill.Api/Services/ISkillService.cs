using JetBrains.Annotations;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Items;
using System.Threading.Tasks;

namespace Kaizen.Skill.Api.Services
{
	/// <summary> Service for management of skills.</summary>
	public interface ISkillService
	{
		/// <summary>
		/// Creates skill category.
		/// </summary>
		/// <param name="contract">Contract to be used in creation.</param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of created record. </returns>
		[NotNull]
		Task<SkillCategoryItem> Create([NotNull] SkillCategoryCreateContract contract);
		/// <summary>
		/// Queries skill categories.
		/// </summary>
		/// <param name="filter">Filter contract with data for filtering logic. </param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of paged items. </returns>
		Task<Page<SkillCategoryItem>> Query(SkillCategoryFilterContract filter);
	}
}
