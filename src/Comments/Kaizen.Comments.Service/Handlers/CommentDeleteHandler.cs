using System;
using System.Threading;
using System.Threading.Tasks;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Service.DAL;
using Kaizen.Comments.Service.DAL.Mongo;
using MediatR;

namespace Kaizen.Comments.Service.Handlers;

public class CommentDeleteHandler : IRequestHandler<CommentDeleteRequest>
{
    private readonly IMongoRepository<CommentEntity> _repository;

    public CommentDeleteHandler(IMongoRepository<CommentEntity> repository)
    {
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    }

    /// <inheritdoc />
    public async Task Handle(CommentDeleteRequest request, CancellationToken cancellationToken)
    {
        await _repository.DeleteByIdAsync(request.ToDelete.Id.Value);
    }
}