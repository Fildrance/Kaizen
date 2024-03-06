using System.Linq;
using AutoMapper;
using Kaizen.Skills.Api.Skill;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillLevel;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.Mapping;

/// <summary> Mapping profile for skill-related items and entities. </summary>
public class SkillMappingProfile : Profile
{
    /// <summary> c-tor. </summary>
    public SkillMappingProfile()
    {
        CreateMap<SkillCategoryCreateRequest, SkillCategoryEntity>()
            .ForMember(x => x.Skils, opts => opts.Ignore());
        CreateMap<SkillCategoryUpdateRequest, SkillCategoryEntity>()
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
        CreateMap<SkillCategoryEntity, SkillCategoryItem>()
            .ForMember(x => x.Items, opts => opts.MapFrom(src => src.Skils));

        CreateMap<SkillCreateRequest, SkillEntity>()
            .ForMember(x => x.Category, opts => opts.Ignore());
        CreateMap<SkillUpdateRequest, SkillEntity>()
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
        CreateMap<SkillEntity, SkillItem>()
            .ForMember(x => x.Items, opts => opts.MapFrom(src => src.SkillLevels));

        CreateMap<SkillLevelCreateRequest, SkillLevelEntity>()
            .ForMember(x => x.Skill, opts => opts.Ignore());
        CreateMap<SkillLevelUpdateRequest, SkillLevelEntity>()
            .ForMember(x => x.Skill, opts => opts.Ignore())
            .ForMember(x => x.IsActive, opts => opts.MapFrom((src, dest) =>
                {
                    if (!src.IsActive.HasValue)
                    {
                        return dest.IsActive;
                    }

                    return src.IsActive.Value;
                })
            );
        CreateMap<SkillLevelEntity, SkillLevelItem>()
            .ForMember(
                x => x.Prerequisites,
                opts => opts.MapFrom(src => src.Prerequisites.Select(x => new SkillLevelPrerequisiteItem
                {
                    ForSkillLevelId = x.SkillLevelId,
                    RequiredSkillId = x.RequiredSkillLevelId
                }))
            );
    }
}