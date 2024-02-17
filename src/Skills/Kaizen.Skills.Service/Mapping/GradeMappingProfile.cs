using AutoMapper;
using Kaizen.Skills.Api.Grade;
using Kaizen.Skills.Api.Way;
using Kaizen.Skills.Service.DAL.Entities;

namespace Kaizen.Skills.Service.Mapping;

/// <summary> Mapping profile for grade-related items and entities. </summary>
public class GradeMappingProfile : Profile
{
    /// <inheritdoc />
    public GradeMappingProfile()
    {
        CreateMap<GradeEntity, GradeItem>()
            .ReverseMap()
            .ForMember(x => x.Id, opts => opts.Ignore());

        CreateMap<GradeCreateRequest, GradeEntity>()
            .ForMember(x => x.Requirements, opts => opts.Ignore())
            .ForMember(x => x.InWays, opts => opts.Ignore())
            .ForMember(x => x.IsActive, opts => opts.Ignore());

        CreateMap<GradeUpdateRequest, GradeEntity>()
            .ForMember(x => x.Requirements, opts => opts.Ignore())
            .ForMember(x => x.InWays, opts => opts.Ignore())
            .ForMember(x => x.IsActive, opts => opts.MapFrom((src, dest) =>
                {
                    if (!src.IsActive.HasValue)
                    {
                        return dest.IsActive;
                    }

                    return src.IsActive.Value;
                })
            );

        CreateMap<WayEntity, WayItem>()
            .ReverseMap()
            .ForMember(x => x.Id, opts => opts.Ignore());

        CreateMap<WayCreateRequest, WayEntity>()
            .ForMember(x => x.Grades, opts => opts.Ignore())
            .ForMember(x => x.IsActive, opts => opts.Ignore());

        CreateMap<WayUpdateRequest, WayEntity>()
            .ForMember(x => x.Grades, opts => opts.Ignore())
            .ForMember(x => x.IsActive, opts => opts.MapFrom((src, dest) =>
                {
                    if (!src.IsActive.HasValue)
                    {
                        return dest.IsActive;
                    }

                    return src.IsActive.Value;
                })
            );

        CreateMap<GradeRequirementEntity, GradeRequirementItem>()
            .ForMember(x => x.SkillLevelName, opts => opts.MapFrom(src => src.SkillLevel.Name))
            .ForMember(x => x.SkillLevelId, opts => opts.MapFrom(src => src.SkillLevel.Id));
    }
}