using Kaizen.Common.Service;
using MassTransit;
using NLog;

namespace Kaizen.Comments.Service
{
	public class CommentsBackgroundService : MassTransitBusBackgroundServiceBase
	{
		private static readonly ILogger Logger = LogManager.GetLogger(typeof(CommentsBackgroundService).FullName);

		public CommentsBackgroundService(IBusControl bus) : base(bus)
		{
		}

		protected override ILogger СurrentLogger => Logger;

		protected override string ServiceName => "Comments service";
	}
}
