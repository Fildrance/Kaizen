using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;

namespace Kaizen.Comments.Service.DAL
{

	public class MongoRepository<TDocument> : IMongoRepository<TDocument> where TDocument : DocumentBase
	{
		private readonly IMongoCollection<TDocument> _collection;

		public MongoRepository(IMongoDatabase database)
		{
			_collection = database.GetCollection<TDocument>(GetCollectionName(typeof(TDocument)));
		}

		private protected string GetCollectionName(Type documentType)
		{
			return documentType.GetCustomAttribute<BsonCollectionAttribute>()
				?.CollectionName;
		}

		public virtual Task<TDocument> FindOneAsync(Expression<Func<TDocument, bool>> filterExpression)
		{
			return _collection.Find(filterExpression).FirstOrDefaultAsync();
		}

		public virtual Task<TDocument> FindByIdAsync(Guid id)
		{
			return _collection.Find(x => x.Id == id).SingleOrDefaultAsync();
		}

		public virtual Task InsertOneAsync(TDocument document)
		{
			return _collection.InsertOneAsync(document);
		}

		public virtual async Task ReplaceOneAsync(TDocument document)
		{
			var filter = Builders<TDocument>.Filter.Eq(doc => doc.Id, document.Id);
			await _collection.FindOneAndReplaceAsync(filter, document);
		}

		public Task DeleteOneAsync(Expression<Func<TDocument, bool>> filterExpression)
		{
			return _collection.FindOneAndDeleteAsync(filterExpression);
		}

		public Task DeleteByIdAsync(Guid id)
		{
			return _collection.FindOneAndDeleteAsync(x => x.Id == id);
		}

		public async Task<IReadOnlyCollection<TDocument>> Query(Expression<Func<TDocument, bool>> filterExpression)
		{
			var found = await _collection.FindAsync(filterExpression);
			return found.ToList();
		}
	}
}
