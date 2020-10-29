using JetBrains.Annotations;

namespace Kaizen.Comments.Api.Filter
{
	public class CommentFilter
	{
		[NotNull]
		public string SubjectType { get; set; }
		[NotNull]
		public string SubjectKey { get; set; }
	}
}
