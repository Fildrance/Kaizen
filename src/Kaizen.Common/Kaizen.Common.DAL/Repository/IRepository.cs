using System.Threading.Tasks;

namespace Kaizen.Common.DAL.Repository
{
	public interface IRepository<TEntity, TId>
		where TEntity : EntityBase<TId>
	{
		/// <summary> Adds record to database. </summary>
		/// <param name="entity">Entity to be saved.</param>
		/// <returns>Promise of saving entity.</returns>
		Task Add(TEntity entity);

		/// <summary> Performs delete of record in database. </summary>
		/// <param name="entity">Entity to be deleted.</param>
		/// <returns>Promise fo saving changes.</returns>
		Task Remove(TEntity entity);

		/// <summary> Performs update of passed entity in database. </summary>
		/// <param name="entity">Entity to be updated. </param>
		/// <returns>Promise fo saving changes. </returns>
		Task Update(TEntity entity);

		/// <summary> Gets entity record by id (or throws if nothing to be found). </summary>
		/// <param name="id">Id to be searched.</param>
		/// <returns>Promise of found entity.</returns>
		Task<TEntity> GetById(TId id);
	}
}
