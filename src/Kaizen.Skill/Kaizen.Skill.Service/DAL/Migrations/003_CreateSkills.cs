using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(3)]
    public class CreateSkills: Migration
    {
        public const string TableName = "Skills";
        public const string CategoryForeignKeyColumnName = "CategoryId";

        public override void Up()
        {
            Create.Table(TableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("Id").AsInt32().PrimaryKey().Identity()
                .WithColumn("Name").AsString(511).NotNullable()
                .WithColumn("ShortDescription").AsString(2000).Nullable()
                .WithColumn("IsActive").AsBoolean().NotNullable()
                .WithColumn(CategoryForeignKeyColumnName).AsInt32().NotNullable();

            Create.ForeignKey().FromTable(TableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(CategoryForeignKeyColumnName)
                .ToTable(CreateSkillCategories.TableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("Id");
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}