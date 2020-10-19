using FluentValidation;
using MassTransit;
using Microsoft.AspNetCore.Http;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace Kaizen.ApiGateway.Middleware
{
    /// <summary> Middleware that packages business exception into data-package for client. </summary>
	public class ValidationExceptionPackagingMiddleware
    {
        private const string ValidationErrorProblemType = "ValidationError";

        private readonly RequestDelegate _next;

        public ValidationExceptionPackagingMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (RequestException ex)
            {
                if (ex.InnerException is ValidationException vEx)
                {
                    context.Response.StatusCode = 500;
                    var problem = new
                    {
                        Title = vEx.Message,
                        Type = ValidationErrorProblemType,
                        NamedErrors = vEx.Errors.Select(x => new { Property = x.PropertyName, Error = x.ErrorMessage })
                    };

                    var jsonString = JsonSerializer.Serialize(problem);
                    await context.Response.WriteAsync(jsonString);

                }
            }
        }
    }

}
