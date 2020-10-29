using JetBrains.Annotations;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Update;
using Kaizen.Common.Service;
using MassTransit;
using System.Threading.Tasks;

namespace Kaizen.Comments.Api.Services
{
	public class CommentsService : BusBasedService, ICommentsService
	{
		public CommentsService(IBusControl busControl) : base(busControl)
		{
		}

		public Task<CommentItem> Create([NotNull] CommentCreateContract contract)
		{
			return DoRequest<CommentCreateContract, CommentItem>(contract);
		}

		public Task<EmptyResponse> Delete([NotNull] CommentDeleteContract contract)
		{
			return DoRequest<CommentDeleteContract, EmptyResponse>(contract);
		}

		public Task<Page<CommentItem>> Query([NotNull] CommentFilter filter)
		{
			return DoRequest<CommentFilter, Page<CommentItem>>(filter);
		}

		public Task<CommentItem> Update([NotNull] CommentUpdateContract contract)
		{
			return DoRequest<CommentUpdateContract, CommentItem>(contract);
		}
	}
}
