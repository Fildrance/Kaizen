using System;
using System.Runtime.Serialization;

namespace Kaizen.Common.DAL.Discover.EntityExtractor.Exceptions
{
	/// <summary>
	/// Exception that is thrown in case of Entity Extractor not configured properly when called.
	/// </summary>
	public class EntityExtractorNotConfiguredException : Exception
	{
		private const string ErrorMessage = "Cannot discover entity - no Entity Extractor configured. "
											+ "This can be caused by not calling 'DiscoveringRepositoryBase.ConfigureExtractor' before DiscoveringRepositoryBase.Discover call, "
											+ "or by invalid override of DiscoveringRepositoryBase.ConfigureExtractor on derived repository. "
											+ "* Please add DiscoveringRepositoryBase.ConfigureExtractor call upon your repository instance creation - this can be done "
											+ "by DI Container. \r\n"
											+ "* Please check if you overrided DiscoveringRepositoryBase.ConfigureExtractor - if you did, it's implementation have to set "
											+ "DiscoveringRepositoryBase.EntityExtractor property. \r\n\r\n";

		/// <summary>Initializes a new instance of the <see cref="EntityExtractorNotConfiguredException" /> class.</summary>
		public EntityExtractorNotConfiguredException() : base(ErrorMessage)
		{
		}

		/// <summary>Initializes a new instance of the <see cref="EntityExtractorNotConfiguredException" /> class with serialized data.</summary>
		/// <param name="info">The <see cref="T:System.Runtime.Serialization.SerializationInfo" /> that holds the serialized object data about the exception being thrown. </param>
		/// <param name="context">The <see cref="T:System.Runtime.Serialization.StreamingContext" /> that contains contextual information about the source or destination. </param>
		/// <exception cref="T:System.ArgumentNullException">The <paramref name="info" /> parameter is <see langword="null" />. </exception>
		/// <exception cref="T:System.Runtime.Serialization.SerializationException">The class name is <see langword="null" /> or <see cref="P:System.Exception.HResult" /> is zero (0). </exception>
		public EntityExtractorNotConfiguredException(SerializationInfo info, StreamingContext context) : base(info, context)
		{
		}
	}
}