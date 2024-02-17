using JetBrains.Annotations;
using Kaizen.Comments.Api.Items;
using MediatR;

namespace Kaizen.Comments.Api.Create;

public class CommentCreateRequest : IRequest<CommentItem>
{
    [NotNull] public string SubjectType { get; set; }
    [NotNull] public string SubjectKey { get; set; }

    public string CommentText { get; set; }
}