using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Update;
using Kaizen.Comments.Service.DAL;
using Kaizen.Comments.Service.DAL.Mongo;
using MediatR;

namespace Kaizen.Comments.Service.Handlers;

public class CommentUpdateHandler : IRequestHandler<CommentUpdateRequest, CommentItem>
{
    private readonly IMapper _mapper;
    private readonly IMongoRepository<CommentEntity> _repository;

    public CommentUpdateHandler(IMapper mapper, IMongoRepository<CommentEntity> repository)
    {
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    }

    /// <inheritdoc />
    public async Task<CommentItem> Handle(CommentUpdateRequest request, CancellationToken cancellationToken)
    {
        var found = await _repository.FindByIdAsync(request.ToUpdate.Id.Value);
        found.CommentText = request.CommentText;
        await _repository.ReplaceOneAsync(found);
        var item = _mapper.Map<CommentItem>(found);
        return item;
    }
}