using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;

namespace Kaizen.Skills.Service.DAL.Entities;

public class SkillBaseEntity : EntityBase<int>
{
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public bool IsActive { get; set; }
}