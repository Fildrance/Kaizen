using System;
using System.Threading;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core.Api;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Enterprise.ApplicationBootstrap.Core.BaseHandlers;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Service.DAL.Skill;

namespace Kaizen.Skills.Service.RequestHandling.SkillCategory;

public class SkillCategoryQueryRequestHandler(ISkillCategoryRepository repository) : QueryRespondingRequestHandler<SkillTreeFilter, SkillTreeItem>
{
    private readonly ISkillCategoryRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));

    /// <inheritdoc />
    public override async Task<Page<SkillTreeItem>> Handle(SkillTreeFilter request, CancellationToken cancellationToken)
    {
        return await _repository.QueryTree(request, Session.Current, cancellationToken);
    }
}