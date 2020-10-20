using System.Threading;
using System.Threading.Tasks;
using MassTransit;
using FluentMigrator.Runner;
using System;
using Kaizen.Common.Service;

namespace Kaizen.Common.Utils
{
	/// <summary> Base class for background services that use mass-transit bus and relational database with fluent migrator.</summary>
	public abstract class MassTransitBusServiceWithDbMigrationBase : MassTransitBusServiceBase
    {
        private readonly IMigrationRunner _migrationRunner;

        protected MassTransitBusServiceWithDbMigrationBase(IBusControl bus, IMigrationRunner migrationRunner) : base(bus)
        {
            _migrationRunner = migrationRunner ?? throw new ArgumentNullException(nameof(migrationRunner));
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            СurrentLogger.Info("Starting migrations.");
            _migrationRunner.MigrateUp();
            СurrentLogger.Info("Finished with migrations");

            return base.ExecuteAsync(stoppingToken);
        }
    }
}