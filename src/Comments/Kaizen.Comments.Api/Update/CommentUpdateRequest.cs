using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Selector;
using MediatR;

namespace Kaizen.Comments.Api.Update;

public class CommentUpdateRequest : IRequest<CommentItem>
{
    public string CommentText { get; set; }

    public CommentSelector ToUpdate{ get; set; }
}