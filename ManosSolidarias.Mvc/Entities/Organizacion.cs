namespace ManosSolidarias.Mvc.Entities;

public class Organizacion
{
    public int OrganizacionId { get; set; }
    public string Organizacion { get; set; } = string.Empty;
    public string Direccion { get; set; } = string.Empty;
    public string Telefono { get; set; } = string.Empty;
    public string Celular { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public int Formal { get; set; }
    public int Estatus { get; set; }
    public DateTime Creado { get; set; }
    public int CreadoPor { get; set; }
    public DateTime? Modificado { get; set; }
    public int? ModificadoPor { get; set; }
}
