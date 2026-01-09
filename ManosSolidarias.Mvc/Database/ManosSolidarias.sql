USE [master];
GO

/*******************************************************************************
Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'ManosSolidarias')
BEGIN
    ALTER DATABASE [ManosSolidarias] SET OFFLINE WITH ROLLBACK IMMEDIATE;
    ALTER DATABASE [ManosSolidarias] SET ONLINE;
    DROP DATABASE [ManosSolidarias];
END
GO

/*******************************************************************************
Create database
********************************************************************************/
CREATE DATABASE [ManosSolidarias];
GO

USE [ManosSolidarias];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************
Create Tables
********************************************************************************/

/** Tablas de Administración **/

DROP TABLE IF EXISTS [dbo].[Roles];
CREATE TABLE [dbo].[Roles] (
    [RolId] [INT] IDENTITY(1,1) NOT NULL,
    [Rol] NVARCHAR NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED (
        [RolId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Usuarios];
CREATE TABLE [dbo].[Usuarios] (
    [UsuarioID] [INT] IDENTITY(1,1) NOT NULL,
    [RolID] [INT] NOT NULL,
    [Usuario] NVARCHAR NOT NULL,
    [Password] [NVARCHAR] (MAX) NOT NULL,
    [NombreUsuario] NVARCHAR NOT NULL,
    [ApellidoUsuario] NVARCHAR NOT NULL,
    [EmailUsuario] NVARCHAR NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED (
        [UsuarioID] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Organizaciones];
CREATE TABLE [dbo].[Organizaciones] (
    [OrganizacionId] [INT] IDENTITY(1,1) NOT NULL,
    [Organizacion] NVARCHAR NOT NULL,
    [Direccion] NVARCHAR NOT NULL,
    [Telefono] NVARCHAR NOT NULL,
    [Celular] NVARCHAR NOT NULL,
    [Email] NVARCHAR NOT NULL,
    [Formal] [INT] NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_Organizacion] PRIMARY KEY CLUSTERED (
        [OrganizacionId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[TiposPrestamo];
CREATE TABLE [dbo].[TiposPrestamo] (
    [TipoPrestamoId] [INT] IDENTITY(1,1) NOT NULL,
    [TipoPrestamo] NVARCHAR NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_TipoPrestamo] PRIMARY KEY CLUSTERED (
        [TipoPrestamoId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[TiposAhorro];
CREATE TABLE [dbo].[TiposAhorro] (
    [TipoAhorroId] [INT] IDENTITY(1,1) NOT NULL,
    [TipoAhorro] NVARCHAR NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_TipoAhorro] PRIMARY KEY CLUSTERED (
        [TipoAhorroId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Proveedores];
CREATE TABLE [dbo].[Proveedores] (
    [ProveedorId] [INT] IDENTITY(1,1) NOT NULL,
    [Proveedor] NVARCHAR NOT NULL,
    [Direccion] NVARCHAR NOT NULL,
    [Telefono] NVARCHAR NOT NULL,
    [Celular] NVARCHAR NOT NULL,
    [Email] NVARCHAR NOT NULL,
    [PersonaContacto] NVARCHAR NOT NULL,
    [TelefonoContacto] NVARCHAR NOT NULL,
    [CelularContacto] NVARCHAR NOT NULL,
    [EmailContacto] NVARCHAR NOT NULL,
    [Formal] [INT] NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED (
        [ProveedorId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[ProfesionOficio];
CREATE TABLE [dbo].[ProfesionOficio] (
    [ProfesionOficioId] [INT] IDENTITY(1,1) NOT NULL,
    [Nombre] NVARCHAR NOT NULL,
    [Profesional] [INT] NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_ProfesionOficio] PRIMARY KEY CLUSTERED (
        [ProfesionOficioId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[TipoDocumento];
CREATE TABLE [dbo].[TipoDocumento](
    [TipoDocumentoID] [INT] IDENTITY(1,1) NOT NULL,
    [TipoDocumentoNombre] NCHAR NOT NULL,
    [Estatus] [INT] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [INT] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [INT] NULL,
    CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED (
        [TipoDocumentoID] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Pais];
CREATE TABLE [dbo].[Pais](
    [PaisId] [INT] IDENTITY(1,1) NOT NULL,
    [Pais] NCHAR NOT NULL,
    [CodigoISO] VARCHAR NOT NULL,
    CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED (
        [PaisId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Estatus];
CREATE TABLE [dbo].[Estatus](
    [EstatusId] [INT] IDENTITY(0,1) NOT NULL,
    [Descripcion] NVARCHAR NOT NULL,
    CONSTRAINT [PK_Estatus] PRIMARY KEY CLUSTERED (
        [EstatusId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[FormalProfesional];
CREATE TABLE [dbo].[FormalProfesional](
    [FormalProfesionalId] [INT] IDENTITY(0,1) NOT NULL,
    [Detalle] NVARCHAR NOT NULL,
    CONSTRAINT [PK_Formal] PRIMARY KEY CLUSTERED (
        [FormalProfesionalId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Departamento];
CREATE TABLE [dbo].[Departamento](
    [DepartamentoId] [int] IDENTITY(1,1) NOT NULL,
    [PaisId] [int] NOT NULL,
    [Departamento] nvarchar NOT NULL,
    CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED (
        [DepartamentoId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Municipio];
CREATE TABLE [dbo].[Municipio](
    [MunicipioId] [int] IDENTITY(1,1) NOT NULL,
    [DepartamentoId] [int] NOT NULL,
    [Municipio] nvarchar NOT NULL,
    CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED (
        [MunicipioId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Nacionalidad];
CREATE TABLE [dbo].[Nacionalidad](
    [NacionalidadId] [int] IDENTITY(1,1) NOT NULL,
    [Nacionalidad] nvarchar NOT NULL,
    CONSTRAINT [PK_Nacionalidad] PRIMARY KEY CLUSTERED (
        [NacionalidadId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Parentesco];
CREATE TABLE [dbo].[Parentesco](
    [ParentescoId] [int] IDENTITY(1,1) NOT NULL,
    [Parentesco] nvarchar NOT NULL,
    CONSTRAINT [PK_Parentesco] PRIMARY KEY CLUSTERED (
        [ParentescoId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Asociado];
CREATE TABLE [dbo].[Asociado](
    [AsociadoId] [int] IDENTITY(1,1) NOT NULL,
    [CodigoAsociado] [nvarchar] (20),
    [Nombres] [varchar] (200) NOT NULL,
    [Apellidos] [varchar] (200) NOT NULL,
    [NombreCompleto] [varchar] (200) NOT NULL,
    [Identificacion] [nvarchar] (30) NOT NULL,
    [DepartamentoExpedicion] [int] NOT NULL,
    [MunicipioExpedicion] [int] NOT NULL,
    [FechaExpiracion] [DATETIME] NOT NULL,
    [FechaExpedicion] [DATETIME] NOT NULL,
    [NIT] [nvarchar] (20),
    [FechaNacimiento] [DATETIME] NOT NULL,
    [LugarNacimiento] [nvarchar] (200) NOT NULL,
    [NacionalidadId] [int] NOT NULL,
    [PaisId] [int] NOT NULL,
    [DepartamentoId] [int],
    [MunicipioId] [int],
    [Direccion] [nvarchar] (300) NOT NULL,
    [Telefono] [nvarchar] (15) NOT NULL,
    [Celular] [nvarchar] (15) NOT NULL,
    [Email] [nvarchar] (250) NOT NULL,
    [Aguinaldo] [money],
    [Estatus] [int] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_Asociado] PRIMARY KEY CLUSTERED (
        [AsociadoId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Trabajo];
CREATE TABLE [dbo].[Trabajo](
    [TrabajoId] [int] IDENTITY(1,1) NOT NULL,
    [AsociadoId] [int] NOT NULL,
    [OrganizacionId] [int] NOT NULL,
    [ProfesionOficioId] [int] NOT NULL,
    [Direccion] [nvarchar] (300) NOT NULL,
    [Telefono] [nvarchar] (15) NOT NULL,
    [Email] [nvarchar] (250) NOT NULL,
    [Estatus] [int] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_Trabajo] PRIMARY KEY CLUSTERED (
        [TrabajoId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Beneficiario];
CREATE TABLE [dbo].[Beneficiario](
    [BeneficiarioId] [int] IDENTITY(1,1) NOT NULL,
    [AsociadoId] [int] NOT NULL,
    [ParentescoId] [int] NOT NULL,
    [NombresBeneficiario] [varchar] (200) NOT NULL,
    [ApellidosBeneficiario] [varchar] (200) NOT NULL,
    [NombreCompletoBeneficiario] [varchar] (200) NOT NULL,
    [Porcentaje] [int] NOT NULL,
    [Email] [nvarchar] (250) NOT NULL,
    [Telefono] [nvarchar] (15) NOT NULL,
    [Estatus] [int] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_Beneficiario] PRIMARY KEY CLUSTERED (
        [BeneficiarioId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Banco];
CREATE TABLE [dbo].[Banco](
    [BancoId] [int] IDENTITY(1,1) NOT NULL,
    [NombreBanco] [nvarchar] (150) NOT NULL,
    [Estatus] [int] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_Banco] PRIMARY KEY CLUSTERED (
        [BancoId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[InfoBancaria];
CREATE TABLE [dbo].[InfoBancaria](
    [InfoBancariaId] [int] IDENTITY(1,1) NOT NULL,
    [AsociadoId] [int] NOT NULL,
    [BancoId] [int] NOT NULL,
    [NumeroCuenta] [nvarchar] (30) NOT NULL,
    [TipoCuenta] [varchar] (50) NOT NULL,
    [Estatus] [int] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_InfoBancaria] PRIMARY KEY CLUSTERED (
        [InfoBancariaId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[Aportacion];
CREATE TABLE [dbo].[Aportacion](
    [AportacionId] [int] IDENTITY(1,1) NOT NULL,
    [AsociadoId] [int] NOT NULL,
    [TipoAhorroId] [int] NOT NULL,
    [SaldoActual] [money] NOT NULL,
    [CuotaMensual] [money] NOT NULL,
    [QuincenaDescuento] [int] NOT NULL,
    [FechaUltimaAportacion] [DATETIME] NOT NULL,
    [MontoUltimaAportacion] [money] NOT NULL,
    [Estatus] [int] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_Aportacion] PRIMARY KEY CLUSTERED (
        [AportacionId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[EstadoSolicitud];
CREATE TABLE [dbo].[EstadoSolicitud](
    [EstadoSolicitudId] [int] IDENTITY(1,1) NOT NULL,
    [NombreEstadoSolicitud] [varchar] (50) NOT NULL,
    CONSTRAINT [PK_EstadoSolicitud] PRIMARY KEY CLUSTERED (
        [EstadoSolicitudId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[TipoMovimientoAhorro];
CREATE TABLE [dbo].[TipoMovimientoAhorro](
    [TipoMovimientoAhorroId] [int] IDENTITY(1,1) NOT NULL,
    [NombreTipoMovimientoAhorro] [varchar] (50) NOT NULL,
    CONSTRAINT [PK_TipoMovimientoAhorro] PRIMARY KEY CLUSTERED (
        [TipoMovimientoAhorroId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[SolicitudPrestamo];
CREATE TABLE [dbo].[SolicitudPrestamo](
    [SolicitudPrestamoId] [int] IDENTITY(1,1) NOT NULL,
    [TipoPrestamoId] [int] NOT NULL,
    [AsociadoId] [int] NOT NULL,
    [Monto] [money] NOT NULL,
    [Motivo] [nvarchar] (max) NOT NULL,
    [FechaSolicitud] [datetime] NOT NULL,
    [Fiador1] [varchar] (150),
    [Fiador2] [varchar] (150),
    [EstadoSolicitudId] [int] NOT NULL,
    [FechaEstado] [datetime] NOT NULL,
    [UsuarioEstado] [int] NOT NULL,
    [Comentario] [nvarchar] (max),
    [BeneficiarioId] [int] NOT NULL,
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_SolicitudPrestamo] PRIMARY KEY CLUSTERED (
        [SolicitudPrestamoId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[SolicitudAhorro];
CREATE TABLE [dbo].[SolicitudAhorro](
    [SolicitudAhorroId] [int] IDENTITY(1,1) NOT NULL,
    [TipoAhorroId] [int] NOT NULL,
    [TipoMovimientoId] [int] NOT NULL,
    [AsociadoId] [int] NOT NULL,
    [Monto] [money] NOT NULL,
    [Motivo] [nvarchar] (max) NOT NULL,
    [FechaSolicitud] [datetime] NOT NULL,
    [Plazo] [int],
    [EstadoSolicitudId] [int] NOT NULL,
    [FechaEstado] [datetime] NOT NULL,
    [UsuarioEstado] [int] NOT NULL,
    [ConstanciaIngreso] [image],
    [Creado] [DATETIME] NOT NULL,
    [CreadoPor] [int] NOT NULL,
    [Modificado] [DATETIME] NULL,
    [ModificadoPor] [int] NULL,
    CONSTRAINT [PK_SolicitudAhorro] PRIMARY KEY CLUSTERED (
        [SolicitudAhorroId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

DROP TABLE IF EXISTS [dbo].[SolicitudAportacion];
CREATE TABLE [dbo].[SolicitudAportacion](
    [SolicitudAportacionId] [int] IDENTITY(1,1) NOT NULL,
    [AsociadoId] [int] NOT NULL,
    [MontoSolicitado] [money] NOT NULL,
    [EstadoSolicitudId] [int] NOT NULL,
    [FechaEstado] [datetime] NOT NULL,
    [Comentario] [nvarchar] (max),
    CONSTRAINT [PK_SolicitudAportacion] PRIMARY KEY CLUSTERED (
        [SolicitudAportacionId] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

/*******************************************************************************
Create Foreign Keys
********************************************************************************/

/** Tabla Roles **/
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [FK_RolesEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_RolesEstatusId] ON [dbo].[Roles] ([Estatus]);
GO

/** Tabla Usuarios **/
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_UsuariosRolId]
    FOREIGN KEY ([RolId]) REFERENCES [dbo].[Roles] ([RolId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_UsuariosCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_UsuariosModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_UsuariosEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_UsuariosEstatusId] ON [dbo].[Usuarios] ([Estatus]);
CREATE INDEX [IFK_UsuariosRolId] ON [dbo].[Usuarios] ([RolId]);
CREATE INDEX [IFK_UsuariosCreadoPor] ON [dbo].[Usuarios] ([CreadoPor]);
CREATE INDEX [IFK_UsuariosModificadoPor] ON [dbo].[Usuarios] ([ModificadoPor]);
GO

/** Tabla Organizaciones **/
ALTER TABLE [dbo].[Organizaciones]
ADD CONSTRAINT [FK_OrganizacionesCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Organizaciones]
ADD CONSTRAINT [FK_OrganizacionesModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Organizaciones]
ADD CONSTRAINT [FK_OrganizacionesEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Organizaciones]
ADD CONSTRAINT [FK_OrganizacionesFormalId]
    FOREIGN KEY ([Formal]) REFERENCES [dbo].[FormalProfesional] ([FormalProfesionalId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_OrganizacionesEstatusId] ON [dbo].[Organizaciones] ([Estatus]);
CREATE INDEX [IFK_OrganizacionesFormalId] ON [dbo].[Organizaciones] ([Formal]);
CREATE INDEX [IFK_OrganizacionesCreadoPor] ON [dbo].[Organizaciones] ([CreadoPor]);
CREATE INDEX [IFK_UsuariosModificadoPor] ON [dbo].[Organizaciones] ([ModificadoPor]);
GO

/** Tabla TiposPrestamo **/
ALTER TABLE [dbo].[TiposPrestamo]
ADD CONSTRAINT [FK_TiposPrestamoCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[TiposPrestamo]
ADD CONSTRAINT [FK_TiposPrestamoModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[TiposPrestamo]
ADD CONSTRAINT [FK_TiposPrestamoEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_TiposPrestamoEstatusId] ON [dbo].[TiposPrestamo] ([Estatus]);
CREATE INDEX [IFK_TiposPrestamoCreadoPor] ON [dbo].[TiposPrestamo] ([CreadoPor]);
CREATE INDEX [IFK_TiposPrestamoModificadoPor] ON [dbo].[TiposPrestamo] ([ModificadoPor]);
GO

/** Tabla TiposAhorro **/
ALTER TABLE [dbo].[TiposAhorro]
ADD CONSTRAINT [FK_TiposAhorroCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[TiposAhorro]
ADD CONSTRAINT [FK_TiposAhorroModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[TiposAhorro]
ADD CONSTRAINT [FK_TiposAhorroEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_TiposAhorroEstatusId] ON [dbo].[TiposAhorro] ([Estatus]);
CREATE INDEX [IFK_TiposAhorroCreadoPor] ON [dbo].[TiposAhorro] ([CreadoPor]);
CREATE INDEX [IFK_TiposAhorroModificadoPor] ON [dbo].[TiposAhorro] ([ModificadoPor]);
GO

/** Tabla Proveedores **/
ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [FK_ProveedoresCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [FK_ProveedoresModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [FK_ProveedoresEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [FK_ProveedoresFormalId]
    FOREIGN KEY ([Formal]) REFERENCES [dbo].[FormalProfesional] ([FormalProfesionalId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_ProveedoresEstatusId] ON [dbo].[Proveedores] ([Estatus]);
CREATE INDEX [IFK_ProveedoresFormalId] ON [dbo].[Proveedores] ([Formal]);
CREATE INDEX [IFK_ProveedoresCreadoPor] ON [dbo].[Proveedores] ([CreadoPor]);
CREATE INDEX [IFK_ProveedoresModificadoPor] ON [dbo].[Proveedores] ([ModificadoPor]);
GO

/** Tabla ProfesionOficio **/
ALTER TABLE [dbo].[ProfesionOficio]
ADD CONSTRAINT [FK_ProfesionOficioCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[ProfesionOficio]
ADD CONSTRAINT [FK_ProfesionOficioModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[ProfesionOficio]
ADD CONSTRAINT [FK_ProfesionOficioEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[ProfesionOficio]
ADD CONSTRAINT [FK_ProfesionOficioProfesionalId]
    FOREIGN KEY ([Profesional]) REFERENCES [dbo].[FormalProfesional] ([FormalProfesionalId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_ProfesionOficioEstatusId] ON [dbo].[ProfesionOficio] ([Estatus]);
CREATE INDEX [IFK_ProfesionOficioProfesionalId] ON [dbo].[ProfesionOficio] ([Profesional]);
CREATE INDEX [IFK_ProfesionOficioCreadoPor] ON [dbo].[ProfesionOficio] ([CreadoPor]);
CREATE INDEX [IFK_ProfesionOficioModificadoPor] ON [dbo].[ProfesionOficio] ([ModificadoPor]);
GO

/** Tabla TipoDocumento **/
ALTER TABLE [dbo].[TipoDocumento]
ADD CONSTRAINT [FK_TipoDocumentoCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[TipoDocumento]
ADD CONSTRAINT [FK_TipoDocumentoModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[TipoDocumento]
ADD CONSTRAINT [FK_TipoDocumentoEstatusId]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_TipoDocumentoEstatusId] ON [dbo].[TipoDocumento] ([Estatus]);
CREATE INDEX [IFK_TipoDocumentoCreadoPor] ON [dbo].[TipoDocumento] ([CreadoPor]);
CREATE INDEX [IFK_TipoDocumentoModificadoPor] ON [dbo].[TipoDocumento] ([ModificadoPor]);
GO

/** Tabla Departamento **/
ALTER TABLE [dbo].[Departamento]
ADD CONSTRAINT [FK_DepartamentoPaisId]
    FOREIGN KEY([PaisId]) REFERENCES [dbo].[Pais] ([PaisId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_DepartamentoPaisId] ON [dbo].[Departamento] ([PaisId]);
GO

/** Tabla Municipio **/
ALTER TABLE [dbo].[Municipio]
ADD CONSTRAINT [FK_MunicipioDepartamentoId]
    FOREIGN KEY([DepartamentoId]) REFERENCES [dbo].[Departamento] ([DepartamentoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_MunicipioDepartamentoId] ON [dbo].[Municipio] ([DepartamentoId]);
GO

/** Tabla Asociado **/
ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoNacionalidad]
    FOREIGN KEY([NacionalidadId]) REFERENCES [dbo].[Nacionalidad] ([NacionalidadId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoPais]
    FOREIGN KEY([PaisId]) REFERENCES [dbo].[Pais] ([PaisId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoDepartamento]
    FOREIGN KEY([DepartamentoId]) REFERENCES [dbo].[Departamento] ([DepartamentoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoMunicipio]
    FOREIGN KEY([MunicipioId]) REFERENCES [dbo].[Municipio] ([MunicipioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoDepartamentoExpedicion]
    FOREIGN KEY([DepartamentoExpedicion]) REFERENCES [dbo].[Departamento] ([DepartamentoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoMunicipioExpedicion]
    FOREIGN KEY([MunicipioExpedicion]) REFERENCES [dbo].[Municipio] ([MunicipioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Asociado]
ADD CONSTRAINT [FK_AsociadoEstatus]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_AsociadoEstatus] ON [dbo].[Asociado] ([Estatus]);
CREATE INDEX [IFK_AsociadoCreadoPor] ON [dbo].[Asociado] ([CreadoPor]);
CREATE INDEX [IFK_AsociadoModificadoPor] ON [dbo].[Asociado] ([ModificadoPor]);
CREATE INDEX [IFK_AsociadoMunicipio] ON [dbo].[Asociado] ([MunicipioId]);
CREATE INDEX [IFK_AsociadoDepartamento] ON [dbo].[Asociado] ([DepartamentoId]);
CREATE INDEX [IFK_AsociadoMunicipioExpedicion] ON [dbo].[Asociado] ([MunicipioExpedicion]);
CREATE INDEX [IFK_AsociadoDepartamentoExpedicion] ON [dbo].[Asociado] ([DepartamentoExpedicion]);
CREATE INDEX [IFK_AsociadoPais] ON [dbo].[Asociado] ([PaisId]);
CREATE INDEX [IFK_AsociadoNacionalidad] ON [dbo].[Asociado] ([NacionalidadId]);
GO

/** Tabla Trabajo **/
ALTER TABLE [dbo].[Trabajo]
ADD CONSTRAINT [FK_TrabajoAsociado]
    FOREIGN KEY([AsociadoId]) REFERENCES [dbo].[Asociado] ([AsociadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Trabajo]
ADD CONSTRAINT [FK_TrabajoOrganizacion]
    FOREIGN KEY([OrganizacionId]) REFERENCES [dbo].[Organizaciones] ([OrganizacionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Trabajo]
ADD CONSTRAINT [FK_TrabajoProfesionOficio]
    FOREIGN KEY([ProfesionOficioId]) REFERENCES [dbo].[ProfesionOficio] ([ProfesionOficioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Trabajo]
ADD CONSTRAINT [FK_TrabajoCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Trabajo]
ADD CONSTRAINT [FK_TrabajoModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Trabajo]
ADD CONSTRAINT [FK_TrabajoEstatus]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_TrabajoEstatus] ON [dbo].[Trabajo] ([Estatus]);
CREATE INDEX [IFK_TrabajoCreadoPor] ON [dbo].[Trabajo] ([CreadoPor]);
CREATE INDEX [IFK_TrabajoModificadoPor] ON [dbo].[Trabajo] ([ModificadoPor]);
CREATE INDEX [IFK_TrabajoAsociado] ON [dbo].[Trabajo] ([AsociadoId]);
CREATE INDEX [IFK_TrabajoOrganizacion] ON [dbo].[Trabajo] ([OrganizacionId]);
CREATE INDEX [IFK_TrabajoProfesionOficio] ON [dbo].[Trabajo] ([ProfesionOficioId]);
GO

/** Tabla Beneficiario **/
ALTER TABLE [dbo].[Beneficiario]
ADD CONSTRAINT [FK_BeneficiarioAsociado]
    FOREIGN KEY([AsociadoId]) REFERENCES [dbo].[Asociado] ([AsociadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Beneficiario]
ADD CONSTRAINT [FK_BeneficiarioParentesco]
    FOREIGN KEY([ParentescoId]) REFERENCES [dbo].[Parentesco] ([ParentescoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Beneficiario]
ADD CONSTRAINT [FK_BeneficiarioCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Beneficiario]
ADD CONSTRAINT [FK_BeneficiarioModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Beneficiario]
ADD CONSTRAINT [FK_BeneficiarioEstatus]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_BeneficiarioEstatus] ON [dbo].[Beneficiario] ([Estatus]);
CREATE INDEX [IFK_BeneficiarioCreadoPor] ON [dbo].[Beneficiario] ([CreadoPor]);
CREATE INDEX [IFK_BeneficiarioModificadoPor] ON [dbo].[Beneficiario] ([ModificadoPor]);
CREATE INDEX [IFK_BeneficiarioAsociado] ON [dbo].[Beneficiario] ([AsociadoId]);
CREATE INDEX [IFK_BeneficiarioParentesco] ON [dbo].[Beneficiario] ([ParentescoId]);
GO

/** Tabla Banco **/
ALTER TABLE [dbo].[Banco]
ADD CONSTRAINT [FK_BancoCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Banco]
ADD CONSTRAINT [FK_BancoModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Banco]
ADD CONSTRAINT [FK_BancoEstatus]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_BancoEstatus] ON [dbo].[Banco] ([Estatus]);
CREATE INDEX [IFK_BancoCreadoPor] ON [dbo].[Banco] ([CreadoPor]);
CREATE INDEX [IFK_BancoModificadoPor] ON [dbo].[Banco] ([ModificadoPor]);
GO

/** Tabla InfoBancaria **/
ALTER TABLE [dbo].[InfoBancaria]
ADD CONSTRAINT [FK_InfoBancariaAsociado]
    FOREIGN KEY([AsociadoId]) REFERENCES [dbo].[Asociado] ([AsociadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[InfoBancaria]
ADD CONSTRAINT [FK_InfoBancariaBanco]
    FOREIGN KEY([BancoId]) REFERENCES [dbo].[Banco] ([BancoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[InfoBancaria]
ADD CONSTRAINT [FK_InfoBancariaCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[InfoBancaria]
ADD CONSTRAINT [FK_InfoBancariaModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[InfoBancaria]
ADD CONSTRAINT [FK_InfoBancariaEstatus]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_InfoBancariaEstatus] ON [dbo].[InfoBancaria] ([Estatus]);
CREATE INDEX [IFK_InfoBancariaCreadoPor] ON [dbo].[InfoBancaria] ([CreadoPor]);
CREATE INDEX [IFK_InfoBancariaModificadoPor] ON [dbo].[InfoBancaria] ([ModificadoPor]);
CREATE INDEX [IFK_InfoBancariaAsociado] ON [dbo].[InfoBancaria] ([AsociadoId]);
CREATE INDEX [IFK_InfoBancariaBanco] ON [dbo].[InfoBancaria] ([BancoId]);
GO

/** Tabla Aportacion **/
ALTER TABLE [dbo].[Aportacion]
ADD CONSTRAINT [FK_AportacionAsociado]
    FOREIGN KEY([AsociadoId]) REFERENCES [dbo].[Asociado] ([AsociadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Aportacion]
ADD CONSTRAINT [FK_AportacionTipoAhorro]
    FOREIGN KEY([TipoAhorroId]) REFERENCES [dbo].[TiposAhorro] ([TipoAhorroId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Aportacion]
ADD CONSTRAINT [FK_AportacionCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Aportacion]
ADD CONSTRAINT [FK_AportacionModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[Aportacion]
ADD CONSTRAINT [FK_AportacionEstatus]
    FOREIGN KEY ([Estatus]) REFERENCES [dbo].[Estatus] ([EstatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_AportacionEstatus] ON [dbo].[Aportacion] ([Estatus]);
CREATE INDEX [IFK_AportacionCreadoPor] ON [dbo].[Aportacion] ([CreadoPor]);
CREATE INDEX [IFK_AportacionModificadoPor] ON [dbo].[Aportacion] ([ModificadoPor]);
CREATE INDEX [IFK_AportacionaAsociado] ON [dbo].[Aportacion] ([AsociadoId]);
CREATE INDEX [IFK_AportacionTipoAhorro] ON [dbo].[Aportacion] ([TipoAhorroId]);
GO

/** Tabla SolicitudPrestamo **/
ALTER TABLE [dbo].[SolicitudPrestamo]
ADD CONSTRAINT [FK_SolicitudTipoPrestamo]
    FOREIGN KEY([TipoPrestamoId]) REFERENCES [dbo].[TiposPrestamo] ([TipoPrestamoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudPrestamo]
ADD CONSTRAINT [FK_SolicitudAsociado]
    FOREIGN KEY([AsociadoId]) REFERENCES [dbo].[Asociado] ([AsociadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudPrestamo]
ADD CONSTRAINT [FK_SolicitudEstado]
    FOREIGN KEY([EstadoSolicitudId]) REFERENCES [dbo].[EstadoSolicitud] ([EstadoSolicitudId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudPrestamo]
ADD CONSTRAINT [FK_SolicitudUsuarioEstado]
    FOREIGN KEY([UsuarioEstado]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudPrestamo]
ADD CONSTRAINT [FK_SolicitudBeneficiario]
    FOREIGN KEY ([BeneficiarioId]) REFERENCES [dbo].[Beneficiario] ([BeneficiarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudPrestamo]
ADD CONSTRAINT [FK_SolicitudModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudPrestamo]
ADD CONSTRAINT [FK_SolicitudCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_SolicitudEstado] ON [dbo].[SolicitudPrestamo] ([EstadoSolicitudId]);
CREATE INDEX [IFK_SolicitudCreadoPor] ON [dbo].[SolicitudPrestamo] ([CreadoPor]);
CREATE INDEX [IFK_SolicitudModificadoPor] ON [dbo].[SolicitudPrestamo] ([ModificadoPor]);
CREATE INDEX [IFK_SolicitudTipoPrestamo] ON [dbo].[SolicitudPrestamo] ([TipoPrestamoId]);
CREATE INDEX [IFK_SolicitudAsociado] ON [dbo].[SolicitudPrestamo] ([AsociadoId]);
CREATE INDEX [IFK_SolicitudUsuarioEstado] ON [dbo].[SolicitudPrestamo] ([UsuarioEstado]);
CREATE INDEX [IFK_SolicitudBeneficiario] ON [dbo].[SolicitudPrestamo] ([BeneficiarioId]);
GO

/** Tabla SolicitudAhorro **/
ALTER TABLE [dbo].[SolicitudAhorro]
ADD CONSTRAINT [FK_SolicitudTipoAhorro]
    FOREIGN KEY([TipoAhorroId]) REFERENCES [dbo].[TiposAhorro] ([TipoAhorroId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudAhorro]
ADD CONSTRAINT [FK_SolicitudAhorroAsociado]
    FOREIGN KEY([AsociadoId]) REFERENCES [dbo].[Asociado] ([AsociadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudAhorro]
ADD CONSTRAINT [FK_SolicitudAhorroEstado]
    FOREIGN KEY([EstadoSolicitudId]) REFERENCES [dbo].[EstadoSolicitud] ([EstadoSolicitudId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudAhorro]
ADD CONSTRAINT [FK_SolicitudAhorroUsuarioEstado]
    FOREIGN KEY([UsuarioEstado]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudAhorro]
ADD CONSTRAINT [FK_SolicitudAhorroTipoMovimiento]
    FOREIGN KEY ([TipoMovimientoId]) REFERENCES [dbo].[TipoMovimientoAhorro] ([TipoMovimientoAhorroId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudAhorro]
ADD CONSTRAINT [FK_SolicitudAhorroModificadoPor]
    FOREIGN KEY ([ModificadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudAhorro]
ADD CONSTRAINT [FK_SolicitudAhorroCreadoPor]
    FOREIGN KEY ([CreadoPor]) REFERENCES [dbo].[Usuarios] ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_SolicitudAhorroEstado] ON [dbo].[SolicitudAhorro] ([EstadoSolicitudId]);
CREATE INDEX [IFK_SolicitudAhorroCreadoPor] ON [dbo].[SolicitudAhorro] ([CreadoPor]);
CREATE INDEX [IFK_SolicitudAhorroModificadoPor] ON [dbo].[SolicitudAhorro] ([ModificadoPor]);
CREATE INDEX [IFK_SolicitudTipoAhorro] ON [dbo].[SolicitudAhorro] ([TipoAhorroId]);
CREATE INDEX [IFK_SolicitudAhorroAsociado] ON [dbo].[SolicitudAhorro] ([AsociadoId]);
CREATE INDEX [IFK_SolicitudAhorroUsuarioEstado] ON [dbo].[SolicitudAhorro] ([UsuarioEstado]);
CREATE INDEX [IFK_SolicitudAhorroTipoMovimiento] ON [dbo].[SolicitudAhorro] ([TipoMovimientoId]);
GO

/** Tabla SolicitudAportacion **/
ALTER TABLE [dbo].[SolicitudAportacion]
ADD CONSTRAINT [FK_SolicitudAportacionAsociado]
    FOREIGN KEY([AsociadoId]) REFERENCES [dbo].[Asociado] ([AsociadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

ALTER TABLE [dbo].[SolicitudAportacion]
ADD CONSTRAINT [FK_SolicitudAportacionEstado]
    FOREIGN KEY([EstadoSolicitudId]) REFERENCES [dbo].[EstadoSolicitud] ([EstadoSolicitudId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE INDEX [IFK_SolicitudAportacionEstado] ON [dbo].[SolicitudAportacion] ([EstadoSolicitudId]);
CREATE INDEX [IFK_SolicitudAportacionAsociado] ON [dbo].[SolicitudAportacion] ([AsociadoId]);
GO
