using ManosSolidarias.Mvc.Entities;
using Microsoft.EntityFrameworkCore;

namespace ManosSolidarias.Mvc.Data;

public class ManosSolidariasContext : DbContext
{
    public ManosSolidariasContext(DbContextOptions<ManosSolidariasContext> options)
        : base(options)
    {
    }

    public DbSet<Role> Roles => Set<Role>();
    public DbSet<Usuario> Usuarios => Set<Usuario>();
    public DbSet<Organizacion> Organizaciones => Set<Organizacion>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Roles");
            entity.HasKey(e => e.RolId);
            entity.Property(e => e.Rol).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Creado).HasColumnType("datetime");
            entity.Property(e => e.Modificado).HasColumnType("datetime");
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.ToTable("Usuarios");
            entity.HasKey(e => e.UsuarioId);
            entity.Property(e => e.Usuario).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Password).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.NombreUsuario).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.ApellidoUsuario).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.EmailUsuario).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Creado).HasColumnType("datetime");
            entity.Property(e => e.Modificado).HasColumnType("datetime");
            entity.HasOne(e => e.Rol)
                .WithMany(r => r.Usuarios)
                .HasForeignKey(e => e.RolId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<Organizacion>(entity =>
        {
            entity.ToTable("Organizaciones");
            entity.HasKey(e => e.OrganizacionId);
            entity.Property(e => e.Organizacion).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Direccion).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Telefono).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Celular).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Email).HasColumnType("nvarchar(max)").IsRequired();
            entity.Property(e => e.Creado).HasColumnType("datetime");
            entity.Property(e => e.Modificado).HasColumnType("datetime");
        });
    }
}
