﻿using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillCategory;

/// <summary>
/// Handler for finding skill category.
/// </summary>
/// <param name="discoverer">Repository for skill category.</param>
/// <param name="mapper">Automapper.</param>
public class SkillCategoryFindRequestHandler(
    ISkillCategoryRepository discoverer,
    IMapper mapper
) : IRequestHandler<SkillCategorySelector, SkillCategoryItem>
{
    /// <inheritdoc />
    public async Task<SkillCategoryItem> Handle(SkillCategorySelector request, CancellationToken cancellationToken)
    {
        var entity = await discoverer.DiscoverAsync(request, cancellationToken);
        if (entity == null)
        {
            return null;
        }

        return mapper.Map<SkillCategoryItem>(entity);
    }
}