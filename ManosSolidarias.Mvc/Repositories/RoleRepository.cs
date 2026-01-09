using ManosSolidarias.Mvc.Data;
using ManosSolidarias.Mvc.Entities;
using Microsoft.EntityFrameworkCore;

namespace ManosSolidarias.Mvc.Repositories;

public class RoleRepository : IRoleRepository
{
    private readonly ManosSolidariasContext _context;

    public RoleRepository(ManosSolidariasContext context)
    {
        _context = context;
    }

    public async Task<IReadOnlyList<Role>> GetAllAsync()
    {
        return await _context.Roles
            .AsNoTracking()
            .OrderBy(role => role.Rol)
            .ToListAsync();
    }

    public async Task<Role?> GetByIdAsync(int id)
    {
        return await _context.Roles
            .AsNoTracking()
            .FirstOrDefaultAsync(role => role.RolId == id);
    }

    public async Task AddAsync(Role role)
    {
        _context.Roles.Add(role);
        await _context.SaveChangesAsync();
    }
}
