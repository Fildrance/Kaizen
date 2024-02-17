using Enterprise.ApplicationBootstrap.DataAccessLayer.Configuration;
using Kaizen.Skill.Service.DAL.Migrations;
using Kaizen.Skills.Service.DAL.Entities;
using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skills.Service.DAL.Configuration;

public class WayConfiguration : IContextConfiguration
{
    /// <inheritdoc />
    public void Apply(ModelBuilder modelBuilder)
    {
        var wayConfig = modelBuilder.Entity<WayEntity>();
        wayConfig.ToTable(CreateWayAndGrade.WayTableName, CreateSkillSchema.SchemaName);
        wayConfig.Property(x => x.Id)
                 .HasIdentityOptions()
                 .ValueGeneratedOnAdd();
        wayConfig.HasMany(x => x.Grades)
                 .WithOne(x => x.Way)
                 .HasForeignKey(CreateWayAndGrade.WayId)
                 .HasPrincipalKey(x => x.Id);

        var gradeConfig = modelBuilder.Entity<GradeEntity>();
        gradeConfig.ToTable(CreateWayAndGrade.GradeTableName, CreateSkillSchema.SchemaName);
        gradeConfig.Property(x => x.Id)
                   .HasIdentityOptions()
                   .ValueGeneratedOnAdd();
        gradeConfig.HasMany(x => x.InWays)
                   .WithOne(x => x.Grade)
                   .HasForeignKey(CreateWayAndGrade.GradeId)
                   .HasPrincipalKey(x => x.Id);

        var gradeInWayConfig = modelBuilder.Entity<GradeInWayEntity>();
        gradeInWayConfig.HasKey(x => new { x.GradeId, x.WayId });

        var requirementConfig = modelBuilder.Entity<GradeRequirementEntity>();
        requirementConfig.ToTable(CreateGradeRequirements.RequirementsTableName, CreateSkillSchema.SchemaName);
        requirementConfig.Property(x => x.Id)
                         .HasIdentityOptions()
                         .ValueGeneratedOnAdd();
        requirementConfig.HasOne(x => x.Grade)
                         .WithMany(x => x.Requirements)
                         .HasForeignKey(CreateGradeRequirements.GradeId);
        requirementConfig.HasOne(x => x.SkillLevel)
                         .WithMany()
                         .HasForeignKey(CreateGradeRequirements.SkillLevelIdId);
    }
}