using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(3)]
    public class CreateSkills: Migration
    {
        public const string TableName = "skills";
        public const string CategoryForeignKeyColumnName = "category_id";

        public override void Up()
        {
            Create.Table(TableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("id").AsInt32().PrimaryKey().Identity()
                .WithColumn("name").AsString(512).NotNullable()
                .WithColumn("short_description").AsString(1000).Nullable()
                .WithColumn("description").AsString(8000).Nullable()
                .WithColumn("is_active").AsBoolean().NotNullable()
                .WithColumn(CategoryForeignKeyColumnName).AsInt32().NotNullable();

            Create.ForeignKey().FromTable(TableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(CategoryForeignKeyColumnName)
                .ToTable(CreateSkillCategories.TableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}