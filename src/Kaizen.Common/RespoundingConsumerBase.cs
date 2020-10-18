using System.Threading.Tasks;
using MassTransit;

namespace Kaizen.Common
{
    /// <summary> Basic class for <see cref="IConsumer"/> that will response on request. Wraps default MassTransit methods into simpler to understand way of interaction.</summary>
    /// <typeparam name="TRequest">Type of input contract - request.</typeparam>
    /// <typeparam name="TResponse">Type of output contract - response.</typeparam>
    public abstract class RespoundingConsumerBase<TRequest, TResponse> : IConsumer<TRequest> where TRequest : class
    {
        public async Task Consume(ConsumeContext<TRequest> context)
        {
            var result = await DoExecute(context.Message, context);
            await context.RespondAsync(result);
        }

        protected abstract Task<TResponse> DoExecute(TRequest message, ConsumeContext<TRequest> context);
    }
}