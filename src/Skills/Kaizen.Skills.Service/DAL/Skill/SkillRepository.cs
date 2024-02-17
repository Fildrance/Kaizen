using System.Collections.Generic;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Skill;

public class SkillRepository(
    IDbContextManager dbContextManager,
    IEnumerable<IAdditionalExtractConfiguration<SkillSelector, SkillEntity>> additionalConfigurations
) : DiscoveringRepositoryBase<SkillSelector, SkillEntity, int>(dbContextManager, additionalConfigurations), ISkillRepository
{
    protected override void DoConfigureExtractor(EntityExtractorBuilder<SkillSelector, SkillEntity> builder)
    {
        builder.AddDiscoverRule(x => x.Id.HasValue, (x, ct) => GetById(x.Id.Value, ct));
    }
}