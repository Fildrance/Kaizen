using Kaizen.Comments.Service.WindsorInstaller;
using Kaizen.Common.Service;
using System;
using System.Threading.Tasks;

namespace Kaizen.Comments.Service
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
            var port = env["DBPORT"] ?? 27017;
            var dbName = (string)env["DBNAME"];
            var dbUser = env["DBUSER"];
            var dbPassword = env["DBPASSWORD"];

            
            var connectionString = $"mongodb://{dbUser}:{dbPassword}@{host}:{port}";

            var programType = typeof(Program);

            await ServiceHelper.ExecuteInNlogWrap(
                programType.FullName,
                () => {
                    var commentsInstaller = new CommentsInstaller(rabbitHost, rabbitUser, rabbitPassword);
                    var mongoInstaller = new MongoInstaller(connectionString, dbName);
                    return ServiceHelper.CreateConsoleHostAndRun<CommentsBackgroundService>(commentsInstaller, mongoInstaller);
                }
            );
        }
    }
}
