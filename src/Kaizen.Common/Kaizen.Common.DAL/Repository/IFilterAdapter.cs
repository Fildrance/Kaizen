using Kaizen.Skill.Service.DAL;
using System.Threading.Tasks;

namespace Kaizen.Common.DAL.Repository
{
	/// <summary> 
	/// Adapter for database query that gets entities based on filter contract. 
	/// As it uses paging, it is required to be called multiple times to get all records, if they won't be presented on single page.
	/// </summary>
	public interface IFilterAdapter<IFilterContract, TEntity>
	{
		/// <summary> Applies filter/sort logic to db to get entities based on filter contract. </summary>
		/// <param name="filter">Contract that contains data, based on which selection and sorting of entities should be executed.</param>
		/// <returns>Promise of paged entities list. </returns>
		Task<QueryResult<TEntity>> QueryAsync(IFilterContract filter);
	}
}
