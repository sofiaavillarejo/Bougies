using Microsoft.AspNetCore.Mvc;

namespace Bougies.Controllers
{
    public class CarritoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
