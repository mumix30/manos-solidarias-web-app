using ManosSolidarias.Mvc.Entities;

namespace ManosSolidarias.Mvc.Repositories;

public interface IRoleRepository
{
    Task<IReadOnlyList<Role>> GetAllAsync();
    Task<Role?> GetByIdAsync(int id);
    Task AddAsync(Role role);
}
