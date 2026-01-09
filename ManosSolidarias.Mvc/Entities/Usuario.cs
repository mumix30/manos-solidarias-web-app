namespace ManosSolidarias.Mvc.Entities;

public class Usuario
{
    public int UsuarioId { get; set; }
    public int RolId { get; set; }
    public string Usuario { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    public string NombreUsuario { get; set; } = string.Empty;
    public string ApellidoUsuario { get; set; } = string.Empty;
    public string EmailUsuario { get; set; } = string.Empty;
    public int Estatus { get; set; }
    public DateTime Creado { get; set; }
    public int CreadoPor { get; set; }
    public DateTime? Modificado { get; set; }
    public int? ModificadoPor { get; set; }

    public Role? Rol { get; set; }
}
