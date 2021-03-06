﻿using AutoMapper;
using Kaizen.Common.Service;
using Kaizen.Skill.Api.ToggleActive;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using System;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.Consumers
{
	public class SkillCategoryChangeActiveConsumer : RespoundingConsumerBase<SkillCategoryChangeActiveContract, SkillCategoryItem>
	{
		private readonly ISkillCategoryRepository _repository;
		private readonly IMapper _mapper;

		public SkillCategoryChangeActiveConsumer(ISkillCategoryRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		protected override async Task<SkillCategoryItem> DoExecute(SkillCategoryChangeActiveContract message, ConsumeContext<SkillCategoryChangeActiveContract> context)
		{
			var found = await _repository.DiscoverAsync(message.ToUpdate);
			found.IsActive = message.IsActive.Value;
			await _repository.Update(found);
			return _mapper.Map<SkillCategoryItem>(found);
		}
	}
}
