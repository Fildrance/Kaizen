﻿using JetBrains.Annotations;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;

namespace Kaizen.Skill.Service.DAL.Configuration
{
	public class CustomDbContext : DbContext
	{
		private IEnumerable<IContextConfiguration> _configrations;

		public CustomDbContext([NotNull] DbContextOptions options, [NotNull] IEnumerable<IContextConfiguration> configrations) : base(options)
		{
			_configrations = configrations ?? throw new ArgumentNullException(nameof(configrations));
		}

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			foreach(var config in _configrations)
			{
				config.Apply(modelBuilder);
			}
		}
	}
}
