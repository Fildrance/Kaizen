using AutoMapper;
using Kaizen.Skill.Api.Create;
using Kaizen.Skill.Api.Items;
using Kaizen.Skill.Api.Update;
using Kaizen.Skill.Service.DAL;

namespace Kaizen.Skill.Service.Mapping
{
	public class SkillMappingProfile : Profile
	{
		public SkillMappingProfile()
		{
			CreateMap<SkillCategoryCreateContract, SkillCategoryEntity>()
				.ForMember(x => x.Skils, opts => opts.Ignore());
			CreateMap<SkillCategoryUpdateContract, SkillCategoryEntity>()
				.ForMember(x => x.Skils, opts => opts.Ignore())
				.ForMember(x => x.IsActive, opts => opts.MapFrom((src, dest) =>
				{
					if (!src.IsActive.HasValue)
					{
						return dest.IsActive;
					}
					return src.IsActive.Value;
				})
			);
			CreateMap<SkillCategoryEntity, SkillCategoryItem>();

			CreateMap<SkillCreateContract, SkillEntity>()
				.ForMember(x => x.Category, opts => opts.Ignore());
			CreateMap<SkillUpdateContract, SkillEntity>()
				.ForMember(x => x.Category, opts => opts.Ignore())
				.ForMember(x => x.IsActive, opts => opts.MapFrom((src, dest) =>
				{
					if (!src.IsActive.HasValue)
					{
						return dest.IsActive;
					}
					return src.IsActive.Value;
				})
			);
			CreateMap<SkillEntity, SkillItem>();
		}
	}
}
