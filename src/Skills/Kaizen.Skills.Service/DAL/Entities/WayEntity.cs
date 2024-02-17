using System.Collections.Generic;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;

namespace Kaizen.Skills.Service.DAL.Entities;

public class WayEntity : EntityBase<int>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public bool IsActive { get; set; }

    public IList<GradeInWayEntity> Grades { get; set; }
}