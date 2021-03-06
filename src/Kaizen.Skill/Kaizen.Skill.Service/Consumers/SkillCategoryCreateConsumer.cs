﻿using AutoMapper;
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
	public class SkillCategoryCreateConsumer : RespoundingConsumerBase<SkillCategoryCreateContract, SkillCategoryItem>
	{
		private readonly static ILogger Logger = LogManager.GetLogger(typeof(SkillCategoryCreateConsumer).FullName);

		private readonly ISkillCategoryRepository _repository;
		private readonly IMapper _mapper;

		public SkillCategoryCreateConsumer(ISkillCategoryRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

        protected override async Task<SkillCategoryItem> DoExecute(SkillCategoryCreateContract message, ConsumeContext<SkillCategoryCreateContract> context)
        {
			Logger.Trace($"Received contract to create SkillCategory, name is {message.Name}.");
            var mapped = _mapper.Map<SkillCategoryEntity>(context.Message);
			mapped.IsActive = true;
			await _repository.Add(mapped);
			Logger.Trace($"Created record for SkillCategory, id = {mapped.Id}.");
			return _mapper.Map<SkillCategoryItem>(mapped);
        }
    }
}
