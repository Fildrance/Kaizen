namespace Kaizen.Skills.Service.DAL.Entities;

public class GradeInWayEntity
{
    public GradeEntity Grade { get; set; }
    public WayEntity Way { get; set; }

    public int GradeId { get; set; }
    public int WayId { get; set; }

    public int OrderInWay { get; set; }
}