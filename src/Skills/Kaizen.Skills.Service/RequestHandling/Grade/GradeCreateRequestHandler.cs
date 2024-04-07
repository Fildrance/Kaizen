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

/// <summary> Handler <see cref="GradeCreateRequest"/>. </summary>
public class GradeCreateRequestHandler(IGradeRepository repository, IMapper mapper, ILogger<GradeCreateRequestHandler> logger)
    : IRequestHandler<GradeCreateRequest, GradeItem>
{
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<GradeItem> Handle(GradeCreateRequest request, CancellationToken cancellationToken)
    {
        var mapped = _mapper.Map<GradeEntity>(request);
        mapped.IsActive = true;
        await repository.Add(mapped, cancellationToken);
        logger.LogTrace($"Created record for SkillCategory, id = {mapped.Id}.");
        return _mapper.Map<GradeItem>(mapped);
    }
}