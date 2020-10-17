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
		static readonly ILogger Logger = LogManager.GetLogger(typeof(SkillCategoryCreateConsumer).FullName);

		private SkillRepository _repository;
		private IMapper _mapper;

		public SkillCategoryCreateConsumer(SkillRepository repository, IMapper mapper)
		{
			_repository = repository ?? throw new ArgumentNullException(nameof(repository));
			_mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		public async Task Consume(ConsumeContext<SkillCategoryCreateContract> context)
		{

			//var mapped = _mapper.Map<SkillCategoryEntity>(context.Message);
			//await _repository.Add(mapped);

			// todo: replace with call to base!

			Logger.Info(context.Message.Name);

			await Task.CompletedTask;
		}
	}
}
