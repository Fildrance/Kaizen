using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Service.DAL.Entities;
using Kaizen.Skills.Service.DAL.Grade;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Kaizen.Skills.Service.RequestHandling.Grade;

public class GradeCreateRequestHandler : IRequestHandler<GradeCreateRequest, GradeItem>
{
    private readonly IGradeRepository _repository;
    private readonly IMapper _mapper;
    private readonly ILogger<GradeCreateRequestHandler> _logger;

    public GradeCreateRequestHandler(IGradeRepository repository, IMapper mapper, ILogger<GradeCreateRequestHandler> logger)
    {
        _repository = repository;
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        _logger = logger;
    }

    /// <inheritdoc />
    public async Task<GradeItem> Handle(GradeCreateRequest request, CancellationToken cancellationToken)
    {
        var mapped = _mapper.Map<GradeEntity>(request);
        mapped.IsActive = true;
        await _repository.Add(mapped, cancellationToken);
        _logger.LogTrace($"Created record for SkillCategory, id = {mapped.Id}.");
        return _mapper.Map<GradeItem>(mapped);
    }
}