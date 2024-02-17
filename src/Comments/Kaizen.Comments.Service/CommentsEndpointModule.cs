using System.Collections.Generic;
using Enterprise.ApplicationBootstrap.WebApi.Modules;
using Enterprise.ApplicationBootstrap.WebApi.Modules.Endpoints;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Update;
using Kaizen.Comments.Service.Services;
using Microsoft.AspNetCore.Routing;

namespace Kaizen.Comments.Service;

internal class CommentsEndpointModule : EndpointRouteConfigureAwareModuleBase
{
    /// <inheritdoc />
    public override IEnumerable<IEndpointRouteBuilderAggregator> GetEndpointRouteBuilders(IEndpointRouteBuilder endpointRouteBuilder)
    {
        yield return CreateAggregator<ICommentsService>(builder => new[]
        {
            builder.MapPut<CommentCreateRequest>("/api/comments").To((service, request, ct) => service.Create(request, ct)),
            builder.MapDelete<CommentDeleteRequest>("/api/comments").To((srv, request, ct) => srv.Delete(request, ct)),
            builder.MapPost<CommentUpdateRequest>("api/comments").To((srv, request, ct) => srv.Update(request, ct)),
            builder.MapPost<CommentFilter>("api/comments/list").To((service, commentFilter, ct) => service.Query(commentFilter, ct))
        });
    }

    /// <inheritdoc />
    public override string ModuleIdentity => "CommentsEndpointModule";
}