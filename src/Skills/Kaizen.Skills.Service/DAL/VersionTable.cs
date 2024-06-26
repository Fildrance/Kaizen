﻿using FluentMigrator.Runner.VersionTableInfo;

namespace Kaizen.Skills.Service.DAL;

/// <summary> Metadata for redirecting FluentMigrator VersionInfo to 'infrastructure' schema.</summary>
[VersionTableMetaData]
public class VersionTable : DefaultVersionTableMetaData
{
    /// <inheritdoc />
    public override string SchemaName => "infrastructure";
}