using MediatR;

namespace Kaizen.Skills.Api.Grade;

public class GradeSelector : IRequest<GradeItem>
{
    public int? Id { get; set; }

    public static GradeSelector ById(int id)
    {
        return new GradeSelector
        {
            Id = id
        };
    }
}