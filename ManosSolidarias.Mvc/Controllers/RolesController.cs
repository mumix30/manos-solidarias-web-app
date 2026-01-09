using ManosSolidarias.Mvc.Entities;
using ManosSolidarias.Mvc.Services;
using Microsoft.AspNetCore.Mvc;

namespace ManosSolidarias.Mvc.Controllers;

public class RolesController : Controller
{
    private readonly IRoleService _service;

    public RolesController(IRoleService service)
    {
        _service = service;
    }

    public async Task<IActionResult> Index()
    {
        var roles = await _service.GetRolesAsync();
        return View(roles);
    }

    public IActionResult Create()
    {
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(Role role)
    {
        if (!ModelState.IsValid)
        {
            return View(role);
        }

        await _service.AddRoleAsync(role, currentUserId: 1);
        return RedirectToAction(nameof(Index));
    }
}
