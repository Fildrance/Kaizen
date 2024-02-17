using Enterprise.ApplicationBootstrap.Core.Api.Models;
using JetBrains.Annotations;
using Kaizen.Comments.Api.Items;
using MediatR;

namespace Kaizen.Comments.Api.Filter;

public class CommentFilter : IRequest<Page<CommentItem>>
{
    [NotNull]
    public string SubjectType { get; set; }
    [NotNull]
    public string SubjectKey { get; set; }
}