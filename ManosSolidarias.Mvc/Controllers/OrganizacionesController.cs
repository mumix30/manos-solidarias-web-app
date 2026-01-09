using ManosSolidarias.Mvc.Entities;
using ManosSolidarias.Mvc.Services;
using Microsoft.AspNetCore.Mvc;

namespace ManosSolidarias.Mvc.Controllers;

public class OrganizacionesController : Controller
{
    private readonly IOrganizacionService _service;

    public OrganizacionesController(IOrganizacionService service)
    {
        _service = service;
    }

    public async Task<IActionResult> Index()
    {
        var organizaciones = await _service.GetOrganizacionesAsync();
        return View(organizaciones);
    }

    public IActionResult Create()
    {
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(Organizacion organizacion)
    {
        if (!ModelState.IsValid)
        {
            return View(organizacion);
        }

        await _service.AddOrganizacionAsync(organizacion, currentUserId: 1);
        return RedirectToAction(nameof(Index));
    }
}
