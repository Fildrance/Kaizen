using Enterprise.ApplicationBootstrap.DataAccessLayer.Configuration;
using Kaizen.Skill.Service.DAL.Migrations;
using Kaizen.Skills.Service.DAL.Entities;
using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skills.Service.DAL.Configuration;

public class SkillCategoryConfiguration : IContextConfiguration
{
    /// <inheritdoc />
    public void Apply(ModelBuilder modelBuilder)
    {
        var categoryConfig = modelBuilder.Entity<SkillCategoryEntity>();
        categoryConfig.ToTable(CreateSkillCategories.TableName, CreateSkillSchema.SchemaName);
        categoryConfig.Property(x => x.Id)
                      .HasIdentityOptions()
                      .ValueGeneratedOnAdd();
        categoryConfig.HasMany(x => x.Skils)
                      .WithOne(x => x.Category)
                      .HasForeignKey(x => x.CategoryId);

        var skillConfig = modelBuilder.Entity<SkillEntity>();
        skillConfig.ToTable(CreateSkills.TableName, CreateSkillSchema.SchemaName);
        skillConfig.Property(x => x.Id)
                   .HasIdentityOptions()
                   .ValueGeneratedOnAdd();
        skillConfig.HasMany(x => x.SkillLevels)
                   .WithOne(x => x.Skill)
                   .HasForeignKey(x => x.SkillId);
        skillConfig.Property(x => x.CategoryId)
                   .HasColumnName(CreateSkills.CategoryForeignKeyColumnName);

        var skillLevelConfig = modelBuilder.Entity<SkillLevelEntity>();
        skillLevelConfig.ToTable(CreateSkillLevels.TableName, CreateSkillSchema.SchemaName);
        skillLevelConfig.Property(x => x.Id)
                        .HasIdentityOptions()
                        .ValueGeneratedOnAdd();
        skillLevelConfig.HasMany(x => x.Prerequisites)
                        .WithOne(x => x.ForSkillLevel)
                        .HasForeignKey(CreateSkillLevelPrerequisites.SkillLevelIdId);
        skillLevelConfig.Property(x => x.SkillId)
                        .HasColumnName(CreateSkillLevels.SkillForeignKeyColumnName);

        var prerequisiteConfig = modelBuilder.Entity<SkillLevelPrerequisiteEntity>();
        prerequisiteConfig.ToTable(CreateSkillLevelPrerequisites.PrerequisiteTableName, CreateSkillSchema.SchemaName);
        prerequisiteConfig.HasKey(x => new { x.RequiredSkillLevelId, ForSkillLevelId = x.SkillLevelId });
        prerequisiteConfig.HasOne(x => x.PrerequiteIs)
                          .WithMany()
                          .HasForeignKey(CreateSkillLevelPrerequisites.RequiredSkillLevelId);
    }
}