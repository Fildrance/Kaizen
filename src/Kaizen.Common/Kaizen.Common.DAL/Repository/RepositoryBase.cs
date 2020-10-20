using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace Kaizen.Common.DAL.Repository
{
	/// <summary> Base class for repository of certain entities. </summary>
	/// <typeparam name="TEntity">Type of entity.</typeparam>
	/// <typeparam name="TId">Type of id for entity.</typeparam>
	public class RepositoryBase<TEntity, TId>
		where TEntity : EntityBase<TId>
	{
		public RepositoryBase(DbContext context)
		{
			Context = context ?? throw new ArgumentNullException(nameof(context));
			Set = Context.Set<TEntity>();
		}

		protected DbContext Context { get; }
		protected DbSet<TEntity> Set { get; }

		/// <summary> Adds record to database. </summary>
		/// <param name="entity">Entity to be saved.</param>
		/// <returns>Promise of saving entity.</returns>
		public async Task Add(TEntity entity)
		{
			await Set.AddAsync(entity);
			await Context.SaveChangesAsync();
		}

		/// <summary> Performs delete of record in database. </summary>
		/// <param name="entity">Entity to be deleted.</param>
		/// <returns>Promise fo saving changes.</returns>
		public Task Remove(TEntity entity)
		{
			Set.Remove(entity);
			return Context.SaveChangesAsync();
		}

		/// <summary> Performs update of passed entity in database. </summary>
		/// <param name="entity">Entity to be updated. </param>
		/// <returns>Promise fo saving changes. </returns>
		public Task Update(TEntity entity)
		{
			Context.Update(entity);
			return Context.SaveChangesAsync();
		}

		/// <summary> Gets entity record by id (or throws if nothing to be found). </summary>
		/// <param name="id">Id to be searched.</param>
		/// <returns>Promise of found entity.</returns>
		public Task<TEntity> GetById(TId id)
		{
			return Set.FirstAsync(x => x.Id.Equals(id));
		}
	}
}
