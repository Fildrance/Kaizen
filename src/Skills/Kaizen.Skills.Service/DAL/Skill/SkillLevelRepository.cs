using System.Collections.Generic;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Skill;

public class SkillLevelRepository(
    IDbContextManager dbContextManager,
    IEnumerable<IAdditionalExtractConfiguration<SkillLevelSelector, SkillLevelEntity>> additionalConfigurations
) : DiscoveringRepositoryBase<SkillLevelSelector, SkillLevelEntity, int>(dbContextManager, additionalConfigurations), ISkillLevelRepository
{
    /// <inheritdoc />
    protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillLevelSelector, SkillLevelEntity> builder)
    {
        builder.AddDiscoverRule(x => x.Id.HasValue, (x,_, ct) => GetById(x.Id.Value, ct));
    }
}