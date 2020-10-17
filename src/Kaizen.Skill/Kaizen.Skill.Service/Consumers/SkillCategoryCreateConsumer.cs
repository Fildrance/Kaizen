using AutoMapper;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Service.DAL;
using MassTransit;
using NLog;
using System;
using System.Threading.Tasks;

namespace Kaizen.Skill.Service.Consumers
{
	public class SkillCategoryCreateConsumer : IConsumer<SkillCategoryCreateContract>
	{
		private SkillRepository _repository;
		private IMapper _mapper;

		public SkillCategoryCreateConsumer(SkillRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		public async Task Consume(ConsumeContext<SkillCategoryCreateContract> context)
		{

			var mapped = _mapper.Map<SkillCategoryEntity>(context.Message);
			await _repository.Add(mapped);

			await Task.CompletedTask;
		}
	}
}
