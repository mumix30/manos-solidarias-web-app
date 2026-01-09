using ManosSolidarias.Mvc.Entities;
using ManosSolidarias.Mvc.Repositories;

namespace ManosSolidarias.Mvc.Services;

public class RoleService : IRoleService
{
    private readonly IRoleRepository _repository;

    public RoleService(IRoleRepository repository)
    {
        _repository = repository;
    }

    public async Task<IReadOnlyList<Role>> GetRolesAsync()
    {
        return await _repository.GetAllAsync();
    }

    public async Task AddRoleAsync(Role role, int currentUserId)
    {
        role.Creado = DateTime.UtcNow;
        role.CreadoPor = currentUserId;
        await _repository.AddAsync(role);
    }
}
