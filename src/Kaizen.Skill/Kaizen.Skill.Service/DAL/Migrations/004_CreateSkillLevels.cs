using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(4)]
    public class CreateSkillLevels: Migration
    {
        public const string TableName = "SkillLevels";
        public const string SkillForeignKeyColumnName = "SkillId";

        public override void Up()
        {
            Create.Table(TableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("Id").AsInt32().PrimaryKey().Identity()
                .WithColumn("Name").AsString(1023).NotNullable()
                .WithColumn("ShortDescription").AsString(2000).Nullable()
                .WithColumn("FullDescription").AsString(8000).Nullable()
                .WithColumn("IsActive").AsBoolean().NotNullable()
                .WithColumn("Weight").AsInt32().Nullable()
                .WithColumn(SkillForeignKeyColumnName).AsInt32().NotNullable();

            Create.ForeignKey().FromTable(TableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(SkillForeignKeyColumnName)
                .ToTable(CreateSkills.TableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("Id");
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}