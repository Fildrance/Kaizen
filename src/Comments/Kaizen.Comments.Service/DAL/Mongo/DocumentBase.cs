using System;
using MongoDB.Bson.Serialization.Attributes;

namespace Kaizen.Comments.Service.DAL.Mongo;

public abstract class DocumentBase
{
    [BsonId]
    public Guid Id { get; set; }

    public DateTime On { get; set; }
}