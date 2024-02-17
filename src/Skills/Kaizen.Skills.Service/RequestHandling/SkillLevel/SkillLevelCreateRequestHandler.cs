using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Entities;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Kaizen.Skills.Service.RequestHandling.SkillLevel;

public class SkillLevelCreateRequestHandler(
        ISkillRepository skillRepository,
        ISkillLevelRepository skillLevelepository,
        IMapper mapper,
        ILogger<SkillLevelCreateRequestHandler> logger
    )
    : IRequestHandler<SkillLevelCreateRequest, SkillLevelItem>
{
    private readonly ISkillRepository _skillRepository = skillRepository ?? throw new ArgumentNullException(nameof(skillRepository));
    private readonly ISkillLevelRepository _skillLevelRepository = skillLevelepository ?? throw new ArgumentNullException(nameof(skillLevelepository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillLevelItem> Handle(SkillLevelCreateRequest request, CancellationToken cancellationToken)
    {
        var parent = await _skillRepository.DiscoverAsync(request.Parent, cancellationToken);
        logger.LogTrace($"Received contract to create SkillCategory, name is {request.Name}.");
        var mapped = _mapper.Map<SkillLevelEntity>(request);
        mapped.IsActive = true;
        mapped.Skill = parent;
        await _skillLevelRepository.Add(mapped, cancellationToken);
        logger.LogTrace($"Created record for SkillCategory, id = {mapped.Id}.");
        return _mapper.Map<SkillLevelItem>(mapped);
    }
}