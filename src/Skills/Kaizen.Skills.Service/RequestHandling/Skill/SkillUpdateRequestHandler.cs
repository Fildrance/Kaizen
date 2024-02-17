using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.Skill;

public class SkillUpdateRequestHandler : IRequestHandler<SkillUpdateRequest, SkillItem>
{
    private readonly ISkillRepository _repository;
    private readonly IMapper _mapper;

    public SkillUpdateRequestHandler(ISkillRepository repository, IMapper mapper)
    {
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
    }

    /// <inheritdoc />
    public async Task<SkillItem> Handle(SkillUpdateRequest request, CancellationToken cancellationToken)
    {
        var toUpdate = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        var mapped = _mapper.Map(request, toUpdate);
        await _repository.Update(mapped, cancellationToken);
        return _mapper.Map<SkillItem>(mapped);
    }
}