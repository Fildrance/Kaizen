using AutoMapper;
using Kaizen.Common;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using NLog;
using System;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.Consumers
{
    public class SkillCategoryCreateConsumer : RespoundingConsumerBase<SkillCategoryCreateContract, SkillCategoryItem>
	{
		private readonly static ILogger Logger = LogManager.GetLogger(typeof(SkillCategoryCreateConsumer).FullName);
		private SkillRepository _repository;
		private IMapper _mapper;

		public SkillCategoryCreateConsumer(SkillRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

        protected override async Task<SkillCategoryItem> DoExecute(SkillCategoryCreateContract message, ConsumeContext<SkillCategoryCreateContract> context)
        {
			Logger.Trace($"Received contract to create SkillCategory, name is {message.Name}.");
            var mapped = _mapper.Map<SkillCategoryEntity>(context.Message);
			await _repository.Add(mapped);
			Logger.Trace($"Created record for SkillCategory, id = {mapped.Id}.");
			return _mapper.Map<SkillCategoryItem>(mapped);
        }
    }
}
