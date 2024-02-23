using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Service.DAL.Entities;
using Microsoft.EntityFrameworkCore;

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
    public async Task<Page<SkillTreeItem>> QueryTree(SkillTreeFilter request, Session session, CancellationToken ct)
    {
        var dbContext = await GetContextAsync(ct);
        var result = request.AggregationLevel switch
        {
            SkillAggregationLevel.SkillCategory => dbContext.Set<SkillCategoryEntity>()
                                                            .Select(x => new SkillTreeItem
                                                            {
                                                                Id = x.Id,
                                                                Name = x.Name,
                                                                IsActive = x.IsActive,
                                                                HasItems = x.Skils.Any()
                                                            }),
            SkillAggregationLevel.Skill => dbContext.Set<SkillEntity>()
                                                    .Where(x => x.Category.Id == request.ParentId)
                                                    .Select(x => new SkillTreeItem
                                                    {
                                                        Id = x.Id,
                                                        Name = x.Name,
                                                        IsActive = x.IsActive,
                                                        HasItems = x.SkillLevels.Any()
                                                    }),
            SkillAggregationLevel.SkillLevel => dbContext.Set<SkillLevelEntity>()
                                                         .Where(x => x.Skill.Id == request.ParentId)
                                                         .Select(x => new SkillTreeItem
                                                         {
                                                             Id = x.Id,
                                                             Name = x.Name,
                                                             IsActive = x.IsActive,
                                                             HasItems = false
                                                         }),
            _ => throw new ArgumentOutOfRangeException()
        };
        if (!string.IsNullOrWhiteSpace(request.SubstringToFind))
        {
            result = result.Where(x => EF.Functions.ILike(x.Name, $"%{request.SubstringToFind}%"));
        }

        result = result.OrderBy(x => x.Id);
        if (request.Skip.HasValue)
        {
            result = result.Skip(request.Skip.Value);
        }

        var count = await result.CountAsync(cancellationToken: ct);
        if (count == 0)
        {
            return new Page<SkillTreeItem>(Array.Empty<SkillTreeItem>(), 0);
        }

        if (request.Take.HasValue)
        {
            result = result.Take(request.Take.Value);
        }

        var data = await result.ToArrayAsync(cancellationToken: ct);
        return new Page<SkillTreeItem>(data, count);
    }
}