using System;

namespace Kaizen.Common.Service
{
    public static class RabbitUriHelper
    {
        /// <summary> Creates uri for queue with passed name. This uri can be used by mass-transit. </summary>
        /// <param name="queueName">Name of queue.</param>
        /// <returns>Uri for queue.</returns>
        public static Uri QueueUri(string queueName)
        {
            return new Uri("queue:" + queueName);
        }
    }
}