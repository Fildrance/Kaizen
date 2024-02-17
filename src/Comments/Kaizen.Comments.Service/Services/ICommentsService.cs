using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using JetBrains.Annotations;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Update;

namespace Kaizen.Comments.Service.Services;

/// <summary> Service that manages comments.</summary>
public interface ICommentsService
{
    [NotNull]
    Task<CommentItem> Create([NotNull] CommentCreateRequest request, CancellationToken ct);

    [NotNull]
    Task<CommentItem> Update([NotNull] CommentUpdateRequest request, CancellationToken ct);

    [NotNull]
    Task<Page<CommentItem>> Query([NotNull] CommentFilter filter, CancellationToken ct);

    [NotNull]
    Task Delete([NotNull] CommentDeleteRequest request, CancellationToken ct);

}