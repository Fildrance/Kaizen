using System;

namespace Kaizen.Comments.Api.Selector;

public class CommentSelector
{
    public Guid? Id { get; set; }

    public static CommentSelector ById(Guid id)
    {
        return new CommentSelector
        {
            Id = id
        };
    }

}