using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace Kaizen.Common.DAL.Repository
{
	/// <summary> Base class for repository of certain entities. </summary>
	/// <typeparam name="TEntity">Type of entity.</typeparam>
	/// <typeparam name="TId">Type of id for entity.</typeparam>
	public class RepositoryBase<TEntity, TId> : IRepository<TEntity, TId>
		where TEntity : EntityBase<TId>
	{
		public RepositoryBase(DbContext context)
		{
			Context = context ?? throw new ArgumentNullException(nameof(context));
			Set = Context.Set<TEntity>();
		}

		protected DbContext Context { get; }
		protected DbSet<TEntity> Set { get; }

		public async Task Add(TEntity entity)
		{
			await Set.AddAsync(entity);
			await Context.SaveChangesAsync();
		}

		public Task Remove(TEntity entity)
		{
			Set.Remove(entity);
			return Context.SaveChangesAsync();
		}

		public Task Update(TEntity entity)
		{
			Context.Update(entity);
			return Context.SaveChangesAsync();
		}

		public Task<TEntity> GetById(TId id)
		{
			return Set.FirstAsync(x => x.Id.Equals(id));
		}
	}
}
