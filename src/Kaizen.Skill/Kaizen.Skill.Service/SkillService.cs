using System.Threading;
using System.Threading.Tasks;
using FluentMigrator.Runner;
using Kaizen.Common.Utils;
using MassTransit;
using NLog;

namespace Kaizen.Skill.Service
{
    internal class SkillService : MassTransitBusServiceWithDbMigrationBase
    {
        private static readonly ILogger Logger = LogManager.GetLogger(typeof(SkillService).FullName);

        public SkillService(IBusControl bus, IMigrationRunner migrationRunner) : base(bus, migrationRunner)
        {
        }

        protected override ILogger СurrentLogger => Logger;

		public override Task StartAsync(CancellationToken cancellationToken)
        {
            Logger.Info("Starting skill service.");
            return base.StartAsync(cancellationToken);
        }

        public override Task StopAsync(CancellationToken cancellationToken)
        {
            Logger.Info("Stopping skill service.");
            return base.StopAsync(cancellationToken);
        }
    }
}