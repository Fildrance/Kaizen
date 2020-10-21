using Kaizen.ApiGateway.Controllers;
using System.Collections.Generic;

namespace Kaizen.Common.Service
{
	/// <summary> Base type for query consumer (that will query paged data).</summary>
	public abstract class QueryRespoundingConsumerBase<TIn, TOut> : RespoundingConsumerBase<TIn, Page<TOut>> where TIn : class
	{
		/// <summary> Factory methods for <see cref="Page{T}"/> objects.</summary>
		protected Page<TOut> Page(IReadOnlyCollection<TOut> items, int totalCount)
		{
			return new Page<TOut>(items, totalCount);
		}
	}
}
