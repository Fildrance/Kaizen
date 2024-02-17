using JetBrains.Annotations;
using Kaizen.Common.DAL.Configuration;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;

namespace Kaizen.Common.DAL.Repository;

/// <summary> Custom db-context that can be used in reusable way. Consumes all configurations that DI Container will pass.</summary>
public class CustomDbContext : DbContext
{
    private IEnumerable<IContextConfiguration> _configrations;

    public CustomDbContext([NotNull] DbContextOptions options, [NotNull] IEnumerable<IContextConfiguration> configrations) : base(options)
    {
        _configrations = configrations ?? throw new ArgumentNullException(nameof(configrations));
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        foreach (var config in _configrations)
        {
            config.Apply(modelBuilder);
        }
    }
}