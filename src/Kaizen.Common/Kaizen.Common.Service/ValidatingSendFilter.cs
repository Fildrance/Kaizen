using System.Collections.Generic;
using System.Threading.Tasks;
using FluentValidation;
using GreenPipes;
using MassTransit;
using NLog;

namespace Kaizen.Common.Service
{
	/// <summary> Filter that will validate (using fluent validator) all outgoing send requests in mass-transit bus. </summary>
	public class ValidatingSendFilter<T> : IFilter<SendContext<T>> where T : class
	{
		private static readonly ILogger Logger = LogManager.GetLogger(typeof(ValidatingSendFilter<>).FullName);

		private readonly IReadOnlyCollection<IValidator> _validators;

		public ValidatingSendFilter(IReadOnlyCollection<IValidator> validators)
		{
			_validators = validators;
		}

		public void Probe(ProbeContext context) { }

		public async Task Send(SendContext<T> context, IPipe<SendContext<T>> next)
		{
			var validationContext = new ValidationContext<T>(context.Message);

			Logger.Trace($"Searching for validator in {_validators.Count}.");

			foreach (var validator in _validators)
			{
				Logger.Trace($"Found validator {validator}.");
				if (validator.CanValidateInstancesOfType(typeof(T)))
				{
					var result = validator.Validate(validationContext);
					Logger.Trace($"Validation result i {result.IsValid}.");
					if (!result.IsValid)
					{
						throw new ValidationException(result.Errors);
					}
				}
			}

			await next.Send(context);
		}
	}
}