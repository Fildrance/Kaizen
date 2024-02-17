using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Kaizen.Comments.Service.DAL.Mongo;

/// <summary> Generic repository for mongo-db management of certain collection (based on c# class).</summary>
public interface IMongoRepository<TDocument> where TDocument : DocumentBase
{
    Task<IReadOnlyCollection<TDocument>> Query(Expression<Func<TDocument, bool>> filterExpression);

    Task<TDocument> FindOneAsync(Expression<Func<TDocument, bool>> filterExpression);

    Task<TDocument> FindByIdAsync(Guid id);

    Task InsertOneAsync(TDocument document);

    Task ReplaceOneAsync(TDocument document);

    Task DeleteOneAsync(Expression<Func<TDocument, bool>> filterExpression);

    Task DeleteByIdAsync(Guid id);
}