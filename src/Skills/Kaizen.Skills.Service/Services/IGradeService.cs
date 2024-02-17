using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Api.Way;

namespace Kaizen.Skills.Service.Services;

/// <summary> Service for manipulating grades and career paths. </summary>
public interface IGradeService
{
    Task<GradeItem> Create(GradeCreateRequest request, CancellationToken ct);
    Task<GradeItem> Update(GradeUpdateRequest request, CancellationToken ct);
    Task<GradeItem> ChangeActive(GradeChangeActiveRequest request, CancellationToken ct);

    Task<WayItem> Create(WayCreateRequest request, CancellationToken ct);
    Task<WayItem> Update(WayUpdateRequest request, CancellationToken ct);
    Task<WayItem> ChangeActive(WayChangeActiveRequest request, CancellationToken ct);

    Task<Page<WayItem>> Query(WayFilter request, CancellationToken ct);
}