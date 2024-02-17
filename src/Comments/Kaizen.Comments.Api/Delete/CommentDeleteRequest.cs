using Kaizen.Comments.Api.Selector;
using MediatR;

namespace Kaizen.Comments.Api.Delete;

public class CommentDeleteRequest : IRequest
{
    public CommentSelector ToDelete { get; set; }
}