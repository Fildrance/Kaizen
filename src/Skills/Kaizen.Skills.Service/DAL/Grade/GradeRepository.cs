using System.Collections.Generic;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.DAL.Grade;

public class GradeRepository(
    IDbContextManager dbContextManager,
    IEnumerable<IAdditionalExtractConfiguration<GradeSelector, GradeEntity>> additionalConfigurations
) : DiscoveringRepositoryBase<GradeSelector, GradeEntity, int>(dbContextManager, additionalConfigurations), IGradeRepository
{
    protected override void DoConfigureExtractor(EntityExtractorBuilder<GradeSelector, GradeEntity> builder)
    {
        builder.AddDiscoverRule(x => x.Id.HasValue, (x, ct) => GetById(x.Id.Value, ct));
    }
}