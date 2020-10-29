using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using FluentValidation;
using Kaizen.Comments.Api.Services;

namespace Kaizen.Comments.Api.WindsorInstaller
{
	public class CommentsApiInstaller : IWindsorInstaller
	{
		public void Install(IWindsorContainer container, IConfigurationStore store)
		{
			container.Register(
				Classes.FromAssembly(GetType().Assembly).BasedOn<IValidator>().WithServiceAllInterfaces(),
				Component.For<ICommentsService>().ImplementedBy<CommentsService>()
			);
		}
	}
}
