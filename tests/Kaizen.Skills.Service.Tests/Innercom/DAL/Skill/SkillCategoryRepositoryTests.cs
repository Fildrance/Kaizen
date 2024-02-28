using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Enterprise.ApplicationBootstrap.Core;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Discover.EntityExtractor;
using Enterprise.ApplicationBootstrap.DataAccessLayer.Modules;
using Kaizen.Skills.Api;
using Kaizen.Skills.Api.SkillCategory;
using Kaizen.Skills.Api.SkillTree;
using Kaizen.Skills.Service.DAL.Entities;
using Kaizen.Skills.Service.DAL.Skill;
using Microsoft.EntityFrameworkCore;
using Xunit;
using Xunit.Abstractions;

namespace Kaizen.Skills.Service.Tests.Innercom.DAL.Skill;

public class SkillCategoryRepositoryTests : DbContextAwareTestsBase
{
    private readonly ISkillCategoryRepository _cut;

    public SkillCategoryRepositoryTests(ITestOutputHelper console) : base(console)
    {
        _cut = new SkillCategoryRepository(_manager, new List<IAdditionalExtractConfiguration<SkillCategorySelector, SkillCategoryEntity>>());
    }

    [Fact]
    public async Task QueryTree_SkillCategoryTakeAndSkip_GetLimited()
    {
        //arrange
        var context = _manager.GetContext(_session);
        await SetupSkillTree(context);
        await context.SaveChangesAsync();

        var skillTreeFilter = new SkillTreeFilter
        {
            IncludeActive = IncludeActiveOption.IncludeOnlyActive
        };

        //act
        var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

        //assert
        Assert.NotNull(treePage);
    }

    //[Fact]
    //public async Task QueryTree_SkillCategoryFindSubstring_FindsCaseInsensitive()
    //{
    //    //arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();

    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.SkillCategory,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive,
    //        SubstringToFind = "aA1"
    //    };

    //    //act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    //assert
    //    Assert.Equal(1, treePage.TotalCount);
    //    Assert.Equal(new[] { "aa1" }, treePage.Items.Select(x => x.Name));
    //}

    //[Fact]
    //public async Task QueryTree_SkillCategoryHasNested_ReturnsHasItemsProperly()
    //{
    //    // Arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();
    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.SkillCategory,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive
    //    };

    //    // Act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    // Assert
    //    Assert.True(treePage.Items.First(x => x.Name == "aa1").HasItems);
    //    Assert.True(treePage.Items.First(x => x.Name == "aa2").HasItems);
    //    Assert.False(treePage.Items.First(x => x.Name == "aa3").HasItems);
    //}

    //[Fact]
    //public async Task QueryTree_SkillTakeAndSkip_GetLimited()
    //{
    //    //arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();

    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.Skill,
    //        Take = 2,
    //        Skip = 1,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive
    //    };

    //    //act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    //assert
    //    Assert.Equal(3, treePage.TotalCount);
    //    Assert.Equal(new[] { "bb12", "bb21" }, treePage.Items.Select(x => x.Name));
    //}

    //[Fact]
    //public async Task QueryTree_SkillFindSubstring_FindsCaseInsensitive()
    //{
    //    //arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();

    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.Skill,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive,
    //        SubstringToFind = "bB2"
    //    };

    //    //act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    //assert
    //    Assert.Equal(02, treePage.TotalCount);
    //    Assert.Equal(new[] { "bb21", "bb22" }, treePage.Items.Select(x => x.Name));
    //}

    //[Fact]
    //public async Task QueryTree_SkillHasNested_ReturnsHasItemsProperly()
    //{
    //    // Arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();

    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.Skill,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive
    //    };

    //    // Act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    // Assert
    //    Assert.Equal(4, treePage.Items.Count);
    //    Assert.True(treePage.Items.First(x => x.Name == "bb11").HasItems);
    //    Assert.True(treePage.Items.First(x => x.Name == "bb12").HasItems);
    //    Assert.True(treePage.Items.First(x => x.Name == "bb21").HasItems);
    //    Assert.False(treePage.Items.First(x => x.Name == "bb22").HasItems);
    //}

    //[Fact]
    //public async Task QueryTree_SkillLevelTakeAndSkip_GetLimited()
    //{
    //    //arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();

    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.SkillLevel,
    //        Take = 2,
    //        Skip = 1,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive
    //    };

    //    //act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    //assert
    //    Assert.Equal(4, treePage.TotalCount);
    //    Assert.Equal(new[] { "cc112", "cc121" }, treePage.Items.Select(x => x.Name));
    //}

    //[Fact]
    //public async Task QueryTree__SkillLevelFindSubstring_FindsCaseInsensitive()
    //{
    //    //arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();

    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.SkillLevel,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive,
    //        SubstringToFind = "cC1"
    //    };

    //    //act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    //assert
    //    Assert.Equal(4, treePage.TotalCount);
    //    Assert.Equal(new[] { "cc111", "cc112", "cc121", "cc122" }, treePage.Items.Select(x => x.Name));
    //}

    //[Fact]
    //public async Task QueryTree__SkillLevelHasNested_ReturnsHasItemsProperly()
    //{
    //    // Arrange
    //    var context = _manager.GetContext(_session);
    //    await SetupSkillTree(context);
    //    await context.SaveChangesAsync();
    //    var skillTreeFilter = new SkillTreeOldFilter
    //    {
    //        AggregationLevel = SkillAggregationLevel.SkillLevel,
    //        IncludeActive = IncludeActiveOption.IncludeOnlyActive
    //    };

    //    // Act
    //    var treePage = await _cut.QueryTree(skillTreeFilter, _session, default);

    //    // Assert
    //    Assert.True(treePage.Items.All(x => !x.HasItems));
    //}

    /// <inheritdoc />
    protected override DataAccessLayerModuleBase GetModule(AppInitializationContext context)
    {
        return new SkillDataAccessLayerModule("SkillsRepository", context, true);
    }

    private static async Task SetupSkillTree(DbContext context)
    {
        var categories = new SkillCategoryEntity[]
        {
            new("aa1", "sd"),
            new("aa2", "sd"),
            new("aa3", "sd"),
        };
        await context.Set<SkillCategoryEntity>()
                     .AddRangeAsync(categories);

        var skills = new SkillEntity[]
        {
            new("bb11", "sd", categories[0]),
            new("bb12", "sd", categories[0]),
            new("bb21", "sd", categories[1]),
            new("bb22", "sd", categories[1])
        };
        await context.Set<SkillEntity>()
                     .AddRangeAsync(skills);
        await context.Set<SkillLevelEntity>()
                     .AddRangeAsync(
                         new("cc111", "sd", skills[0]),
                         new("cc112", "sd", skills[0]),
                         new("cc121", "sd", skills[1]),
                         new("cc122", "sd", skills[1]),
                         new("cc211", "sd", skills[2])
                     );
    }
}