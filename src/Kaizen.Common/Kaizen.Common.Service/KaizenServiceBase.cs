using System.Threading;
using System.Threading.Tasks;
using MassTransit;
using Microsoft.Extensions.Hosting;

namespace Kaizen.Common.Service
{
    /// <summary> Base class for background services that use mass-transit bus.</summary>
    public abstract class MassTransitBusServiceBase : BackgroundService
    {
        protected MassTransitBusServiceBase(IBusControl bus)
        {
            Bus = bus;
        }

        protected IBusControl Bus { get; }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            return Bus.StartAsync(stoppingToken);
        }

        public override Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.WhenAll(base.StopAsync(cancellationToken), Bus.StopAsync(cancellationToken));
        }
    }
}