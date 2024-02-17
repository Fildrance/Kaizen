using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Service.DAL.Entities;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Kaizen.Skills.Service.RequestHandling.Skill;

public class SkillCreateRequestHandler : IRequestHandler<SkillCreateRequest, SkillItem>
{
    private readonly ISkillRepository _repository;
    private readonly ISkillCategoryRepository _skillCategoryRepository;
    private readonly IMapper _mapper;
    private readonly ILogger<SkillCreateRequestHandler> _logger;

    public SkillCreateRequestHandler(ISkillRepository repository, ISkillCategoryRepository skillCategoryRepository, IMapper mapper, ILogger<SkillCreateRequestHandler> logger)
    {
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        _skillCategoryRepository = skillCategoryRepository ?? throw new ArgumentNullException(nameof(skillCategoryRepository));
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        _logger = logger;
    }

    /// <inheritdoc />
    public async Task<SkillItem> Handle(SkillCreateRequest request, CancellationToken cancellationToken)
    {
        var parent = await _skillCategoryRepository.DiscoverAsync(request.Parent, cancellationToken);
        _logger.LogTrace($"Received contract to create SkillCategory, name is {request.Name}.");
        var mapped = _mapper.Map<SkillEntity>(request);
        mapped.IsActive = true;
        mapped.Category = parent;
        await _repository.Add(mapped, cancellationToken);
        _logger.LogTrace($"Created record for SkillCategory, id = {mapped.Id}.");
        return _mapper.Map<SkillItem>(mapped);
    }
}