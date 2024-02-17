using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Service.DAL.Grade;
using MediatR;

namespace Kaizen.Skills.Service.RequestHandling.Grade;

public class GradeChangeActiveRequestHandler(IGradeRepository repository, IMapper mapper) : IRequestHandler<GradeChangeActiveRequest, GradeItem>
{
    private readonly IGradeRepository _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    private readonly IMapper _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

    /// <inheritdoc />
    public async Task<GradeItem> Handle(GradeChangeActiveRequest request, CancellationToken cancellationToken)
    {
        var found = await _repository.DiscoverAsync(request.ToUpdate, cancellationToken);
        found.IsActive = request.IsActive.Value;
        await _repository.Update(found, cancellationToken);
        return _mapper.Map<GradeItem>(found);
    }
}