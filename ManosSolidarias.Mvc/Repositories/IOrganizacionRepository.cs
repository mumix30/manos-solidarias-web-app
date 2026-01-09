using ManosSolidarias.Mvc.Entities;

namespace ManosSolidarias.Mvc.Repositories;

public interface IOrganizacionRepository
{
    Task<IReadOnlyList<Organizacion>> GetAllAsync();
    Task<Organizacion?> GetByIdAsync(int id);
    Task AddAsync(Organizacion organizacion);
}
