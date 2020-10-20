using Kaizen.Common.DAL.Repository;

namespace Kaizen.Skill.Service.DAL
{
    public class SkillBaseEntity: EntityBase<int>
    {
        public string Name { get; set; }
        public string ShortDescription { get; set; }
		public bool IsActive { get; set; }
	}
}