using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillTree;
using Kaizen.Skills.Service.DAL.Entities;
using static Kaizen.Skills.Service.DAL.Skill.SkillCategoryRepository;

namespace Kaizen.Skills.Service.DAL.Skill;

/// <summary> Skill category repository, can discover and query repositories. </summary>
public interface ISkillCategoryRepository : IDiscoverer<SkillCategorySelector, SkillCategoryEntity>, IRepository<SkillCategoryEntity, int>
{
    /// <summary>
    /// Query for full skill tree.
    /// </summary>
    /// <param name="request">Filter with parameters of tree request.</param>
    /// <param name="session">Session in which context request is called.</param>
    /// <param name="ct">Token for cancellation.</param>
    /// <returns>Tree of models to return.</returns>
    Task<SkillTreeModel[]> QueryTree(SkillTreeFilter request, Session session, CancellationToken ct);
}