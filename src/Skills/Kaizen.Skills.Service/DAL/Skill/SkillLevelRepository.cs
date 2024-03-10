using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Threading;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Entities;
using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skills.Service.DAL.Skill;

public class SkillLevelRepository(
    IDbContextManager dbContextManager,
    IEnumerable<IAdditionalExtractConfiguration<SkillLevelSelector, SkillLevelEntity>> additionalConfigurations
) : DiscoveringRepositoryBase<SkillLevelSelector, SkillLevelEntity, int>(dbContextManager, additionalConfigurations), ISkillLevelRepository
{
    /// <inheritdoc />
    protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillLevelSelector, SkillLevelEntity> builder)
    {
        builder.AddDiscoverRule(x => x.Id.HasValue, (x, _, ct) => GetByIdWithPrerequisites(x.Id.Value, ct));
    }

    private async Task<SkillLevelEntity> GetByIdWithPrerequisites(int id, CancellationToken ct)
    {
        var dbContext = await GetContextAsync(ct);
        return await dbContext.Set<SkillLevelEntity>()
                              .Include(x => x.Prerequisites)
                              .FirstAsync(x => x.Id.Equals(id), cancellationToken: ct);
    }

    /// <inheritdoc />
    public async Task<Page<SkillLevelPrerequisiteEntity>> QueryPrerequisites(SkillLevelPrerequisiteFilter filter, CancellationToken ct)
    {
        var context = await GetContextAsync(ct);
        var set = context.Set<SkillLevelPrerequisiteEntity>();
        IQueryable<SkillLevelPrerequisiteEntity> requirementsQuery = set;
        if (filter.IncludeOnlyBoundWithActiveSkillLevels)
        {
            requirementsQuery = requirementsQuery.Where(x => x.ForSkillLevel.IsActive && x.PrerequiteIs.IsActive);
        }

        var totalCount = await requirementsQuery.CountAsync(ct);


        if (filter.Skip.HasValue)
        {
            requirementsQuery = requirementsQuery.Skip(filter.Skip.Value);
        }

        if (filter.Take.HasValue)
        {
            requirementsQuery = requirementsQuery.Take(filter.Take.Value);
        }

        var items = await requirementsQuery.ToArrayAsync(ct);

        return new Page<SkillLevelPrerequisiteEntity>(items, totalCount);
    }

    /// <inheritdoc />
    public async Task AttachPrerequisite(SkillLevelEntity forLevel, SkillLevelEntity requiredLevel, CancellationToken ct)
    {
        var context = await GetContextAsync(ct);
        var entity = new SkillLevelPrerequisiteEntity
        {
            ForSkillLevel = forLevel,
            PrerequiteIs = requiredLevel
        };
        context.Set<SkillLevelPrerequisiteEntity>()
               .Add(entity);
        await context.SaveChangesAsync(ct);
    }

    /// <inheritdoc />
    public async Task DetachPrerequisite(SkillLevelSelector forSkillLevel, SkillLevelSelector requiredIs, CancellationToken ct)
    {
        var context = await GetContextAsync(ct);
        await context.Set<SkillLevelPrerequisiteEntity>()
                     .Where(x => x.RequiredSkillLevelId == requiredIs.Id && x.SkillLevelId == forSkillLevel.Id)
                     .ExecuteDeleteAsync(cancellationToken: ct);
    }
}