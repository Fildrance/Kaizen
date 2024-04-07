using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Service.DAL.Entities;
using Kaizen.Skills.Service.DAL.Skill;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Kaizen.Skills.Service.RequestHandling.SkillCategory;

/// <summary> Handler for <see cref="SkillCategoryCreateRequest"/>. </summary>
public class SkillCategoryCreateRequestHandler(ISkillCategoryRepository repository, IMapper mapper, ILogger<SkillCategoryCreateRequestHandler> logger)
    : IRequestHandler<SkillCategoryCreateRequest, SkillCategoryItem>
{
    private readonly ISkillCategoryRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<SkillCategoryItem> Handle(SkillCategoryCreateRequest request, CancellationToken cancellationToken)
    {
        logger.LogTrace("Received contract to create SkillCategory, name is {name}.", request.Name);
        var mapped = _mapper.Map<SkillCategoryEntity>(request);
        mapped.IsActive = true;
        await _repository.Add(mapped, cancellationToken);
        logger.LogTrace("Created record for SkillCategory, id = {id}.", mapped.Id);
        return _mapper.Map<SkillCategoryItem>(mapped);
    }
}