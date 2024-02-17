using SkbKontur.TypeScript.ContractGenerator;
using SkbKontur.TypeScript.ContractGenerator.Abstractions;
using System.Linq;

namespace Kaizen.TypeGen
{
	class Program
	{
		static void Main(string[] args)
		{

			var services = apiAssemblies.SelectMany(x => x.GetTypes().Where(x => x.BaseType == typeof(BusBasedService)));

			var publicServiceMethods = services.SelectMany(x => x.GetMethods().Where(m => m.DeclaringType == x && m.IsPublic));

			//service methods have to use only one public parameter - input param. And it should have output parameter - out param.
			var inputParameters = publicServiceMethods.Select(x => x.GetParameters().Single().ParameterType);
			var outputParameters = publicServiceMethods.Select(x => x.ReturnType.GetGenericArguments().Single());

			var customGen = new CustomTypeGenerator()
				.WithTypeLocationRule(x => true, x => DeterminePath(x))
				.WithPropertyResolver(new CamelCasePropertyResolver());

			var typesToGenerate = inputParameters.Concat(outputParameters).Concat(new[] { typeof(Page<>) }).ToArray();
			var rootTypesProvider = new RootTypesProvider(typesToGenerate);

			var generator = new TypeScriptGenerator(TypeScriptGenerationOptions.Default, customGen, rootTypesProvider);
			generator.GenerateFiles("../../src/Kaizen.Ui.Angular/src/app/shared/models");
		}

		private static string DeterminePath(ITypeInfo x)
		{
			var split = x.Namespace.Split(".");
			if (split[0] != nameof(Kaizen) || split.Length > 1 && split[1] == "Common")
			{
				return "shared.models";
			}
			return split.ElementAt(1).ToLower() + ".model";
		}
	}
}
