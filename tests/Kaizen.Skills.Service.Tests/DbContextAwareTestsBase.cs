using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Data.Common;
using System.Diagnostics.CodeAnalysis;
using System;
using System.Data;
using Enterprise.ApplicationBootstrap.Core;
using Enterprise.ApplicationBootstrap.Core.Api;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Modules;
using Microsoft.Extensions.Hosting.Internal;
using Microsoft.Extensions.Logging.Abstractions;
using Xunit.Abstractions;
using Microsoft.Extensions.DependencyInjection;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Repository;
using Microsoft.Extensions.Logging;

namespace Kaizen.Skills.Service.Tests;

[ExcludeFromCodeCoverage]
public abstract class DbContextAwareTestsBase : IDisposable
{
    private readonly IDbContextTransaction _transaction;
    private readonly DbConnection _connection;

    protected readonly IDbContextManager _manager;
    protected readonly Session _session;

    protected readonly ITestOutputHelper _console;

    protected DbContextAwareTestsBase(ITestOutputHelper console)
    {
        _console = console;

        IConfiguration configuration = new ConfigurationManager()
                                       .AddJsonFile("appsettings.json")
                                       .Build();

        var context = new AppInitializationContext(ApplicationName.BuildApplicationName(GetType()), new HostingEnvironment(), configuration, NullLogger.Instance);
        var services = new ServiceCollection();
        services.AddSingleton<ILoggerProvider>(new XUnitLoggerProvider(console));
        services.AddSingleton(configuration);
        var module = GetModule(context);
        module.Configure(services, configuration);
        var sp = services.BuildServiceProvider();
        module.Configure(sp);
        _manager = sp.GetRequiredService<IDbContextManager>();

        Session.StubSession.UseThis();
        _session = Session.Current;

        var contextForConnectionInitialization = _manager.GetContext(_session);

        _connection = contextForConnectionInitialization.Database.GetDbConnection();
        _transaction = contextForConnectionInitialization.Database.BeginTransaction(IsolationLevel.Snapshot);

        _session.Set(DbContextManager.EntityFrameworkDefaultConnectionSessionName, _connection);
        _session.Set(DbContextManager.EntityFrameworkDefaultTransactionSessionName, _transaction);

        _console.WriteLine("base setup finished, creating dbContext.");

        _ = _manager.GetContext(_session, true);
    }

    protected abstract DataAccessLayerModuleBase GetModule(AppInitializationContext context);

    /// <inheritdoc />
    public void Dispose()
    {
        _transaction?.Rollback();
        _session.Dispose();
        _transaction?.Dispose();
        _connection?.Close();
        _connection?.Dispose();
    }
}