using Kaizen.Comments.Api.Selector;

namespace Kaizen.Comments.Api.Update
{
	public class CommentUpdateContract
	{
		public string CommentText { get; set; }

		public CommentSelector ToUpdate{ get; set; }
	}
}
