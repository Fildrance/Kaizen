using System;
using System.Runtime.Serialization;

using JetBrains.Annotations;

namespace Kaizen.Common.DAL.Discover.EntityExtractor.Exceptions
{
	/// <summary>
	/// Exception that occures due to all discover rules for selector cannot accept presented selector.
	/// </summary>
	public class CannotFindEntityDiscoverRuleException : Exception
	{
		/// <summary>Initializes a new instance of the <see cref="CannotFindEntityDiscoverRuleException" /> class.</summary>
		public CannotFindEntityDiscoverRuleException(object selector) : base("Failed to find object. No discover rule is matching for such definition.")
		{
			Selector = selector;
		}

		/// <summary>
		/// Selector that caused exception.
		/// </summary>
		[PublicAPI]
		public object Selector { get; }

		/// <summary>Initializes a new instance of the <see cref="CannotFindEntityDiscoverRuleException" /> class with serialized data.</summary>
		/// <param name="info">The <see cref="T:System.Runtime.Serialization.SerializationInfo" /> that holds the serialized object data about the exception being thrown. </param>
		/// <param name="context">The <see cref="T:System.Runtime.Serialization.StreamingContext" /> that contains contextual information about the source or destination. </param>
		/// <exception cref="T:System.ArgumentNullException">The <paramref name="info" /> parameter is <see langword="null" />. </exception>
		/// <exception cref="T:System.Runtime.Serialization.SerializationException">The class name is <see langword="null" /> or <see cref="P:System.Exception.HResult" /> is zero (0). </exception>
		public CannotFindEntityDiscoverRuleException(SerializationInfo info, StreamingContext context) : base(info, context)
		{
		}
	}
}