using System;
using System.Threading.Tasks;

namespace Kaizen.Common.DAL.Discover.EntityExtractor
{
	/// <summary>
	/// Extractor for entities. Can discover entity object from ORM-repository using
	/// selector, that contains some fields, based on which discover rule will be picked and executed in Extractor internals.
	/// </summary>
	/// <typeparam name="TSelector">Type of selector for entity search.</typeparam>
	/// <typeparam name="TEntity">Type of entity to be found.</typeparam>
	public interface IEntityExtractor<in TSelector, TEntity>
	{
		/// <summary>
		/// Searches entity by mentioned selector.
		/// </summary>
		/// <param name="selector">Selector for search.</param>
		/// <exception cref="InvalidOperationException">Is thrown when passed selector does not match any registered discover rule.</exception>
		/// <returns>Found entity or null if entity not found.</returns>
		Task<TEntity> ExtractAsync(TSelector selector);
	}
}
