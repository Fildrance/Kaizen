using Microsoft.Extensions.Logging;
using System;
using System.Diagnostics.CodeAnalysis;
using System.Text;
using Xunit.Abstractions;

namespace Kaizen.Skills.Service.Tests;

/// <summary>
/// Помощник логгирования юнит тестов.
/// </summary>
[ExcludeFromCodeCoverage]
internal class XUnitLogger(
    ITestOutputHelper testOutputHelper,
    LoggerExternalScopeProvider scopeProvider,
    string categoryName
) : ILogger
{
    public static ILogger CreateLogger(ITestOutputHelper testOutputHelper)
        => new XUnitLogger(testOutputHelper, new LoggerExternalScopeProvider(), "");

    public static ILogger<T> CreateLogger<T>(ITestOutputHelper testOutputHelper)
        => new XUnitLogger<T>(testOutputHelper, new LoggerExternalScopeProvider());

    public bool IsEnabled(LogLevel logLevel)
        => logLevel != LogLevel.None;

    public IDisposable BeginScope<TState>(TState state)
        => scopeProvider.Push(state);

    /// <summary>
    /// Записать лог в тестовый вывод.
    /// </summary>
    public void Log<TState>(LogLevel logLevel, EventId eventId, TState state, Exception exception, Func<TState, Exception, string> formatter)
    {
        var sb = new StringBuilder();
        sb.Append(GetLogLevelString(logLevel))
          .Append(" [").Append(categoryName).Append("] ")
          .Append(formatter(state, exception));

        if (exception != null)
        {
            sb.Append('\n').Append(exception);
        }

        // Append scopes
        scopeProvider.ForEachScope((scope, state) =>
        {
            state.Append("\n => ");
            state.Append(scope);
        }, sb);

        try
        {
            testOutputHelper.WriteLine(sb.ToString());
        }
        catch
        {
            // ignore
        }
    }

    private static string GetLogLevelString(LogLevel logLevel)
    {
        return logLevel switch
        {
            LogLevel.Trace => "trce",
            LogLevel.Debug => "dbug",
            LogLevel.Information => "info",
            LogLevel.Warning => "warn",
            LogLevel.Error => "fail",
            LogLevel.Critical => "crit",
            _ => throw new ArgumentOutOfRangeException(nameof(logLevel))
        };
    }
}

[ExcludeFromCodeCoverage]
internal sealed class XUnitLogger<T> : XUnitLogger, ILogger<T>
{
    public XUnitLogger(ITestOutputHelper testOutputHelper, LoggerExternalScopeProvider scopeProvider)
        : base(testOutputHelper, scopeProvider, typeof(T).FullName)
    {
    }
}

[ExcludeFromCodeCoverage]
internal sealed class XUnitLoggerProvider : ILoggerProvider
{
    private readonly ITestOutputHelper _testOutputHelper;
    private readonly LoggerExternalScopeProvider _scopeProvider = new LoggerExternalScopeProvider();

    public XUnitLoggerProvider(ITestOutputHelper testOutputHelper)
    {
        _testOutputHelper = testOutputHelper;
    }

    public ILogger CreateLogger(string categoryName)
    {
        return new XUnitLogger(_testOutputHelper, _scopeProvider, categoryName);
    }

    public void Dispose()
    {
    }
}