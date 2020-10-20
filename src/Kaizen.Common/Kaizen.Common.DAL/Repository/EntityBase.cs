namespace Kaizen.Common.DAL.Repository
{
	/// <summary> Base class for EF entities. Simplifies a lot of repository related logic. </summary>
	/// <typeparam name="TId"> Type of Id to be used by entity. </typeparam>
	public class EntityBase<TId>
	{
		public TId Id { get; set; }
	}
}
