using JetBrains.Annotations;
using System;
using System.Threading.Tasks;

namespace Kaizen.Common.DAL.Discover;

/// <summary>
/// Can discover entities by selector.
/// </summary>
/// <typeparam name="TSelector">Type of selector for searching of entities.</typeparam>
/// <typeparam name="TEntity">Type of entity to be found.</typeparam>
public interface IDiscoverer<in TSelector, TEntity> where TEntity : class
{
    /// <summary>
    /// Searches entity by mentioned selector.
    /// </summary>
    /// <param name="selector">Selector for seach.</param>
    /// <exception cref="InvalidOperationException">Is thrown when passed selector does not match any registered discover rule.</exception>
    /// <returns>Found entity or null if entity not found.</returns>
    [CanBeNull]
    Task<TEntity> DiscoverAsync([NotNull] TSelector selector);

    /// <summary>
    /// Prepares discoverer for work.
    /// </summary>
    void ConfigureExtractor();
}