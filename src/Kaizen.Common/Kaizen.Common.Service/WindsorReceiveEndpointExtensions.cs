using Castle.Windsor;
using MassTransit;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Kaizen.Common.Service;

public static class WindsorReceiveEndpointExtensions
{
    public static void Consumer(this IReceiveEndpointConfigurator configurator, IWindsorContainer container, Type consumerType)
    {
        configurator.Consumer(consumerType, x => container.Resolve(consumerType));
    }

    public static void Consumer(this IReceiveEndpointConfigurator configurator, IWindsorContainer container, IEnumerable<Type> consumerTypes)
    {
        foreach (var consumerType in consumerTypes)
        {
            configurator.Consumer(consumerType, x => container.Resolve(consumerType));
        }
    }

    /// <summary> Registers list of consumer types to listen on mentioned queue. </summary>
    /// <remarks> This registration doesn't use scoped way of consumer generation, this may lead to unpleasant side effects, so best approach is to not use stateful consumers.</remarks>
    public static void AllServiceConsumersToEndpoint<TEndpointConfigurator>(
        this IReceiveConfigurator<TEndpointConfigurator> cfg,
        string queueName,
        IWindsorContainer container,
        Assembly consumerAssembly,
        ILogger logger = null
    )
        where TEndpointConfigurator : IReceiveEndpointConfigurator
    {
        cfg.ReceiveEndpoint(queueName,
            endpoint =>
            {
                var implementations = container.Kernel.GetAssignableHandlers(typeof(IConsumer))
                                               .Select(x => x.ComponentModel.Implementation).Where(x => x.Assembly == consumerAssembly).ToArray();
                if (null != logger)
                {
                    var message = new StringBuilder();
                    message.Append("Starting to watch endpoint " + queueName + " using following consumers:");
                    foreach (var handler in implementations)
                    {
                        message.Append("\r\n * ");
                        message.Append(handler.FullName);
                    }
                    logger.Info(message);
                }

                endpoint.Consumer(container, implementations);
            }
        );
    }
}