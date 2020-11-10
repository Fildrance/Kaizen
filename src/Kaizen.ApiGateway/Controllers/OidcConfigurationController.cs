using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;

namespace Kaizen.ApiGateway.Controllers
{
	[AllowAnonymous]
	public class OidcConfigurationController : ControllerBase
	{
		private readonly IConfiguration _сonfiguration;

		public OidcConfigurationController(IConfiguration configuration)
		{
			_сonfiguration = configuration ?? throw new ArgumentNullException(nameof(configuration));
		}

		//todo: return data based on setting of client and not static data.
		[HttpGet("api/_configuration")]
		public IActionResult GetClientRequestParameters([FromQuery] string clientId)
		{
			var authority = _сonfiguration.GetValue<string>("TokenAuthority");
			var spaUri = _сonfiguration.GetValue<string>("AppUri");

			var result = new
			{
				authority,
				client_id = "kaizen-spa",
				redirect_uri = $"{spaUri}/auth-callback",
				scope = "openid kaizen-api",
				response_type = "code",
				post_logout_redirect_uri = $"{spaUri}/",
				filterProtocolClaims= true,
				loadUserInfo= false
			};
			return Ok(result);
		}
	}
}
