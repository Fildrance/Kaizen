using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Skill;

/// <summary> Skill level repository, can discover and query repositories. </summary>
public interface ISkillLevelRepository : IDiscoverer<SkillLevelSelector, SkillLevelEntity>, IRepository<SkillLevelEntity, int>
{
    /// <summary>
    /// Gets page of skill level prerequisites info.
    /// </summary>
    /// <param name="filter">Filter for getting skill level prerequisites.</param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns>Page with prerequisites.</returns>
    Task<Page<SkillLevelPrerequisiteEntity>> QueryPrerequisites(SkillLevelPrerequisiteFilter filter, CancellationToken ct);

    /// <summary>
    /// Attaches skill level prerequisite.
    /// </summary>
    /// <param name="forLevel">For which skill level this prerequisite is.</param>
    /// <param name="requiredLevel">Which skill level is required.</param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns></returns>
    Task AttachPrerequisite(SkillLevelEntity forLevel, SkillLevelEntity requiredLevel, CancellationToken ct);

    /// <summary>
    /// Detach skill level prerequisite.
    /// </summary>
    /// <param name="forSkillLevel">For which skill level this prerequisite is.</param>
    /// <param name="requiredIs">Which skill level is required.</param>
    /// <param name="ct">Token for operation cancellation.</param>
    /// <returns></returns>
    Task DetachPrerequisite(SkillLevelSelector forSkillLevel, SkillLevelSelector requiredIs, CancellationToken ct);
}