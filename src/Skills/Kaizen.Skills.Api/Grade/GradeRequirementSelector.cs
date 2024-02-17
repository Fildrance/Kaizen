namespace Kaizen.Skills.Api.Grade;

public class GradeRequirementSelector
{
    public int? Id { get; set; }

    public static GradeRequirementSelector ById(int id)
    {
        return new GradeRequirementSelector
        {
            Id = id
        };
    }
}