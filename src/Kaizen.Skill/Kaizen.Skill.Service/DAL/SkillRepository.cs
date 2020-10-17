using System;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace Kaizen.Skill.Service.DAL
{
    public class SkillRepository
    {
        public SkillRepository(DbContext context)
        {
            Context = context ?? throw new ArgumentNullException(nameof(context));
            SkillCategories = Context.Set<SkillCategoryEntity>();
        }

        protected DbContext Context { get; }
        protected DbSet<SkillCategoryEntity> SkillCategories { get; }

        public ValueTask<EntityEntry<SkillCategoryEntity>> Add(SkillCategoryEntity entity)
        {
            return SkillCategories.AddAsync(entity);
        }

        public Task Remove(SkillCategoryEntity entity)
        {
            SkillCategories.Remove(entity);
            return Context.SaveChangesAsync();
        }

        public Task Update(SkillCategoryEntity entity)
        {
            Context.Update(entity);
            return Context.SaveChangesAsync();
        }

        public Task<SkillCategoryEntity> GetById(int id)
        {
            return SkillCategories.FirstAsync(x => x.Id == id);
        }
    }
}