using JetBrains.Annotations;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Update;
using Kaizen.Common.Service;
using System.Threading.Tasks;

namespace Kaizen.Comments.Api.Services
{
	/// <summary> Service that manages comments.</summary>
	public interface ICommentsService
	{
		[NotNull]
		Task<CommentItem> Create([NotNull] CommentCreateContract contract);

		[NotNull]
		Task<CommentItem> Update([NotNull] CommentUpdateContract contract);

		[NotNull]
		Task<Page<CommentItem>> Query([NotNull] CommentFilter filter);

		[NotNull]
		Task<EmptyResponse> Delete([NotNull] CommentDeleteContract contract);

	}
}
