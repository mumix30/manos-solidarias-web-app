using ManosSolidarias.Mvc.Data;
using ManosSolidarias.Mvc.Entities;
using Microsoft.EntityFrameworkCore;

namespace ManosSolidarias.Mvc.Repositories;

public class OrganizacionRepository : IOrganizacionRepository
{
    private readonly ManosSolidariasContext _context;

    public OrganizacionRepository(ManosSolidariasContext context)
    {
        _context = context;
    }

    public async Task<IReadOnlyList<Organizacion>> GetAllAsync()
    {
        return await _context.Organizaciones
            .AsNoTracking()
            .OrderBy(org => org.Organizacion)
            .ToListAsync();
    }

    public async Task<Organizacion?> GetByIdAsync(int id)
    {
        return await _context.Organizaciones
            .AsNoTracking()
            .FirstOrDefaultAsync(org => org.OrganizacionId == id);
    }

    public async Task AddAsync(Organizacion organizacion)
    {
        _context.Organizaciones.Add(organizacion);
        await _context.SaveChangesAsync();
    }
}
