using System;

namespace Kaizen.Comments.Api.Items;

public class CommentItem
{
    public Guid Id { get; set; }
    public string SubjectType { get; set; }
    public string SubjectKey { get; set; }

    public string CommentText { get; set; }

    public DateTime On { get; set; }
}