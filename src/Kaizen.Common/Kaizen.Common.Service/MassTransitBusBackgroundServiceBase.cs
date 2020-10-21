using System.Threading;
using System.Threading.Tasks;
using MassTransit;
using Microsoft.Extensions.Hosting;
using NLog;

namespace Kaizen.Common.Service
{
    /// <summary> Base class for background services that use mass-transit bus.</summary>
    public abstract class MassTransitBusBackgroundServiceBase : BackgroundService
    {
        protected MassTransitBusBackgroundServiceBase(IBusControl bus)
        {
            Bus = bus;
        }

        protected IBusControl Bus { get; }
        protected abstract ILogger СurrentLogger{get;}

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            return Bus.StartAsync(stoppingToken).ContinueWith(x=>{
                СurrentLogger.Info("Started bus.");
            });
        }

        public override Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.WhenAll(base.StopAsync(cancellationToken), Bus.StopAsync(cancellationToken));
        }
    }
}