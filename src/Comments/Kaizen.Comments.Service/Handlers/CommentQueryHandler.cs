using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Enterprise.ApplicationBootstrap.Core.Api.Models;
using Enterprise.ApplicationBootstrap.Core.BaseHandlers;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Service.DAL;
using Kaizen.Comments.Service.DAL.Mongo;

namespace Kaizen.Comments.Service.Handlers;

public class CommentQueryHandler : QueryRespondingRequestHandler<CommentFilter, CommentItem>
{
    private readonly IMongoRepository<CommentEntity> _repository;
    private readonly IMapper _mapper;

    public CommentQueryHandler(IMongoRepository<CommentEntity> repository, IMapper mapper)
    {
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
    }

    /// <inheritdoc />
    public override async Task<Page<CommentItem>> Handle(CommentFilter request, CancellationToken cancellationToken)
    {
        var queryResult = await _repository.Query(x => x.SubjectKey == request.SubjectKey && x.SubjectType == request.SubjectType);
        var mapped = queryResult.Select(_mapper.Map<CommentItem>)
                                .ToArray();
        return Page(mapped, queryResult.Count);
    }
}