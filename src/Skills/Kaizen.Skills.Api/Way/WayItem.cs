using System.Collections.Generic;
using Kaizen.Skills.Api.Grade;

namespace Kaizen.Skills.Api.Way;

public class WayItem
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public IList<GradeItem> Grades { get; set; }
}