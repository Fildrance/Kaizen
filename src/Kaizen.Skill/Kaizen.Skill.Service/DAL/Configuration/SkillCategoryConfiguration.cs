using Kaizen.Skill.Service.DAL.Migrations;
using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skill.Service.DAL.Configuration
{
    public class SkillCategoryConfiguration : IContextConfiguration
    {
        public void Apply(ModelBuilder modelBuilder)
        {
            var categoryConfig = modelBuilder.Entity<SkillCategoryEntity>();
            categoryConfig.ToTable(CreateSkillCategories.TableName, CreateSkillSchema.SchemaName);
            categoryConfig.Property(x => x.Id)
                .HasIdentityOptions()
                .ValueGeneratedOnAdd();
        }
    }
}
