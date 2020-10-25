using Kaizen.Common.DAL.Configuration;
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
            categoryConfig.HasMany(x => x.Skils)
                .WithOne(x => x.Category)
                .HasForeignKey(CreateSkills.CategoryForeignKeyColumnName);

            var skillConfig = modelBuilder.Entity<SkillEntity>();

            skillConfig.ToTable(CreateSkills.TableName , CreateSkillSchema.SchemaName);
            skillConfig.Property(x => x.Id)
                .HasIdentityOptions()
                .ValueGeneratedOnAdd();

        }
    }
}
