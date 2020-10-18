using Microsoft.EntityFrameworkCore;

namespace Kaizen.Common.DAL.Configuration
{
	/// <summary> Interface that will help to apply all ef model configuration without interacting with one certain db-context. </summary>
	public interface IContextConfiguration
	{
		void Apply(ModelBuilder modelBuilder);
	}
}