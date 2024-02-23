using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Enterprise.ApplicationBootstrap.Core.Api;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillCategory;

public class SkillTreeQueryRequestHandler(ISkillCategoryRepository repository, IMapper mapper) : IRequestHandler<SkillTreeFilter, SkillCategoryItem[]>
{
    private readonly ISkillCategoryRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillCategoryItem[]> Handle(SkillTreeFilter request, CancellationToken cancellationToken)
    {
        var results = await _repository.QueryTree(request, Session.Current, cancellationToken);
        return results.Items.Select(x => _mapper.Map<SkillCategoryItem>(x)).ToArray();
    }
}