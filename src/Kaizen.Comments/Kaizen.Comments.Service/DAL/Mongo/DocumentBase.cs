using MongoDB.Bson.Serialization.Attributes;
using System;

namespace Kaizen.Comments.Service.DAL
{
	public abstract class DocumentBase
	{
		[BsonId]
		public Guid Id { get; set; }

		public DateTime On { get; set; }
	}
}
