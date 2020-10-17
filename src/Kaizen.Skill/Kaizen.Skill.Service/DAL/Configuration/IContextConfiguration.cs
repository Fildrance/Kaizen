using Microsoft.EntityFrameworkCore;

namespace Kaizen.Skill.Service.DAL.Configuration
{
	/// <summary> Interface that will help to apply all ef model configuration without interacting with one certain db-context. </summary>
	public interface IContextConfiguration
	{
		public void Apply(ModelBuilder modelBuilder);
	}
}