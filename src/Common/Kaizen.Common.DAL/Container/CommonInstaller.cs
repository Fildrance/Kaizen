using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using AutoMapper;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.Resolvers.SpecializedResolvers;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Kaizen.Common.DAL.Configuration;
using Kaizen.Common.DAL.Discover.EntityExtractor;
using Kaizen.Common.DAL.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using IRegistration = Castle.MicroKernel.Registration.IRegistration;

namespace Kaizen.Common.DAL.Container;

// todo: change to composite pattern and collect installation parts.
/// <summary> Common installer for service assembly. Can help with using postgres db, scans and creating automapper, scan of mass-transit consumers and creating bus. </summary>
public class CommonInstaller : IWindsorInstaller
{
    public bool UsingRelationalDatabase { get; set; }
    public string ConnectionString { get; set; }
    public bool UsingMapper { get; set; }
    public Assembly RootAssembly { get; }
    public bool UsingFluentMigrator { get; set; }

    public CommonInstaller(Assembly rootAssembly)
    {
        RootAssembly = rootAssembly ?? throw new ArgumentNullException($"Cannot install '{this.GetType().FullName}' - no value of {nameof(RootAssembly)}."); ;
    }

    public void Install(IWindsorContainer container, IConfigurationStore store)
    {
        container.Kernel.Resolver.AddSubResolver(new CollectionResolver(container.Kernel, true));

        var registrations = GenerateRegistrations(container);
        container.Register(registrations.ToArray());

        InstallMore(container, store);
    }

    protected virtual void InstallMore(IWindsorContainer container, IConfigurationStore store)
    {

    }

    private IEnumerable<IRegistration> GenerateRegistrations(IWindsorContainer container)
    {
        var scanThisAssembly = Classes.FromAssemblyInThisApplication(RootAssembly);

        if (UsingRelationalDatabase)
        {
            if (string.IsNullOrWhiteSpace(ConnectionString))
            {
                var message = $"Cannot initiate ef working with db, no connection string passed. Property {nameof(UsingRelationalDatabase)} should be used only with property {nameof(ConnectionString)} filled correctly.";
                throw new InvalidOperationException(message);
            }
            var builder = new DbContextOptionsBuilder();

            builder.UseNpgsql(ConnectionString);

            yield return Component.For<DbContext>().ImplementedBy<CustomDbContext>();
            yield return Component.For<DbContextOptions>().Instance(builder.Options);
            yield return Component.For(typeof(IFilterAdapter<,>)).ImplementedBy(typeof(GenericFilterAdapter<,>));
            yield return scanThisAssembly.BasedOn(typeof(IFilterAdapterConcrete<,>)).WithServiceAllInterfaces();
            yield return scanThisAssembly.BasedOn(typeof(IAdditionalExtractConfiguration<,>)).WithService.DefaultInterfaces();
            yield return scanThisAssembly.BasedOn<IContextConfiguration>().WithService.FromInterface();

            if (UsingFluentMigrator)
            {
                container.Kernel.Register(
                    Component.For<DbConnectionData>().Instance(new DbConnectionData { ConnectionString = ConnectionString })
                );
            }
        }
        if (UsingMapper)
        {
            yield return scanThisAssembly.BasedOn<Profile>().WithService.Base();
            yield return Component.For<IMapper>()
                                  .UsingFactoryMethod(context =>
                                      new MapperConfiguration(map => map.AddProfiles(context.ResolveAll<Profile>())).CreateMapper()
                                  ).LifestyleSingleton();
        }

    }
}