using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(2)]
    public class CreateSkillCategories : Migration
    {
        public const string TableName = "skill_categories";

        public override void Up()
        {
            Create.Table(TableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("id").AsInt32().PrimaryKey().Identity()
                .WithColumn("name").AsString(500).NotNullable()
                .WithColumn("short_description").AsString(2000).Nullable()
                .WithColumn("is_active").AsBoolean().NotNullable();
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}