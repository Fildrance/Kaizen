using AutoMapper;
using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Update;
using Kaizen.Comments.Service.DAL;

namespace Kaizen.Comments.Service.Mapping
{
	public class CommentsMappingProfile : Profile
	{
		public CommentsMappingProfile()
		{
			CreateMap<CommentCreateContract, CommentEntity>();
			CreateMap<CommentUpdateContract, CommentEntity>();
			CreateMap<CommentEntity, CommentItem>();
		}
	}
}
