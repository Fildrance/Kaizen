﻿using System.Collections.Generic;
using Enterprise.ApplicationBootstrap.WebApi.Modules;
using Enterprise.ApplicationBootstrap.WebApi.Modules.Endpoints;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.Services;
using Keycloak.AuthServices.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;

namespace Kaizen.Skills.Service;

internal class SkillEndpointConfigurationModule : EndpointRouteConfigureAwareModuleBase
{
    /// <inheritdoc />
    public override IEnumerable<IEndpointRouteBuilderAggregator> GetEndpointRouteBuilders(IEndpointRouteBuilder endpoint)
        => new[]
        {
            CreateAggregator<ISkillService>(builder => new[]
            {
                builder.MapPost<SkillChangeActiveRequest>("api/skills/change-active").To((service, request, ct) => service.ChangeActive(request, ct)),
                builder.MapPost<SkillUpdateRequest>("api/skills").To((service, request, ct) => service.Update(request, ct)),
                builder.MapPut<SkillCreateRequest>("api/skills").To((service, request, ct) => service.Create(request, ct)),
            }).Override((x, _) => x.WithTags("Skills")),
            CreateAggregator<ISkillService>(builder => new[]
            {
                builder.MapPut<SkillLevelCreateRequest>("api/skill-levels").To((service, request, ct) => service.Create(request, ct)),
                builder.MapPost<SkillLevelUpdateRequest>("api/skill-levels").To((service, request, ct) => service.Update(request, ct)),
                builder.MapPost<SkillLevelChangeActiveRequest>("api/skill-levels/change-active").To((service, request, ct) => service.ChangeActive(request, ct)),
            }).Override((x, _) => x.WithTags("SkillLevels")),
            CreateAggregator<ISkillService>(builder => new[]
                {
                    builder.MapPut<SkillCategoryCreateRequest>("api/skill-categories").To((service, request, ct) => service.Create(request, ct)),
                    builder.MapPost<SkillCategoryUpdateRequest>("api/skill-categories").To((service, request, ct) => service.Update(request, ct)),
                    builder.MapPost<SkillCategoryChangeActiveRequest>("api/skill-categories/change-active")
                           .To((service, request, ct) => service.ChangeActive(request, ct)),
                    builder.MapPost<SkillTreeFilter>("api/skill/query").To((service, request, ct) => service.Query(request, ct))
                           .RequireAuthorization(x => x.RequireProtectedResource("skill-tree", "list"))
                }
            ).Override((x, _) => x.WithTags("SkillCategories"))
        };

    /// <inheritdoc />
    public override string ModuleIdentity => "SkillEndpointModule";
}