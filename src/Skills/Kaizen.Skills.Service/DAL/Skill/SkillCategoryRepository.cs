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
        builder.AddDiscoverRule(x => x.Id.HasValue, (x, ct) => GetById(x.Id.Value, ct));
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
                                                                HasItems = x.Skils.Any()
                                                            }),
            SkillAggregationLevel.Skill => dbContext.Set<SkillEntity>()
                                                    .Select(x => new SkillTreeItem
                                                    {
                                                        Id = x.Id,
                                                        Name = x.Name,
                                                        HasItems = x.SkillLevels.Any()
                                                    }),
            SkillAggregationLevel.SkillLevel => dbContext.Set<SkillLevelEntity>()
                                                         .Select(x => new SkillTreeItem
                                                         {
                                                             Id = x.Id,
                                                             Name = x.Name,
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
        var count = result.CountAsync(cancellationToken: ct);

        if (request.Take.HasValue)
        {
            result = result.Take(request.Take.Value);
        }

        var data = result.ToArrayAsync(cancellationToken: ct);
        return new Page<SkillTreeItem>(await data, await count);
    }
}