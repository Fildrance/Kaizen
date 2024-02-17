﻿using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.Services;

/// <summary> Default implementation. </summary>
public class SkillService(IMediator mediator) : ISkillService
{
    /// <inheritdoc />
    public Task<SkillCategoryItem> ChangeActive(SkillCategoryChangeActiveRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<SkillItem> ChangeActive(SkillChangeActiveRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<SkillLevelItem> ChangeActive(SkillLevelChangeActiveRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<SkillCategoryItem> Create(SkillCategoryCreateRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<SkillItem> Create(SkillCreateRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<SkillLevelItem> Create(SkillLevelCreateRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<Page<SkillTreeItem>> Query(SkillTreeFilter filter, CancellationToken ct) => mediator.Send(filter, ct);

    /// <inheritdoc />
    public Task<SkillCategoryItem> Update(SkillCategoryUpdateRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<SkillItem> Update(SkillUpdateRequest request, CancellationToken ct) => mediator.Send(request, ct);

    /// <inheritdoc />
    public Task<SkillLevelItem> Update(SkillLevelUpdateRequest request, CancellationToken ct) => mediator.Send(request, ct);
}