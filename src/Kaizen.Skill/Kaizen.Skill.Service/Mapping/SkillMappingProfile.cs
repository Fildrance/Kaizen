using AutoMapper;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Service.DAL;

namespace Kaizen.Skill.Service.Mapping
{
	public class SkillMappingProfile : Profile
	{
		public SkillMappingProfile()
		{
			CreateMap<SkillCategoryCreateContract, SkillCategoryEntity>();
		}
	}
}
