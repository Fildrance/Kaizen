using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(2)]
    public class CreateSkillCategories : Migration
    {
        public const string TableName = "SkillCategories";

        public override void Up()
        {
            Create.Table(TableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("Id").AsInt32().PrimaryKey().Identity()
                .WithColumn("Name").AsString(511).NotNullable()
                .WithColumn("ShortDescription").AsString(2000).Nullable();
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}