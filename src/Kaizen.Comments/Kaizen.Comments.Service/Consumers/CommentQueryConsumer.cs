using AutoMapper;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Service.DAL;
using Kaizen.Common.Service;
using MassTransit;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Kaizen.Comments.Service.Consumers
{
	public class CommentQueryConsumer : QueryRespoundingConsumerBase<CommentFilter, CommentItem>
	{
		private readonly IMongoRepository<CommentEntity> _repository;
		private readonly IMapper _mapper;

		public CommentQueryConsumer(IMongoRepository<CommentEntity> repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected override async Task<Page<CommentItem>> DoExecute(CommentFilter message, ConsumeContext<CommentFilter> context)
		{
			var queryResult = await _repository.Query(x => x.SubjectKey == message.SubjectKey && x.SubjectType == message.SubjectType);
			var mapped = queryResult.Select(_mapper.Map<CommentItem>)
				.ToArray();
			return Page(mapped, queryResult.Count);
		}
	}
}
