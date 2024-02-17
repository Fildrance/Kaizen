using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.Skill;

public class SkillChangeActiveRequestHandler(ISkillRepository repository, IMapper mapper) : IRequestHandler<SkillChangeActiveRequest, SkillItem>
{
    private readonly ISkillRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillItem> Handle(SkillChangeActiveRequest request, CancellationToken cancellationToken)
    {
        var found = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        found.IsActive = request.IsActive.Value;
        await _repository.Update(found, cancellationToken);
        return _mapper.Map<SkillItem>(found);
    }
}