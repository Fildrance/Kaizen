using JetBrains.Annotations;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.ToggleActive;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Api.Update;
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
		/// Updates existing skill category.
		/// </summary>
		/// <param name="contract">Contract to be used in update. Contains selector of object to be updated. </param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of created record. </returns>
		[NotNull]
		Task<SkillCategoryItem> Update([NotNull] SkillCategoryUpdateContract contract);

		/// <summary>
		/// Change activity state of skill-category.
		/// </summary>
		/// <param name="contract">Contract to be used in activity change. Contains selector of object to be updated. </param>
		/// <returns>Promise of changed record. </returns>
		[NotNull]
		Task<SkillCategoryItem> ChangeActvie([NotNull] SkillCategoryChangeActiveContract contract);

		/// <summary>
		/// Queries skill categories.
		/// </summary>
		/// <param name="filter">Filter contract with data for filtering logic. </param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of paged items. </returns>
		[NotNull]
		Task<Page<SkillCategoryItem>> Query([NotNull] SkillCategoryFilterContract filter);

		/// <summary>
		/// Creates skill.
		/// </summary>
		/// <param name="contract">Contract to be used in creation.</param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of created record. </returns>
		[NotNull]
		Task<SkillItem> Create([NotNull] SkillCreateContract contract);

		/// <summary>
		/// Updates existing skill.
		/// </summary>
		/// <param name="contract">Contract to be used in update. Contains selector of object to be updated. </param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of created record. </returns>
		[NotNull]
		Task<SkillItem> Update([NotNull] SkillUpdateContract contract);

		/// <summary>
		/// Change activity state of skill.
		/// </summary>
		/// <param name="contract">Contract to be used in activity change. Contains selector of object to be updated. </param>
		/// <returns>Promise of changed record. </returns>
		[NotNull]
		Task<SkillItem> ChangeActvie([NotNull] SkillChangeActiveContract contract);

		/// <summary>
		/// Creates skill level.
		/// </summary>
		/// <param name="contract">Contract to be used in creation.</param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of created record. </returns>
		[NotNull]
		Task<SkillLevelItem> Create([NotNull] SkillLevelCreateContract contract);

		/// <summary>
		/// Updates existing skill level.
		/// </summary>
		/// <param name="contract">Contract to be used in update. Contains selector of object to be updated. </param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of created record. </returns>
		[NotNull]
		Task<SkillLevelItem> Update([NotNull] SkillLevelUpdateContract contract);

		/// <summary>
		/// Change activity state of skill level.
		/// </summary>
		/// <param name="contract">Contract to be used in activity change. Contains selector of object to be updated. </param>
		/// <returns>Promise of changed record. </returns>
		[NotNull]
		Task<SkillLevelItem> ChangeActvie([NotNull] SkillLevelChangeActiveContract contract);

	}
}
