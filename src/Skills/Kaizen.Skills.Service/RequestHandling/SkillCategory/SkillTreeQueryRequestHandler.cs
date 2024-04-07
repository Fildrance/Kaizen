using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Enterprise.ApplicationBootstrap.Core.Api;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillTree;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillCategory;

/// <summary> Handler for <see cref="SkillTreeFilter"/>. </summary>
public class SkillTreeQueryRequestHandler(ISkillCategoryRepository repository) : IRequestHandler<SkillTreeFilter, SkillTreeItem[]>
{
    private readonly ISkillCategoryRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));

    /// <inheritdoc />
    public async Task<SkillTreeItem[]> Handle(SkillTreeFilter request, CancellationToken cancellationToken)
    {
        var treeModels = await _repository.QueryTree(request, Session.Current, cancellationToken);
        var byNodeType = treeModels.GroupBy(x => x.NodeType)
                                   .ToDictionary(x => x.Key, x => x);
        var categories = byNodeType[SkillAggregationLevel.SkillCategory];
        var skillsByCategoryId = byNodeType[SkillAggregationLevel.Skill].GroupBy(x => x.ParentId)
                                                                        .ToDictionary(x => x.Key, x => x);
        var skillLevelsBySkillId = byNodeType[SkillAggregationLevel.SkillLevel].GroupBy(x => x.ParentId)
                                                                               .ToDictionary(x => x.Key, x => x);
        var results = categories.Select(x => new SkillTreeItem
        {
            Name = x.Name,
            IsActive = x.IsActive,
            Id = x.Id,
            NodeType = SkillAggregationLevel.SkillCategory,
            Items = skillsByCategoryId.TryGetValue(x.Id, out var found)
                ? found.Select(s => new SkillTreeItem
                {
                    Id = s.Id,
                    Name = s.Name,
                    IsActive = s.IsActive,
                    NodeType = SkillAggregationLevel.Skill,
                    Items = skillLevelsBySkillId.TryGetValue(s.Id, out var foundForSkill)
                        ? foundForSkill.Select(sl => new SkillTreeItem
                            {
                                Name = sl.Name,
                                NodeType = SkillAggregationLevel.SkillLevel,
                                IsActive = sl.IsActive,
                                Id = sl.Id,
                            }
                        ).OrderBy(sl => sl.Name).ToArray()
                        : null
                }).OrderBy(s => s.Name).ToArray()
                : null
        }).OrderBy(c => c.Name).ToArray();
        return results;
    }
}