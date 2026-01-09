namespace ManosSolidarias.Mvc.Entities;

public class Role
{
    public int RolId { get; set; }
    public string Rol { get; set; } = string.Empty;
    public int Estatus { get; set; }
    public DateTime Creado { get; set; }
    public int CreadoPor { get; set; }
    public DateTime? Modificado { get; set; }
    public int? ModificadoPor { get; set; }

    public ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();
}
