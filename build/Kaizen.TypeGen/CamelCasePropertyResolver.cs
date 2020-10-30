using SkbKontur.TypeScript.ContractGenerator;
using SkbKontur.TypeScript.ContractGenerator.Abstractions;
using SkbKontur.TypeScript.ContractGenerator.CodeDom;
using System.Collections;
using System.Linq;

namespace Kaizen.TypeGen
{
	public class CamelCasePropertyResolver : IPropertyResolver
	{
		public TypeScriptTypeMemberDeclaration ResolveProperty(TypeScriptUnit unit, ITypeGenerator typeGenerator, ITypeInfo type, IPropertyInfo property)
		{
			TypeScriptType tsType = typeGenerator.BuildAndImportType(unit, property.PropertyType);
			if (property.PropertyType.IsGenericType && property.PropertyType.GetGenericTypeDefinition().GetInterfaces().Any(x => x.Name == nameof(IEnumerable)))
			{
				var elementType = property.PropertyType.GetGenericArguments()[0];
				var itemType = typeGenerator.BuildAndImportType(unit, elementType);
				tsType = new TypeScriptArrayType(itemType);
			}
			else {
				tsType = typeGenerator.BuildAndImportType(unit, property.PropertyType);
			}

			var result = new TypeScriptTypeMemberDeclaration
			{
				Name = property.Name,
				Type = tsType,
				Optional = true
			};
			return result;
		}
	}
}
