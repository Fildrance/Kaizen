using AutoMapper;
using Kaizen.Common.Service;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using NLog;
using System;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.Consumers
{
	public class SkillCategoryUpdateConsumer : RespoundingConsumerBase<SkillCategoryUpdateContract, SkillCategoryItem>
	{
		private readonly static ILogger Logger = LogManager.GetLogger(typeof(SkillCategoryUpdateConsumer).FullName);

		private readonly ISkillRepository _repository;
		private readonly IMapper _mapper;

		public SkillCategoryUpdateConsumer(ISkillRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected async override Task<SkillCategoryItem> DoExecute(SkillCategoryUpdateContract message, ConsumeContext<SkillCategoryUpdateContract> context)
		{
			var toUpdate = await _repository.DiscoverAsync(message.ToUpdate);
			var mapped = _mapper.Map(context.Message, toUpdate);
			await _repository.Update(mapped);
			return _mapper.Map<SkillCategoryItem>(mapped);
		}
	}
}
