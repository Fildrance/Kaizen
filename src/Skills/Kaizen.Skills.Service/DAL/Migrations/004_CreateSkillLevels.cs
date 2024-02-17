using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(4)]
    public class CreateSkillLevels: Migration
    {
        public const string TableName = "skill_levels";
        public const string SkillForeignKeyColumnName = "skill_id";

        public override void Up()
        {
            Create.Table(TableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("id").AsInt32().PrimaryKey().Identity()
                .WithColumn("name").AsString(1000).NotNullable()
                .WithColumn("short_description").AsString(2000).Nullable()
                .WithColumn("description").AsString(int.MaxValue).Nullable()
                .WithColumn("is_active").AsBoolean().NotNullable()
                .WithColumn("weight").AsInt32().Nullable()
                .WithColumn(SkillForeignKeyColumnName).AsInt32().NotNullable();

            Create.ForeignKey().FromTable(TableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(SkillForeignKeyColumnName)
                .ToTable(CreateSkills.TableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}