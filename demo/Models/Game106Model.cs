using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace demo.Models
{
    public class Game106Model
    {
        public string? CourseName { get; set; }
        public string? CourseCode { get; set; }
        public string? Name { get; set; }
        public string? StudentCode { get; set; }
        public string? Class { get; set; }
    }

    public class GameLevel
    {
        [Key]
        public int LevelId { get; set; }
        public string title { get; set; }
        public string? Description { get; set; }

    }
    public class Region
    {

        public int RegionID { get; set; }
        [Required]
        public string Name { get; set; }

    }
    public class Question
    {
        [Key]
        public int QuestionID { get; set; }
        [Required]
        public string ContentQuestion { get; set; }
        [Required]
        public string Answer { get; set; }
        public string Option1 { get; set; }
        public string Option2 { get; set; }
        public string Option3 { get; set; }
        public string Option4 { get; set; }
        [ForeignKey("Level")]
        public int LevelID { get; set; }
    }
    public class LevelResult
    {
        [Key]
        public int QuizResultId { get; set; }

        [ForeignKey("User")]
        public string UserId { get; set; }

        [ForeignKey("Level")]
        public int LevelId { get; set; }

        public int Score { get; set; }

        public DateOnly CompletionDate { get; set; }
    }
}
