using ManosSolidarias.Mvc.Entities;

namespace ManosSolidarias.Mvc.Services;

public interface IOrganizacionService
{
    Task<IReadOnlyList<Organizacion>> GetOrganizacionesAsync();
    Task AddOrganizacionAsync(Organizacion organizacion, int currentUserId);
}
