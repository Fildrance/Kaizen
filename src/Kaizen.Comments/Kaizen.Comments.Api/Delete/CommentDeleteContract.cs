using Kaizen.Comments.Api.Selector;

namespace Kaizen.Comments.Api.Delete
{
	public class CommentDeleteContract
	{
		public CommentSelector ToDelete { get; set; }
	}
}
