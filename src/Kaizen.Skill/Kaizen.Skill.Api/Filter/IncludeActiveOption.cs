namespace Kaizen.Skill.Api.Filter
{
	/// <summary> Options for taking de-activatable records. </summary>
	public enum IncludeActiveOption
	{
		/// <summary> Conventional guard value, should not be used. </summary>
		None = 0,
		/// <summary> Get only active records. </summary>
		IncludeOnlyActive = 1,
		/// <summary> Get only inactive records. </summary>
		IncludeOnlyInactive = 2,
		/// <summary> Get only all records. </summary>
		IncludeAll
	}
}