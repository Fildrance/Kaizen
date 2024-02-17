using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.SkillLevel;

public class SkillLevelChangeActiveRequestHandler(ISkillLevelRepository repository, IMapper mapper) : IRequestHandler<SkillLevelChangeActiveRequest, SkillLevelItem>
{
    private readonly ISkillLevelRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillLevelItem> Handle(SkillLevelChangeActiveRequest request, CancellationToken cancellationToken)
    {
        var found = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        found.IsActive = request.IsActive.Value;
        await _repository.Update(found, cancellationToken);
        return _mapper.Map<SkillLevelItem>(found);
    }
}