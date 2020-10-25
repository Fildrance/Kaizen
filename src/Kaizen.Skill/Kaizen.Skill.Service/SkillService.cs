using System.Threading;
using System.Threading.Tasks;
using FluentMigrator.Runner;
using Kaizen.Common.Utils;
using MassTransit;
using NLog;

namespace Kaizen.Skill.Service
{
    internal class SkillBackgroundService : MassTransitBusServiceWithDbMigrationBase
    {
        private static readonly ILogger Logger = LogManager.GetLogger(typeof(SkillBackgroundService).FullName);

        public SkillBackgroundService(IBusControl bus, IMigrationRunner migrationRunner) : base(bus, migrationRunner)
        {
        }

        protected override ILogger СurrentLogger => Logger;

        protected override string ServiceName => "Skill service";

		public override Task StartAsync(CancellationToken cancellationToken)
        {
            return base.StartAsync(cancellationToken);
        }

        public override Task StopAsync(CancellationToken cancellationToken)
        {
            return base.StopAsync(cancellationToken);
        }
    }
}