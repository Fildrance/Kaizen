using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Service.DAL.Grade;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.Grade;

public class GradeUpdateRequestHandler : IRequestHandler<GradeUpdateRequest, GradeItem>
{
    private readonly IGradeRepository _repository;
    private readonly IMapper _mapper;

    public GradeUpdateRequestHandler(IGradeRepository repository, IMapper mapper)
    {
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
    }

    /// <inheritdoc />
    public async Task<GradeItem> Handle(GradeUpdateRequest request, CancellationToken cancellationToken)
    {
        var toUpdate = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        var mapped = _mapper.Map(request, toUpdate);
        await _repository.Update(mapped, cancellationToken);
        return _mapper.Map<GradeItem>(mapped);
    }
}