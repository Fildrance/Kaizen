using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Api.Way;
using MediatR;

namespace Kaizen.Skills.Service.Services;

/// <summary> Default <see cref="IGradeService"/> implementation. </summary>
public class GradeService(IMediator mediator) : IGradeService
{
    /// <inheritdoc />
    public Task<GradeItem> Create(GradeCreateRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<GradeItem> Update(GradeUpdateRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<GradeItem> ChangeActive(GradeChangeActiveRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<WayItem> Create(WayCreateRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<WayItem> Update(WayUpdateRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<WayItem> ChangeActive(WayChangeActiveRequest request, CancellationToken ct)
        => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<Page<WayItem>> Query(WayFilter request, CancellationToken ct)
        => mediator.Send(request, ct);
}