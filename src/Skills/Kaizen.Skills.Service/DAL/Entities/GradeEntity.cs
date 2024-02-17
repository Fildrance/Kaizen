using System.Collections.Generic;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;

namespace Kaizen.Skills.Service.DAL.Entities;

public class GradeEntity : EntityBase<int>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public bool IsActive { get; set; }

    public IList<GradeInWayEntity> InWays { get; set; }

    public IList<GradeRequirementEntity> Requirements { get; set; }
}