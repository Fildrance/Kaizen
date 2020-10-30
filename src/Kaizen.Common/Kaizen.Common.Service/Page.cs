using System.Collections.Generic;

namespace Kaizen.Common.Service
{
	/// <summary> Page of items. If <see cref="TotalCount"/> != <see cref="Items"/>. Length, then results are paged and only part of total results is present.</summary>
	public class Page<T>
	{
		public IReadOnlyCollection<T> Items { get; }
		public int TotalCount { get; }

		public Page(IReadOnlyCollection<T> items, int totalCount)
		{
			Items = items;
			TotalCount = totalCount;
		}
	}
}