using Kaizen.Comments.Api.Create;
using Kaizen.Comments.Api.Delete;
using Kaizen.Comments.Api.Filter;
using Kaizen.Comments.Api.Items;
using Kaizen.Comments.Api.Services;
using Kaizen.Comments.Api.Update;
using Kaizen.Common.Service;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace Kaizen.ApiGateway.Controllers
{
	[ApiController]
	public class CommentsController : ControllerBase
	{
		private readonly ICommentsService _service;

		public CommentsController(ICommentsService service)
		{
			_service = service ?? throw new ArgumentNullException(nameof(service));
		}

		[HttpPost]
		[Route("api/comment")]
		public Task<CommentItem> Create(CommentCreateContract contract)
		{
			return _service.Create(contract);
		}

		[HttpGet]
		[Route("api/comment/list")]
		public Task<Page<CommentItem>> List([FromQuery] CommentFilter filter)
		{
			filter = filter ?? new CommentFilter();
			return _service.Query(filter);
		}
		
		[HttpPut]
		[Route("api/comment")]
		public Task<CommentItem> Update(CommentUpdateContract contract)
		{
			return _service.Update(contract);
		}

		[HttpDelete]
		[Route("api/comment")]
		public async Task<IActionResult> Delete([FromQuery] CommentDeleteContract contract)
		{
			_ = await _service.Delete(contract);
			return Ok();
		}
	}
}
