using JetBrains.Annotations;

namespace Kaizen.Comments.Api.Create
{
	public class CommentCreateContract
	{
		[NotNull]
		public string SubjectType { get; set; }
		[NotNull]
		public string SubjectKey { get; set; }

		public string CommentText { get; set; }
	}
}
