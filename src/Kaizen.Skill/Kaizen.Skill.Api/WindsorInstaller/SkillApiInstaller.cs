using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using FluentValidation;
using Kaizen.Skill.Api.Services;

namespace Kaizen.Skill.Api.WindsorInstaller
{
	public class SkillApiInstaller : IWindsorInstaller
	{
		public void Install(IWindsorContainer container, IConfigurationStore store)
		{
			container.Register(
				Classes.FromAssembly(GetType().Assembly).BasedOn<IValidator>().WithServiceAllInterfaces(),
				Component.For<ISkillService>().ImplementedBy<SkillService>()
			);
		}
	}
}
