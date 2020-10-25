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
	public class SkillCreateConsumer : RespoundingConsumerBase<SkillCreateContract, SkillItem>
	{
		private readonly static ILogger Logger = LogManager.GetLogger(typeof(SkillCreateConsumer).FullName);

		private readonly ISkillRepository _repository;
		private readonly ISkillCategoryRepository _skillCategoryRepository;
		private readonly IMapper _mapper;

		public SkillCreateConsumer(ISkillRepository repository, ISkillCategoryRepository skillCategoryRepository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_skillCategoryRepository = skillCategoryRepository ?? throw new ArgumentNullException(nameof(skillCategoryRepository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected override async Task<SkillItem> DoExecute(SkillCreateContract message, ConsumeContext<SkillCreateContract> context)
		{
			var parent = await _skillCategoryRepository.DiscoverAsync(message.Parent);
			Logger.Trace($"Received contract to create SkillCategory, name is {message.Name}.");
			var mapped = _mapper.Map<SkillEntity>(context.Message);
			mapped.IsActive = true;
			mapped.Category = parent;
			await _repository.Add(mapped);
			Logger.Trace($"Created record for SkillCategory, id = {mapped.Id}.");
			return _mapper.Map<SkillItem>(mapped);
		}
	}
}
