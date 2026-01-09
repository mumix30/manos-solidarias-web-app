using ManosSolidarias.Mvc.Entities;
using ManosSolidarias.Mvc.Repositories;

namespace ManosSolidarias.Mvc.Services;

public class OrganizacionService : IOrganizacionService
{
    private readonly IOrganizacionRepository _repository;

    public OrganizacionService(IOrganizacionRepository repository)
    {
        _repository = repository;
    }

    public async Task<IReadOnlyList<Organizacion>> GetOrganizacionesAsync()
    {
        return await _repository.GetAllAsync();
    }

    public async Task AddOrganizacionAsync(Organizacion organizacion, int currentUserId)
    {
        organizacion.Creado = DateTime.UtcNow;
        organizacion.CreadoPor = currentUserId;
        await _repository.AddAsync(organizacion);
    }
}
