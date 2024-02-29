using System.Collections.Generic;
using System.Threading.Tasks;
using System.Threading;
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
}