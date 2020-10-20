using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Kaizen.Common.DAL.Discover.EntityExtractor
{
	/// <summary>
	/// Additional selector configuration. I used to add configuration in DiscoveringRepositories.
	/// </summary>
	/// <typeparam name="TSelector">Type of selector.</typeparam>
	/// <typeparam name="TEntity">Type of Entity.</typeparam>
	public interface IAdditionalExtractConfiguration<TSelector, TEntity>
		where TEntity : class
	{
		/// <summary>
		/// Adding additional configuration for selector.
		/// </summary>
		/// <param name="builder">Instance of extractor builder.</param>
		/// <param name="set">DbSet instance of expected entity type, Can be used for simplified search of entity.</param>
		/// <param name="context">DbContext instance, can be used for searching and working with other entities or for plain-sql execution.</param>
		void RefineExtractConfiguration(
			EntityExtractorBuilder<TSelector, TEntity> builder,
			IQueryable<TEntity> set,
			DbContext context
		);
	}
}
