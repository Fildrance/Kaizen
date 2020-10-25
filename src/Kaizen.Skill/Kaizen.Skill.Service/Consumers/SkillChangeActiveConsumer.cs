using AutoMapper;
using Kaizen.Common.Service;
using Kaizen.Skill.Api.ToggleActive;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using System;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.Consumers
{
	public class SkillChangeActiveConsumer : RespoundingConsumerBase<SkillChangeActiveContract, SkillItem>
	{
		private readonly ISkillRepository _repository;
		private readonly IMapper _mapper;

		public SkillChangeActiveConsumer(ISkillRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected override async Task<SkillItem> DoExecute(SkillChangeActiveContract message, ConsumeContext<SkillChangeActiveContract> context)
		{
			var found = await _repository.DiscoverAsync(message.ToUpdate);
			found.IsActive = message.IsActive.Value;
			await _repository.Update(found);
			return _mapper.Map<SkillItem>(found);
		}
	}
}
