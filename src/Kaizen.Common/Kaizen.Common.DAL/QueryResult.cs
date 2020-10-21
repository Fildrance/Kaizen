using System.Collections.Generic;

namespace Kaizen.Skill.Service.DAL
{
	/// <summary> Package of data with query result. Can be result of paged query.</summary>
	public class QueryResult<T>
	{
		public IReadOnlyCollection<T> Items { get; }
		public int TotalCount { get; }

		public QueryResult(IReadOnlyCollection<T> items, int totalCount)
		{
			Items = items;
			TotalCount = totalCount;
		}
	}
}