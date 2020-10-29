using AutoMapper;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Service.DAL;
using Kaizen.Common.Service;
using MassTransit;
using System;
using System.Threading.Tasks;

namespace Kaizen.Comments.Service.Consumers
{
	public class CommentCreateConsumer : RespoundingConsumerBase<CommentCreateContract, CommentItem>
	{
		private readonly IMapper _mapper;
		private readonly IMongoRepository<CommentEntity> _reposiory;

		public CommentCreateConsumer(IMapper mapper, IMongoRepository<CommentEntity> reposiory)
		{
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
			_reposiory = reposiory ?? throw new ArgumentNullException(nameof(reposiory)); ;
		}

		protected override async Task<CommentItem> DoExecute(CommentCreateContract message, ConsumeContext<CommentCreateContract> context)
		{
			var entity = _mapper.Map<CommentEntity>(message);
			entity.On = DateTime.Now;
			await _reposiory.InsertOneAsync(entity);
			var item = _mapper.Map<CommentItem>(entity);
			return item;
		}
	}
}
