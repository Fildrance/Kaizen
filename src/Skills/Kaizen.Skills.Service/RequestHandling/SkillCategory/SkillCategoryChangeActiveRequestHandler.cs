using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillCategory;

public class SkillCategoryChangeActiveRequestHandler(ISkillCategoryRepository repository, IMapper mapper) : IRequestHandler<SkillCategoryChangeActiveRequest, SkillCategoryItem>
{
    private readonly ISkillCategoryRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillCategoryItem> Handle(SkillCategoryChangeActiveRequest request, CancellationToken cancellationToken)
    {
        var found = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        found.IsActive = request.IsActive.Value;
        await _repository.Update(found, cancellationToken);
        return _mapper.Map<SkillCategoryItem>(found);
    }
}