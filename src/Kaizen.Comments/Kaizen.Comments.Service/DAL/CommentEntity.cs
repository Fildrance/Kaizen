using JetBrains.Annotations;

namespace Kaizen.Comments.Service.DAL
{
	[BsonCollection("comments")]
	public class CommentEntity : DocumentBase
	{
		[NotNull]
		public string SubjectType { get; set; }
		[NotNull]
		public string SubjectKey { get; set; }

		public string CommentText { get; set; }
	}
}
