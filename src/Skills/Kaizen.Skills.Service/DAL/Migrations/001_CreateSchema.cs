using FluentMigrator;

namespace Kaizen.Skill.Service.DAL.Migrations
{
    [Migration(1)]
    public class CreateSkillSchema : Migration
    {
        public const string SchemaName = "skill";
        public override void Up()
        {
            Create.Schema(SchemaName);
        }

        public override void Down()
        {
            Delete.Schema(SchemaName);
        }
    }

}