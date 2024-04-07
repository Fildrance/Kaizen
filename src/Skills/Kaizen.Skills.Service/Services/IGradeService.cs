using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Api.Way;

namespace Kaizen.Skills.Service.Services;

/// <summary> Service for manipulating grades and career paths. </summary>
public interface IGradeService
{
    /// <summary> Create grade. </summary>
    Task<GradeItem> Create(GradeCreateRequest request, CancellationToken ct);

    /// <summary> Update grade. </summary>
    Task<GradeItem> Update(GradeUpdateRequest request, CancellationToken ct);

    /// <summary> Toggle enabled/disabled for grade. </summary>
    Task<GradeItem> ChangeActive(GradeChangeActiveRequest request, CancellationToken ct);

    /// <summary> Create professional growth way. </summary>
    Task<WayItem> Create(WayCreateRequest request, CancellationToken ct);

    /// <summary> Update professional growth way. </summary>
    Task<WayItem> Update(WayUpdateRequest request, CancellationToken ct);

    /// <summary> Toggle enabled/disabled for professional growth way. </summary>
    Task<WayItem> ChangeActive(WayChangeActiveRequest request, CancellationToken ct);

    /// <summary> Query way items with. </summary>
    Task<Page<WayItem>> Query(WayFilter request, CancellationToken ct);
}