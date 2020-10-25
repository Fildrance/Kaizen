using MassTransit;
using System;
using System.Threading.Tasks;

namespace Kaizen.Common.Service
{
	/// <summary> Base class for services that make MassTransit Request calls.</summary>
	public abstract class BusBasedService
	{
		protected BusBasedService(IBusControl busControl)
		{
			BusControl = busControl ?? throw new ArgumentNullException(nameof(busControl));
		}

		protected IBusControl BusControl { get; }

		/// <summary> Creates client and do rqeuest call (with awaiting and returning of result).</summary>
		/// <typeparam name="TIn">Type of contact.</typeparam>
		/// <typeparam name="TOut">Type of result.</typeparam>
		/// <param name="contract">Contract object to be used in call.</param>
		/// <exception cref="ArgumentNullException">Thrown if <see cref="contract"/> is null. </exception>
		/// <exception cref="RequestException">Thrown if mass transit returned exception from client call. </exception>
		/// <returns>Promise of client reponse.</returns>
		protected async Task<TOut> DoRequest<TIn, TOut>(TIn contract) where TIn : class where TOut : class
		{
			if (contract == null)
			{
				throw new ArgumentNullException(nameof(contract));
			}
			var client = BusControl.CreateRequestClient<TIn>();
			var resp = await client.GetResponse<TOut>(contract);
			return resp.Message;
		}
	}
}
