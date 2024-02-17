using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(6)]
    public class CreateGradeRequirements : Migration
    {
        public const string RequirementsTableName = "requirements";

        public const string GradeId = "grade_id";
        public const string SkillLevelIdId = "skill_level_id";

        public override void Up()
        {
            Create.Table(RequirementsTableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("id").AsInt32().PrimaryKey().Identity()
                .WithColumn(GradeId).AsInt32().NotNullable()
                .WithColumn(SkillLevelIdId).AsInt32().Nullable()
                .WithColumn("type").AsByte().NotNullable();

            Create.ForeignKey().FromTable(RequirementsTableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(GradeId)
                .ToTable(CreateWayAndGrade.GradeTableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");

            Create.ForeignKey().FromTable(RequirementsTableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(SkillLevelIdId)
                  .ToTable(CreateSkillLevels.TableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}