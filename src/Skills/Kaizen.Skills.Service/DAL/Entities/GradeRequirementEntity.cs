using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;

namespace Kaizen.Skills.Service.DAL.Entities;

public class GradeRequirementEntity : EntityBase<int>
{
    public GradeEntity Grade { get; set; }
    public SkillLevelEntity SkillLevel { get; set; }
    public RequirementType Type { get; set; }
}