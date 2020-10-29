using AutoMapper;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Update;
using Kaizen.Comments.Service.DAL;
using Kaizen.Common.Service;
using MassTransit;
using System;
using System.Threading.Tasks;

namespace Kaizen.Comments.Service.Consumers
{
	public class CommentUpdateConsumer : RespoundingConsumerBase<CommentUpdateContract, CommentItem>
	{
		private readonly IMapper _mapper;
		private readonly IMongoRepository<CommentEntity> _reposiory;

		public CommentUpdateConsumer(IMapper mapper, IMongoRepository<CommentEntity> reposiory)
		{
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
			_reposiory = reposiory ?? throw new ArgumentNullException(nameof(reposiory)); ;
		}

		protected override async Task<CommentItem> DoExecute(CommentUpdateContract message, ConsumeContext<CommentUpdateContract> context)
		{
			var found = await _reposiory.FindByIdAsync(message.ToUpdate.Id.Value);
			found.CommentText = message.CommentText;
			await _reposiory.ReplaceOneAsync(found);
			var item = _mapper.Map<CommentItem>(found);
			return item;
		}
	}
}
