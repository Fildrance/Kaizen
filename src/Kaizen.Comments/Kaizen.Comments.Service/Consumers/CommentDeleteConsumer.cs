using Kaizen.ApiGateway.Controllers;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Service.DAL;
using Kaizen.Common.Service;
using MassTransit;
using System;
using System.Threading.Tasks;

namespace Kaizen.Comments.Service.Consumers
{
	public class CommentDeleteConsumer : RespoundingConsumerBase<CommentDeleteContract, EmptyResponse>
	{
		private readonly IMongoRepository<CommentEntity> _repository;

		public CommentDeleteConsumer(IMongoRepository<CommentEntity> repository)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
		}

		protected override async Task<EmptyResponse> DoExecute(CommentDeleteContract message, ConsumeContext<CommentDeleteContract> context)
		{
			await _repository.DeleteByIdAsync(message.ToDelete.Id.Value);
			return new EmptyResponse();
		}
	}
}
