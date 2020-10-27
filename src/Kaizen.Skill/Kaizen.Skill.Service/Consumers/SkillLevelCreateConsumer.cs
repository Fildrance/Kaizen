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
	public class SkillLevelCreateConsumer : RespoundingConsumerBase<SkillLevelCreateContract, SkillLevelItem>
	{
		private readonly static ILogger Logger = LogManager.GetLogger(typeof(SkillLevelCreateConsumer).FullName);

		private readonly ISkillRepository _skillRepository;
		private readonly ISkillLevelRepository _skillLevelRepository;
		private readonly IMapper _mapper;

		public SkillLevelCreateConsumer(ISkillRepository skillRepository, ISkillLevelRepository skillLevelepository, IMapper mapper)
		{
			_skillRepository = skillRepository ?? throw new ArgumentNullException(nameof(skillRepository));
			_skillLevelRepository = skillLevelepository ?? throw new ArgumentNullException(nameof(skillLevelepository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected override async Task<SkillLevelItem> DoExecute(SkillLevelCreateContract message, ConsumeContext<SkillLevelCreateContract> context)
		{
			var parent = await _skillRepository.DiscoverAsync(message.Parent);
			Logger.Trace($"Received contract to create SkillCategory, name is {message.Name}.");
			var mapped = _mapper.Map<SkillLevelEntity>(context.Message);
			mapped.IsActive = true;
			mapped.Skill = parent;
			await _skillLevelRepository.Add(mapped);
			Logger.Trace($"Created record for SkillCategory, id = {mapped.Id}.");
			return _mapper.Map<SkillLevelItem>(mapped);
		}
	}
}
