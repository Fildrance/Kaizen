using FluentMigrator.Runner;
using Kaizen.Common.Utils;
using MassTransit;

namespace Kaizen.Skill.Service
{
    internal class SkillService : MassTransitBusServiceWithDbMigrationBase
    {
        public SkillService(IBusControl bus, IMigrationRunner migrationRunner) : base(bus, migrationRunner)
        {
        }
    }
}