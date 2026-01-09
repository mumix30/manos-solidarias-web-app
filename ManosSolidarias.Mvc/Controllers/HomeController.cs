using Microsoft.AspNetCore.Mvc;

namespace ManosSolidarias.Mvc.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
