using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(7)]
    public class CreateSkillLevelPrerequisites : Migration
    {
        public const string PrerequisiteTableName = "skill_level_prerequisites";

        public const string SkillLevelIdId = "skill_level_id";
        public const string RequiredSkillLevelId = "required_skill_level_id";

        public override void Up()
        {
            Create.Table(PrerequisiteTableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn(SkillLevelIdId).AsInt32().Nullable()
                .WithColumn(RequiredSkillLevelId).AsByte().NotNullable();

            Create.PrimaryKey("skill_level_requirement_id").OnTable(PrerequisiteTableName).WithSchema(CreateSkillSchema.SchemaName)
                  .Columns(SkillLevelIdId, RequiredSkillLevelId);
            Create.ForeignKey().FromTable(PrerequisiteTableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(SkillLevelIdId)
                .ToTable(CreateSkillLevels.TableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");
            Create.ForeignKey().FromTable(PrerequisiteTableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(RequiredSkillLevelId)
                  .ToTable(CreateSkillLevels.TableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}