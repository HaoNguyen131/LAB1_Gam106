using demo.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LAB1Controller : ControllerBase
    {
      
        public IActionResult Get(){
            Game106Model game106 = new Game106Model
            {
                CourseName = "Back-End Game Progaming",
                CourseCode = "GAM106",
                Name = "Nguyễn Văn A",
                StudentCode = "PS12345",
                Class = "GA19305",
            };
            int status = 1;
            string message = "Get data sucess!";
            var data = new { status, message, game106 };
            return new JsonResult(data);
        }
        
    }
}
