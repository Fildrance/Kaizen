using AutoMapper;
using Kaizen.ApiGateway.Controllers;
using Kaizen.Common.Service;
using Kaizen.Skill.Api.Filter;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.Consumers
{
	public class SkillCategoryQueryConsumer : QueryRespoundingConsumerBase<SkillCategoryFilterContract, SkillCategoryItem>
	{
		private readonly ISkillRepository _repository;
		private readonly IMapper _mapper;

		public SkillCategoryQueryConsumer(ISkillRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected override async Task<Page<SkillCategoryItem>> DoExecute(SkillCategoryFilterContract message, ConsumeContext<SkillCategoryFilterContract> context)
		{
			var queryResult = await _repository.QueryAsync(message);
			var mapped = queryResult.Items.Select(_mapper.Map<SkillCategoryItem>).ToArray();
			return Page(mapped, queryResult.TotalCount);
		}
	}
}
