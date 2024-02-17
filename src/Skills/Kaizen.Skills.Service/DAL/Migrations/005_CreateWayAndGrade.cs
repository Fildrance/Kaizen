using System;
using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(5)]
    public class CreateWayAndGrade: Migration
    {
        public const string WayTableName = "ways";
        public const string GradeTableName = "grades";
        public const string GradeInWayTableName = "grades_in_ways";

        public const string GradeId = "grade_id";
        public const string WayId = "way_id";

        public override void Up()
        {
            Create.Table(WayTableName).InSchema(CreateSkillSchema.SchemaName)
                .WithColumn("id").AsInt32().PrimaryKey().Identity()
                .WithColumn("name").AsString(1000).NotNullable()
                .WithColumn("short_description").AsString(2000).Nullable()
                .WithColumn("is_active").AsBoolean().NotNullable();

            Create.Table(GradeTableName).InSchema(CreateSkillSchema.SchemaName)
                  .WithColumn("id").AsInt32().PrimaryKey().Identity()
                  .WithColumn("name").AsString(1000).NotNullable()
                  .WithColumn("short_description").AsString(2000).Nullable()
                  .WithColumn("is_active").AsBoolean().NotNullable();

            Create.Table(GradeInWayTableName).InSchema(CreateSkillSchema.SchemaName)
                  .WithColumn(GradeId).AsInt32()
                  .WithColumn(WayId).AsInt32()
                  .WithColumn("order_in_way").AsInt32();

            Create.ForeignKey().FromTable(GradeInWayTableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(GradeId)
                .ToTable(GradeTableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");

            Create.ForeignKey().FromTable(GradeInWayTableName).InSchema(CreateSkillSchema.SchemaName).ForeignColumn(WayId)
                  .ToTable(WayTableName).InSchema(CreateSkillSchema.SchemaName).PrimaryColumn("id");
        }

        public override void Down()
        {
            throw new NotSupportedException();
        }   
    }

}