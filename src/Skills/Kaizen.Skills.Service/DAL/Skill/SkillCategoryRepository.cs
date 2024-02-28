using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillTree;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Skill;

/// <summary>
/// Default implementation for <see cref="ISkillCategoryRepository"/>.
/// </summary>
/// <param name="dbContextManager">Manager for dbContexts.</param>
/// <param name="additionalExtractConfiguration">additional extract configurations.</param>
public class SkillCategoryRepository(
    IDbContextManager dbContextManager,
    IEnumerable<IAdditionalExtractConfiguration<SkillCategorySelector, SkillCategoryEntity>> additionalExtractConfiguration
) : DiscoveringRepositoryBase<SkillCategorySelector, SkillCategoryEntity, int>(dbContextManager, additionalExtractConfiguration), ISkillCategoryRepository
{
    /// <inheritdoc />
    protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillCategorySelector, SkillCategoryEntity> builder)
    {
        // ReSharper disable once PossibleInvalidOperationException
        builder.AddDiscoverRule(x => x.Id.HasValue, (x, _, ct) => GetById(x.Id.Value, ct));
    }

    /// <inheritdoc />
    public async Task<SkillTreeModel[]> QueryTree(SkillTreeFilter request, Session session, CancellationToken ct)
    {
        var dbContext = await GetContextAsync(ct);

        WhereExpressionContainer whereExpressions = request.IncludeActive switch
        {
            IncludeActiveOption.IncludeOnlyActive => new WhereExpressionContainer(entity => entity.IsActive, entity => entity.IsActive, entity => entity.IsActive),
            IncludeActiveOption.IncludeOnlyInactive => new WhereExpressionContainer(entity => !entity.IsActive, entity => !entity.IsActive, entity => !entity.IsActive),
            IncludeActiveOption.IncludeAll => new WhereExpressionContainer(entity => true, entity => true, entity => true),
            _ => throw new ArgumentOutOfRangeException()
        };


        var results = dbContext.Set<SkillCategoryEntity>()
                               .Where(whereExpressions.Category)
                               .Select(x => new SkillTreeModel { Name = x.Name, Id = x.Id, IsActive = x.IsActive, ParentId = null, NodeType = SkillAggregationLevel.SkillCategory})
                               .Concat(
                                   dbContext.Set<SkillEntity>().Where(whereExpressions.Skill)
                                            .Select(x => new SkillTreeModel { Name = x.Name, Id = x.Id, IsActive = x.IsActive, ParentId = x.CategoryId, NodeType = SkillAggregationLevel.Skill})
                               ).Concat(
                                   dbContext.Set<SkillLevelEntity>().Where(whereExpressions.Level)
                                            .Select(x => new SkillTreeModel { Name = x.Name, Id = x.Id, IsActive = x.IsActive, ParentId = x.SkillId, NodeType = SkillAggregationLevel.SkillLevel })
                               )
                               .ToArray();


        return results;
    }

    private record WhereExpressionContainer(
        Expression<Func<SkillCategoryEntity, bool>> Category,
        Expression<Func<SkillEntity, bool>> Skill,
        Expression<Func<SkillLevelEntity, bool>> Level
    );
}

public class SkillTreeModel
{
    public string Name { get; set; }
    public int Id { get; set; }
    public bool IsActive { get; set; }
    public int? ParentId { get; set; }
    public SkillAggregationLevel NodeType { get; set; }
}