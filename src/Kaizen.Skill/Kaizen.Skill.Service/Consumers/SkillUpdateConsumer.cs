using AutoMapper;
using Kaizen.Common.Service;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Api.Update;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using NLog;
using System;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.Consumers
{
	public class SkillUpdateConsumer : RespoundingConsumerBase<SkillUpdateContract, SkillItem>
	{
		private readonly static ILogger Logger = LogManager.GetLogger(typeof(SkillUpdateConsumer).FullName);

		private readonly ISkillRepository _repository;
		private readonly IMapper _mapper;

		public SkillUpdateConsumer(ISkillRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected async override Task<SkillItem> DoExecute(SkillUpdateContract message, ConsumeContext<SkillUpdateContract> context)
		{
			var toUpdate = await _repository.DiscoverAsync(message.ToUpdate);
			var mapped = _mapper.Map(context.Message, toUpdate);
			await _repository.Update(mapped);
			return _mapper.Map<SkillItem>(mapped);
		}
	}
}
