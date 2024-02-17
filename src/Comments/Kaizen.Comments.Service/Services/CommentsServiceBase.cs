using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Update;
using MediatR;

namespace Kaizen.Comments.Service.Services;

public class CommentsServiceBase(IMediator mediator) : ICommentsService
{
    public Task<CommentItem> Create(CommentCreateRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    public Task Delete(CommentDeleteRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    public Task<Page<CommentItem>> Query(CommentFilter filter, CancellationToken ct)
        => mediator.Send(filter, ct);

    public Task<CommentItem> Update(CommentUpdateRequest request, CancellationToken ct)
        => mediator.Send(request, ct);
}