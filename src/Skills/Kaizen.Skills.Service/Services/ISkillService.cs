using System;
using System.Threading;
using System.Threading.Tasks;
using JetBrains.Annotations;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillLevel;

namespace Kaizen.Skills.Service.Services;

/// <summary> Service for management of skills.</summary>
public interface ISkillService
{
    /// <summary>
    /// Creates skill category.
    /// </summary>
    /// <param name="request">Contract to be used in creation.</param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <exception cref="ArgumentNullException">Thrown if <see cref="request"/> is null. </exception>
    /// <returns>Promise of created record. </returns>
    [NotNull]
    Task<SkillCategoryItem> Create([NotNull] SkillCategoryCreateRequest request, CancellationToken ct);

    /// <summary>
    /// Updates existing skill category.
    /// </summary>
    /// <param name="request">Contract to be used in update. Contains selector of object to be updated. </param>
    /// <exception cref="ArgumentNullException">Thrown if <see cref="request"/> is null. </exception>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of created record. </returns>
    [NotNull]
    Task<SkillCategoryItem> Update([NotNull] SkillCategoryUpdateRequest request, CancellationToken ct);

    /// <summary>
    /// Change activity state of skill-category.
    /// </summary>
    /// <param name="request">Contract to be used in activity change. Contains selector of object to be updated. </param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of changed record. </returns>
    [NotNull]
    Task<SkillCategoryItem> ChangeActive([NotNull] SkillCategoryChangeActiveRequest request, CancellationToken ct);

    /// <summary>
    /// Queries skill tree elements.
    /// </summary>
    /// <param name="filter">Filter contract with data for filtering logic. </param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of paged items. </returns>
    /// <exception cref="ArgumentNullException">Thrown if <see cref="filter"/> is null. </exception>
    [NotNull]
    Task<SkillCategoryItem[]> Query([NotNull] SkillTreeFilter filter, CancellationToken ct);

    /// <summary>
    /// Creates skill.
    /// </summary>
    /// <param name="request">Contract to be used in creation.</param>
    /// <exception cref="ArgumentNullException">Thrown if <see cref="request"/> is null. </exception>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of created record. </returns>
    [NotNull]
    Task<SkillItem> Create([NotNull] SkillCreateRequest request, CancellationToken ct);

    /// <summary>
    /// Updates existing skill.
    /// </summary>
    /// <param name="request">Contract to be used in update. Contains selector of object to be updated. </param>
    /// <exception cref="ArgumentNullException">Thrown if <see cref="request"/> is null. </exception>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of created record. </returns>
    [NotNull]
    Task<SkillItem> Update([NotNull] SkillUpdateRequest request, CancellationToken ct);

    /// <summary>
    /// Change activity state of skill.
    /// </summary>
    /// <param name="request">Contract to be used in activity change. Contains selector of object to be updated. </param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of changed record. </returns>
    [NotNull]
    Task<SkillItem> ChangeActive([NotNull] SkillChangeActiveRequest request, CancellationToken ct);

    /// <summary>
    /// Creates skill level.
    /// </summary>
    /// <param name="request">Contract to be used in creation.</param>
    /// <exception cref="ArgumentNullException">Thrown if <see cref="request"/> is null. </exception>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of created record. </returns>
    [NotNull]
    Task<SkillLevelItem> Create([NotNull] SkillLevelCreateRequest request, CancellationToken ct);

    /// <summary>
    /// Updates existing skill level.
    /// </summary>
    /// <param name="request">Contract to be used in update. Contains selector of object to be updated. </param>
    /// <exception cref="ArgumentNullException">Thrown if <see cref="request"/> is null. </exception>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of created record. </returns>
    [NotNull]
    Task<SkillLevelItem> Update([NotNull] SkillLevelUpdateRequest request, CancellationToken ct);

    /// <summary>
    /// Change activity state of skill level.
    /// </summary>
    /// <param name="request">Contract to be used in activity change. Contains selector of object to be updated. </param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Promise of changed record. </returns>
    [NotNull]
    Task<SkillLevelItem> ChangeActive([NotNull] SkillLevelChangeActiveRequest request, CancellationToken ct);
}