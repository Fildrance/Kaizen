using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillLevel;

public class SkillLevelUpdateRequestHandler(ISkillLevelRepository repository, IMapper mapper) : IRequestHandler<SkillLevelUpdateRequest, SkillLevelItem>
{
    private readonly ISkillLevelRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillLevelItem> Handle(SkillLevelUpdateRequest request, CancellationToken cancellationToken)
    {
        var toUpdate = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        var mapped = _mapper.Map(request, toUpdate);
        await _repository.Update(mapped, cancellationToken);
        return _mapper.Map<SkillLevelItem>(mapped);
    }
}