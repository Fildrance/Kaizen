using System;
using System.Threading.Tasks;
using Kaizen.Common.DAL;
using Kaizen.Common.Service;
using Kaizen.Skill.Service.WindsorInstaller;

namespace Kaizen.Skill.Service
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var env = Environment.GetEnvironmentVariables();

            var rabbitHost = (string)env["RABBITHOST"];
            var rabbitUser = (string)env["RABBITUSER"];
            var rabbitPassword = (string)env["RABBITPASSWORD"];

            var host = env["DBHOST"];
            var port = env["DBPORT"] ?? 5432;
            var dbName = env["DBNAME"];
            var dbUser = env["DBUSER"];
            var dbPassword = env["DBPASSWORD"];

            var _connectionString = $"Host={host};Port={port};Database={dbName};Username={dbUser};Password={dbPassword}";

            var programType = typeof(Program);

            await ServiceHelper.ExecuteInNlogWrap(
                programType.FullName,
                () => {
                    var skillInstaller = new SkillInstaller(rabbitHost, rabbitUser, rabbitPassword, _connectionString);
                    return ServiceDALHelper.CreateConsoleHostWithMigratorAndRun<SkillService>(skillInstaller);
                }
            );
        }
    }
}
