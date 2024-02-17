using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Service.DAL;
using Kaizen.Comments.Service.DAL.Mongo;
using MediatR;

namespace Kaizen.Comments.Service.Handlers;

public class CommentCreateHandler : IRequestHandler<CommentCreateRequest, CommentItem>
{
    private readonly IMapper _mapper;
    private readonly IMongoRepository<CommentEntity> _reposiory;

    public CommentCreateHandler(IMapper mapper, IMongoRepository<CommentEntity> reposiory)
    {
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        _reposiory = reposiory ?? throw new ArgumentNullException(nameof(reposiory));
        ;
    }

    /// <inheritdoc />
    public async Task<CommentItem> Handle(CommentCreateRequest request, CancellationToken cancellationToken)
    {
        var entity = _mapper.Map<CommentEntity>(request);
        entity.On = DateTime.Now;
        await _reposiory.InsertOneAsync(entity);
        var item = _mapper.Map<CommentItem>(entity);
        return item;
    }
}