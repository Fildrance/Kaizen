using Enterprise.ApplicationBootstrap.Core.Api.Models;
using JetBrains.Annotations;
using MediatR;

namespace Kaizen.Skills.Api.SkillCategory;

public class SkillTreeFilter : FilterContractBase, IRequest<Page<SkillTreeItem>>
{
    [CanBeNull] public IncludeActiveOption? IncludeActive { get; set; }

    public SkillAggregationLevel AggregationLevel { get; set; }

    [CanBeNull] public string SubstringToFind { get; set; }

    [CanBeNull] public int? ParentId { get; set; }
}