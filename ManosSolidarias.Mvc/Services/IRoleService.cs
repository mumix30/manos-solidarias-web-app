using ManosSolidarias.Mvc.Entities;

namespace ManosSolidarias.Mvc.Services;

public interface IRoleService
{
    Task<IReadOnlyList<Role>> GetRolesAsync();
    Task AddRoleAsync(Role role, int currentUserId);
}
