using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillCategory;

public class SkillCategoryUpdateRequestHandler(ISkillCategoryRepository repository, IMapper mapper) : IRequestHandler<SkillCategoryUpdateRequest, SkillCategoryItem>
{
    private readonly ISkillCategoryRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillCategoryItem> Handle(SkillCategoryUpdateRequest request, CancellationToken cancellationToken)
    {
        var toUpdate = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        var mapped = _mapper.Map(request, toUpdate);
        await _repository.Update(mapped, cancellationToken);
        return _mapper.Map<SkillCategoryItem>(mapped);
    }
}