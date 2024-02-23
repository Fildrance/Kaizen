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
    public async Task<Page<SkillCategoryEntity>> QueryTree(SkillTreeFilter request, Session session, CancellationToken ct)
    {
        var dbContext = await GetContextAsync(ct);
        var result = dbContext.Set<SkillCategoryEntity>()
                              .Include(x => x.Skils)
                              .ThenInclude(x => x.SkillLevels)
                              .OrderBy(x => x.Id);

        var count = await result.CountAsync(cancellationToken: ct);
        if (count == 0)
        {
            return new Page<SkillCategoryEntity>(Array.Empty<SkillCategoryEntity>(), 0);
        }

        var data = await result.ToArrayAsync(cancellationToken: ct);
        return new Page<SkillCategoryEntity>(data, count);
    }
}