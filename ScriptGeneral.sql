USE [DonShalo]
GO
/****** Object:  Table [dbo].[ASIGNACIONPERSONAL]    Script Date: 7/9/2025 3:03:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASIGNACIONPERSONAL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NULL,
	[IdPersonal] [int] NULL,
 CONSTRAINT [pk_asignacion_personal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASISTENCIA]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASISTENCIA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Tipo] [char](1) NULL,
	[Justificacion] [text] NULL,
	[IdPersonal] [int] NULL,
 CONSTRAINT [pk_asistencia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [pk_categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](1) NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Nombre] [varchar](200) NULL,
	[ApellidoPaterno] [varchar](100) NULL,
	[ApellidoMaterno] [varchar](100) NULL,
	[Ruc] [varchar](20) NULL,
	[RazonSocial] [varchar](max) NULL,
	[Dirreccion] [varchar](max) NULL,
	[DirreccionEntrega] [varchar](max) NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DESCUENTO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESCUENTO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[TipoDesc] [int] NULL,
	[Justificacion] [text] NULL,
	[Monto] [decimal](4, 2) NULL,
	[IdPersonal] [int] NULL,
 CONSTRAINT [pk_descuento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLEPEDIDO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLEPEDIDO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](4, 2) NULL,
	[IdPato] [int] NULL,
	[IdPedido] [int] NULL,
	[Comentario] [text] NULL,
 CONSTRAINT [pk_detallepedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDIOPAGO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDIOPAGO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [pk_mediopago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Ruta] [varchar](max) NULL,
	[Orden] [int] NULL,
	[MenuPadre] [int] NULL,
	[Icono] [varchar](400) NULL,
 CONSTRAINT [pk_menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MESA]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](2) NULL,
	[Capacidad] [int] NULL,
	[IdPiso] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [pk_mesa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumeroSerie] [varchar](10) NULL,
	[NumeroCorrelativo] [varchar](20) NULL,
	[TipoPedido] [char](1) NULL,
	[IdCliente] [int] NULL,
	[IdMesa] [int] NULL,
	[IdPersonal] [int] NULL,
	[IdMedioPago] [int] NULL,
	[Estado] [char](1) NULL,
 CONSTRAINT [pk_pedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAL]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPersonal] [varchar](10) NULL,
	[TipoDocumento] [varchar](2) NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Nombre] [varchar](200) NULL,
	[ApellidoPaterno] [varchar](100) NULL,
	[ApellidoMaterno] [varchar](100) NULL,
	[Telefono] [varchar](10) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](max) NULL,
	[Estado] [char](1) NULL,
	[IdRol] [int] NULL,
 CONSTRAINT [pk_personal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PISO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PISO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[CapacidadClientes] [int] NULL,
	[CapacidadEmpleados] [int] NULL,
	[IdSucural] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [pk_piso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLATO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLATO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[IdCategoria] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [pk_plato] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRECIO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRECIO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [decimal](4, 2) NULL,
	[Fecha] [datetime] NULL,
	[Estado] [bit] NULL,
	[IdPlato] [int] NULL,
 CONSTRAINT [pk_precio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [pk_rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLXMENU]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLXMENU](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdMenu] [int] NULL,
 CONSTRAINT [pk_rolxmenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUCURSAL]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUCURSAL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodigoSuc] [varchar](3) NULL,
	[Nombre] [varchar](200) NULL,
	[Direccion] [varchar](500) NULL,
	[Telefono] [varchar](10) NULL,
	[IdResponsable] [int] NULL,
	[HoraEntrada] [time](7) NULL,
	[HoraSalida] [time](7) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [pk_sucursal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPODESCUENTO]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPODESCUENTO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
 CONSTRAINT [pk_tipodescuento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASIGNACIONPERSONAL]  WITH CHECK ADD  CONSTRAINT [fk_asignacion_personal_personal] FOREIGN KEY([IdPersonal])
REFERENCES [dbo].[PERSONAL] ([Id])
GO
ALTER TABLE [dbo].[ASIGNACIONPERSONAL] CHECK CONSTRAINT [fk_asignacion_personal_personal]
GO
ALTER TABLE [dbo].[ASIGNACIONPERSONAL]  WITH CHECK ADD  CONSTRAINT [fk_asignacion_personal_sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[SUCURSAL] ([Id])
GO
ALTER TABLE [dbo].[ASIGNACIONPERSONAL] CHECK CONSTRAINT [fk_asignacion_personal_sucursal]
GO
ALTER TABLE [dbo].[ASISTENCIA]  WITH CHECK ADD  CONSTRAINT [fk_asistencia_personal] FOREIGN KEY([Id])
REFERENCES [dbo].[PERSONAL] ([Id])
GO
ALTER TABLE [dbo].[ASISTENCIA] CHECK CONSTRAINT [fk_asistencia_personal]
GO
ALTER TABLE [dbo].[DESCUENTO]  WITH CHECK ADD  CONSTRAINT [fk_descuento_personal] FOREIGN KEY([Id])
REFERENCES [dbo].[PERSONAL] ([Id])
GO
ALTER TABLE [dbo].[DESCUENTO] CHECK CONSTRAINT [fk_descuento_personal]
GO
ALTER TABLE [dbo].[DESCUENTO]  WITH CHECK ADD  CONSTRAINT [fk_descuento_tipodescuento] FOREIGN KEY([Id])
REFERENCES [dbo].[TIPODESCUENTO] ([Id])
GO
ALTER TABLE [dbo].[DESCUENTO] CHECK CONSTRAINT [fk_descuento_tipodescuento]
GO
ALTER TABLE [dbo].[DETALLEPEDIDO]  WITH CHECK ADD  CONSTRAINT [fk_detallepedido_pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PEDIDO] ([Id])
GO
ALTER TABLE [dbo].[DETALLEPEDIDO] CHECK CONSTRAINT [fk_detallepedido_pedido]
GO
ALTER TABLE [dbo].[DETALLEPEDIDO]  WITH CHECK ADD  CONSTRAINT [fk_detallepedido_plato] FOREIGN KEY([IdPato])
REFERENCES [dbo].[PLATO] ([Id])
GO
ALTER TABLE [dbo].[DETALLEPEDIDO] CHECK CONSTRAINT [fk_detallepedido_plato]
GO
ALTER TABLE [dbo].[MENU]  WITH CHECK ADD  CONSTRAINT [fk_menu_menuhijo] FOREIGN KEY([Id])
REFERENCES [dbo].[MENU] ([Id])
GO
ALTER TABLE [dbo].[MENU] CHECK CONSTRAINT [fk_menu_menuhijo]
GO
ALTER TABLE [dbo].[MESA]  WITH CHECK ADD  CONSTRAINT [fk_mesa_piso] FOREIGN KEY([IdPiso])
REFERENCES [dbo].[PISO] ([Id])
GO
ALTER TABLE [dbo].[MESA] CHECK CONSTRAINT [fk_mesa_piso]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [fk_pedido_cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([Id])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [fk_pedido_cliente]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [fk_pedido_mediopago] FOREIGN KEY([IdMedioPago])
REFERENCES [dbo].[MEDIOPAGO] ([Id])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [fk_pedido_mediopago]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [fk_pedido_mesa] FOREIGN KEY([IdMesa])
REFERENCES [dbo].[MESA] ([Id])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [fk_pedido_mesa]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [fk_pedido_personal] FOREIGN KEY([IdPersonal])
REFERENCES [dbo].[PERSONAL] ([Id])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [fk_pedido_personal]
GO
ALTER TABLE [dbo].[PERSONAL]  WITH CHECK ADD  CONSTRAINT [fk_personal_rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([Id])
GO
ALTER TABLE [dbo].[PERSONAL] CHECK CONSTRAINT [fk_personal_rol]
GO
ALTER TABLE [dbo].[PISO]  WITH CHECK ADD  CONSTRAINT [fk_piso_sucursal] FOREIGN KEY([Id])
REFERENCES [dbo].[SUCURSAL] ([Id])
GO
ALTER TABLE [dbo].[PISO] CHECK CONSTRAINT [fk_piso_sucursal]
GO
ALTER TABLE [dbo].[PLATO]  WITH CHECK ADD  CONSTRAINT [fk_plato_categoria] FOREIGN KEY([Id])
REFERENCES [dbo].[CATEGORIA] ([Id])
GO
ALTER TABLE [dbo].[PLATO] CHECK CONSTRAINT [fk_plato_categoria]
GO
ALTER TABLE [dbo].[PRECIO]  WITH CHECK ADD  CONSTRAINT [fk_precio_plato] FOREIGN KEY([IdPlato])
REFERENCES [dbo].[PLATO] ([Id])
GO
ALTER TABLE [dbo].[PRECIO] CHECK CONSTRAINT [fk_precio_plato]
GO
ALTER TABLE [dbo].[ROLXMENU]  WITH CHECK ADD  CONSTRAINT [fk_rolxmenu_menu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[MENU] ([Id])
GO
ALTER TABLE [dbo].[ROLXMENU] CHECK CONSTRAINT [fk_rolxmenu_menu]
GO
ALTER TABLE [dbo].[ROLXMENU]  WITH CHECK ADD  CONSTRAINT [fk_rolxmenu_rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([Id])
GO
ALTER TABLE [dbo].[ROLXMENU] CHECK CONSTRAINT [fk_rolxmenu_rol]
GO
ALTER TABLE [dbo].[SUCURSAL]  WITH CHECK ADD  CONSTRAINT [fk_sucursal_persona] FOREIGN KEY([IdResponsable])
REFERENCES [dbo].[PERSONAL] ([Id])
GO
ALTER TABLE [dbo].[SUCURSAL] CHECK CONSTRAINT [fk_sucursal_persona]
GO
/****** Object:  StoredProcedure [dbo].[sp_AsignarResponsable]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AsignarResponsable]
(
	@pIdPersonal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION	
			DECLARE @idSucursal INT = 0
			SELECT 
				@idSucursal = SUC.Id 
			FROM PERSONAL PER
			INNER JOIN ASIGNACIONPERSONAL ASI ON ASI.IdPersonal = PER.Id
			INNER JOIN SUCURSAL SUC ON SUC.Id = ASI.IdSucursal

			IF @idSucursal IS NOT NULL
				BEGIN
					UPDATE SUCURSAL SET IdResponsable = @pIdPersonal WHERE Id = @idSucursal

					SET @codigo = 'OK';
					SET @msj = 'Se registró el encargado de forma satisfactoria.';
				END
			ELSE 
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'No se encontro sede del personal.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarPersonal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EditarPersonal]
(
	@pId INT,
	@pnombre VARCHAR(250),
	@papellidoPaterno VARCHAR(250),
	@papellidoMaterno VARCHAR(250),
	@ptelefono VARCHAR(20),
	@pcorreo VARCHAR(250),
	@pidRol INT,
	@pidSucursal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @UsuarioCorreo INT

			SELECT @UsuarioCorreo = COUNT(Id) FROM PERSONAL WHERE Correo = @pcorreo AND Id <> @pId

			IF(@UsuarioCorreo != 0)
				BEGIN
					SET @codigo = 'E2';
					SET @msj = 'Correo existente.';
				END
			ELSE
				BEGIN
					UPDATE PERSONAL 
						SET Nombre = @pnombre, 
							ApellidoPaterno = @papellidoPaterno,
							ApellidoMaterno = @papellidoMaterno,
							Telefono = @ptelefono,
							Correo = @pcorreo, 
							IdRol = @pidRol
					WHERE Id = @pId
					
					DELETE FROM ASIGNACIONPERSONAL WHERE IdPersonal = @pId

					INSERT INTO ASIGNACIONPERSONAL(IdSucursal, IdPersonal) VALUES (@pidSucursal, @pId)

					SET @codigo = 'OK';
					SET @msj = 'Se registró el personal de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarRol]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EditarRol]
(
	@pId INT,
	@pnombre VARCHAR(250),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @RolExistente INT

			SELECT @RolExistente = COUNT(Id) FROM ROL WHERE Nombre = @pnombre

			IF(@RolExistente != 0)
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'Nombre de Rol existente.';
				END
			ELSE
				BEGIN
					UPDATE ROL SET Nombre = @pnombre WHERE Id = @pId
					SET @codigo = 'OK';
					SET @msj = 'Se edito el Rol de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_IniciarSesion]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_IniciarSesion]
(
	@pemail VARCHAR(250),
	@pclave VARCHAR(MAX)
)
AS
BEGIN
	SELECT 
		USU.Id AS [ID],
		CodigoPersonal AS [CODIGO_PERSONAL],
		USU.Nombre AS [NOMBRE],
		USU.ApellidoPaterno AS [APELLIDO_PATERNO],
		USU.ApellidoMaterno AS [APELLIDO_MATERNO],
		ROL.Id AS [ID_ROL],
		ROL.Nombre AS [NOMBRE_ROL]
	FROM PERSONAL USU
	LEFT JOIN Rol ROL ON ROL.Id = USU.IdRol
	WHERE 
		USU.Correo = @pemail 
		AND USU.Clave = @pclave 
		AND USU.Estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerMenu]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ObtenerMenu]
(
	@pIdRol INT,
	@pIdUsuario INT
)
AS
BEGIN
	DECLARE @UsuarioCorrecto INT = 0;
	SELECT 
		@UsuarioCorrecto = COUNT(Id) 
	FROM PERSONAL
	WHERE Id = @pIdUsuario AND IdRol = @pIdRol

	IF(@UsuarioCorrecto <> 0)
	BEGIN
		SELECT 
			MENU.Id AS [ID],
			MENU.Nombre AS [NOMBRE], 
			MENU.Ruta AS [RUTA],
			MENU.MenuPadre AS [ID_PADRE],
			MENU.Orden AS [ORDEN],
			MENU.Icono AS [ICONO]
		FROM ROL ROL
		INNER JOIN ROLXMENU ROLXMENU ON ROLXMENU.IdRol = ROL.Id
		INNER JOIN MENU MENU ON MENU.Id = ROLXMENU.IdMenu
		WHERE ROL.Id = @pIdRol
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerMenuRol]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ObtenerMenuRol]
(
	@pIdRol INT
)
AS
BEGIN
	SELECT 
	MENU.Id AS [ID],
	MENU.Nombre AS [NOMBRE],
	MENU.MenuPadre AS [PADRE],
	(CASE 
		WHEN PERMI.Id IS NULL 
		THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT)
	END) AS [PERMISO]
	FROM MENU MENU
	LEFT JOIN ROLXMENU PERMI 
		ON PERMI.IdMenu = MENU.Id AND PERMI.IdRol = @pIdRol
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarCategoria]
(
	@pnombre VARCHAR(100),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO CATEGORIA(Nombre, Estado)
			VALUES(@pnombre, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró la caetgoria de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMediosPago]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarMediosPago]
(
	@ptermino VARCHAR(100),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO MEDIOPAGO(Nombre, Estado)
			VALUES(@ptermino, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró el medio de pago de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMesa]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarMesa]
(
	@pnumero VARCHAR(2),
	@pcapacidad INT,
	@pidPiso INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO MESA(Numero, Capacidad, IdPiso, Estado)
			VALUES(@pnumero, @pcapacidad, @pidPiso, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró la mesa de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarPiso]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarPiso]
(
	@pnombre VARCHAR(250),
	@pcapacidadCliente INT,
	@pcapacidadEmpleado INT,
	@pidSucursal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO PISO(Nombre, CapacidadClientes, CapacidadEmpleados, IdSucural, Estado)
			VALUES(@pnombre, @pcapacidadCliente, @pcapacidadEmpleado, @pidSucursal, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró el piso de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarPlato]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarPlato]
(
	@pnombre VARCHAR(100),
	@pidCategoria INT,
	@pFecha DATETIME,
	@pPrecio DECIMAL(4,2),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			DECLARE @idNuevo INT
			
			INSERT INTO PLATO(Nombre, IdCategoria ,Estado)
			VALUES(@pnombre, @pidCategoria, 1)

			SET @idNuevo = SCOPE_IDENTITY()

			UPDATE PRECIO SET Estado = 0 WHERE IdPlato = @idNuevo

			INSERT INTO PRECIO(Monto, Fecha, Estado, IdPlato) VALUES (@pPrecio, @pFecha, 1, @idNuevo)

			SET @codigo = 'OK';
			SET @msj = 'Se registró el plato de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarRol]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarRol]
(
	@pnombre VARCHAR(250),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @RolExistente INT

			SELECT @RolExistente = COUNT(Id) FROM ROL WHERE Nombre = @pnombre

			IF(@RolExistente != 0)
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'Nombre de Rol existente.';
				END
			ELSE
				BEGIN
					INSERT INTO ROL(Nombre, Estado)
					VALUES(@pnombre, 1)
					SET @codigo = 'OK';
					SET @msj = 'Se registró el rol de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarSucursal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarSucursal]
(
	@pnombre VARCHAR(250),
	@pdireccion VARCHAR(MAX),
	@ptelefono VARCHAR(20),
	--@pidEncargado INT,
	@pfechaEntrada TIME,
	@pfechaSalida TIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @codigoSucursal VARCHAR(3) = ''
			SELECT TOP 1 @codigoSucursal = (Id + 1) FROM PERSONAL ORDER BY ID DESC
			INSERT INTO SUCURSAL(
					CodigoSuc, Nombre, Direccion, 
					Telefono, 
					--IdResponsable, 
					HoraEntrada, HoraSalida, Estado)
			VALUES(RIGHT(REPLICATE('0', 3) + @codigoSucursal, 3), @pnombre, @pdireccion,
					@ptelefono, 
					--@pidEncargado,
					@pfechaEntrada, @pfechaSalida, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró la sucursal de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarUsuario]
(
	@ptipoDocumento VARCHAR(10),
	@pnumeroDocumento VARCHAR(20),
	@pnombre VARCHAR(250),
	@papellidoPaterno VARCHAR(250),
	@papellidoMaterno VARCHAR(250),
	@ptelefono VARCHAR(20),
	@pcorreo VARCHAR(250),
	@pclave VARCHAR(MAX),
	@pidRol INT,
	@pidSucursal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @UsuarioCorreo INT, 
					@UsuarioNumeroDocumento INT

			SELECT @UsuarioCorreo = COUNT(Id) FROM PERSONAL WHERE Correo = @pcorreo
			SELECT @UsuarioNumeroDocumento = COUNT(Id) FROM PERSONAL WHERE NumeroDocumento = @pnumeroDocumento

			IF(@UsuarioNumeroDocumento != 0)
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'Numero documento existente.';
				END
			ELSE IF(@UsuarioCorreo != 0)
				BEGIN
					SET @codigo = 'E2';
					SET @msj = 'Correo existente.';
				END
			ELSE
				BEGIN
					DECLARE @codigoPersonal VARCHAR(10) = '', @idNuevo INT = 0
					SELECT TOP 1 @codigoPersonal = (Id + 1) FROM PERSONAL ORDER BY ID DESC
					INSERT INTO PERSONAL(
							CodigoPersonal, TipoDocumento, NumeroDocumento, 
							Nombre, ApellidoPaterno, 
							ApellidoMaterno, Telefono, 
							Correo, Clave, Estado, IdRol)
					VALUES(RIGHT(REPLICATE('0', 10) + @codigoPersonal, 10), @ptipoDocumento, @pnumeroDocumento,
							@pnombre, @papellidoPaterno, 
							@papellidoMaterno, @ptelefono,
							@pcorreo, @pclave, 'A', @pidRol)

					SET @idNuevo = SCOPE_IDENTITY();
					
					INSERT INTO ASIGNACIONPERSONAL(IdSucursal, IdPersonal) VALUES (@pidSucursal, @idNuevo)

					SET @codigo = 'OK';
					SET @msj = 'Se registró el personal de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarPermiso]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ActualizarPermiso]
(
	@pIdPermiso BIT,
	@pIdMenu INT,
	@pIdRol INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF(@pIdPermiso = 0)
			BEGIN 
				INSERT INTO ROLXMENU(IdMenu, IdRol) VALUES(@pIdMenu, @pIdRol)
				SET @codigo = 'OK';
				SET @msj = 'Permiso otorgado.';
			END
			ELSE
			BEGIN
				DELETE FROM ROLXMENU WHERE IdMenu = @pIdMenu AND IdRol = @pIdRol
				SET @codigo = 'OK';
				SET @msj = 'Permiso removido.';
			END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarCategoria]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarCategoria]
(
	@pId INT,
	@pnombre VARCHAR(100),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE CATEGORIA SET 
				Nombre = @pnombre
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito la categoria de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarCliente]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarCliente]
(
	@pid INT,
	@ptipoDocumento VARCHAR(1),
	@pnumeroDocumento VARCHAR(30),
	@pnombre VARCHAR(100),
	@papellidoPaterno VARCHAR(200),
	@papellidoMaterno VARCHAR(200),
	@pruc VARCHAR(100),
	@prazonSocial VARCHAR(2000),
	@pdireccion VARCHAR(2000),
	@pdireccionEntrega VARCHAR(3000),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @countClientes INT;
			SELECT @countClientes = COUNT(*) FROM CLIENTE WHERE TipoDocumento = @ptipoDocumento AND NumeroDocumento = @pnumeroDocumento AND Id <> @pid

			IF(@countClientes > 0)
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'Numero de documento de cliente ya se encuentra registrado.';
				END
			ELSE
				BEGIN
					UPDATE CLIENTE 
						SET Nombre = @pnombre,
							ApellidoPaterno = @papellidoPaterno,
							ApellidoMaterno = @papellidoMaterno, 
							Ruc = @pruc, 
							RazonSocial = @prazonSocial, 
							Dirreccion = @pdireccion, 
							DirreccionEntrega = @pdireccionEntrega
					WHERE Id = @pid

					SET @codigo = 'OK';
					SET @msj = 'Se edito el cliente de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarMediosPago]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarMediosPago]
(
	@pId INT,
	@pnombre VARCHAR(200),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE MEDIOPAGO SET 
				Nombre = @pnombre
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito el medio de pago de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarMesa]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarMesa]
(
	@pId INT,
	@pnumero VARCHAR(2),
	@pcapacidad INT,
	@pidPiso INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE MESA SET 
				Numero = @pnumero, 
				Capacidad = @pcapacidad,
				IdPiso = @pidPiso
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito el piso de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarPedido]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarPedido]
(
	@pidPedido INT,
	@pidCliente INT,
	@pdetPedidos XML,

	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE PEDIDO 
				SET IdCliente = @pidCliente
			WHERE Id = @pidPedido

			DELETE FROM DETALLEPEDIDO WHERE IdPedido = @pidPedido

			INSERT INTO DETALLEPEDIDO(Cantidad, PrecioUnitario, IdPato, IdPedido, Comentario)
			SELECT
				Detalles.value('(cantidad)[1]', 'INT') AS cantidad,
				PRE.Monto AS monto,
				Detalles.value('(idPlato)[1]', 'INT') AS idPlato,
				@pidPedido,
				Detalles.value('(comentario)[1]', 'VARCHAR(MAX)') AS comentario
			FROM 
				@pdetPedidos.nodes('/detalles/detalle') AS X(Detalles)
				INNER JOIN PRECIO PRE ON PRE.IdPlato = Detalles.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

			SET @codigo = 'OK';
			SET @msj = 'Se editó el pedido de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarPiso]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarPiso]
(
	@pId INT,
	@pnombre VARCHAR(250),
	@pcapacidadCliente INT,
	@pcapacidadEmpleado INT,
	@pidSucursal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PISO SET 
				Nombre = @pNombre, 
				CapacidadClientes = @pcapacidadCliente,
				CapacidadEmpleados = @pcapacidadEmpleado,
				IdSucural = @pidSucursal
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito el piso de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarPlato]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarPlato]
(
	@pId INT,
	@pnombre VARCHAR(100),
	@pidCategoria INT,
	@pPrecio DECIMAL(4,2),
	@pFecha DATETIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PLATO SET 
				Nombre = @pnombre,
				IdCategoria = @pidCategoria
			WHERE Id = @pId

			UPDATE PRECIO SET Estado = 0 WHERE IdPlato = @pId

			INSERT INTO PRECIO(Monto, Fecha, Estado, IdPlato) VALUES (@pPrecio, @pFecha, 1, @pId)

			SET @codigo = 'OK';
			SET @msj = 'Se edito el plato de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
		ROLLBACK TRANSACTION;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EditarSucursal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EditarSucursal]
(
	@pId INT,
	@pNombre VARCHAR(250),
	@pDireccion VARCHAR(MAX),
	@pTelefono VARCHAR(20),
	@pHoraIngreso TIME,
	@pHoraSalida TIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE SUCURSAL SET 
				Nombre = @pNombre, 
				Direccion = @pDireccion, 
				Telefono = @pTelefono,
				HoraEntrada = @pHoraIngreso,
				HoraSalida = @pHoraSalida
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito la sucursal de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCategoria]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarCategoria]
(
	@pIdCategoria INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE CATEGORIA 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					) 
			WHERE Id = @pIdCategoria

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado de la categoria de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarMediosPago]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarMediosPago]
(
	@pIdMedioPago INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE MEDIOPAGO 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					) 
			WHERE Id = @pIdMedioPago

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del medio de pago de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarMesa]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarMesa]
(
	@pIdMesa INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE MESA 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					) 
			WHERE Id = @pIdMesa

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado de la mesa de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarPedido]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarPedido]
(
	@pIdPedido INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PEDIDO 
				SET Estado = 'A'
			WHERE Id = @pIdPedido

			SET @codigo = 'OK';
			SET @msj = 'Se cancelo el pedido de manera satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarPersonal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarPersonal]
(
	@pId INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PERSONAL 
				SET Estado = (
					CASE Estado
					WHEN 'I' THEN 'A'
					ELSE 'I' END
					) 
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del personal de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarPiso]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarPiso]
(
	@pIdPiso INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE PISO 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					) 
			WHERE Id = @pIdPiso

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del Piso de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarPlato]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarPlato]
(
	@pIdPlato INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PLATO 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					) 
			WHERE Id = @pIdPlato

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del Plato de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarRol]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarRol]
(
	@pId INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE ROL 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					)
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del rol de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
		ROLLBACK TRANSACTION;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarSucursal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarSucursal]
(
	@pIdSucursal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE SUCURSAL 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					) 
			WHERE Id = @pIdSucursal

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado de la sucursal de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_LimpiarMesa]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LimpiarMesa]
(
	@pidMesa INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			UPDATE PEDIDO SET Estado = 'T' WHERE IdMesa = @pidMesa
			SET @codigo = 'OK';
			SET @msj = 'Mesa lista para atención!';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCategoria]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerCategoria]
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT 
		CAT.Id AS [ID],
		CAT.Nombre AS [NOMBRE],
		(CASE CAT.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM CATEGORIA CAT
	WHERE 
		CAT.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCliente]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerCliente]
(
	@pNumeroDocumento VARCHAR(30)
)
AS
BEGIN
	SELECT 
		CLIE.Id AS [ID],
		CONCAT(CLIE.Nombre, ' ' , CLIE.ApellidoPaterno, ' ' , CLIE.ApellidoMaterno) AS [NOMBRE]
	FROM CLIENTE CLIE
	WHERE 
		CLIE.NumeroDocumento = @pNumeroDocumento
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetallePedido]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerDetallePedido]
(
	@pidPedido INT
)
AS
BEGIN
	SELECT 
		DET_PED.IdPato AS [ID_PLATO],
		PLAT.Nombre AS [PLATO],
		DET_PED.Cantidad AS [CANTIDAD],
		DET_PED.Comentario AS [COMENTARIO]
	FROM 
	PEDIDO PEDI 
	LEFT JOIN DETALLEPEDIDO DET_PED ON DET_PED.IdPedido = PEDI.Id
	LEFT JOIN PLATO PLAT ON PLAT.Id = DET_PED.IdPato
	WHERE PEDI.Id = @pidPedido
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMediosPago]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMediosPago]
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT 
		MEDIO.Id AS [ID],
		MEDIO.Nombre AS [NOMBRE],
		(CASE MEDIO.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM MEDIOPAGO MEDIO
	WHERE 
		MEDIO.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMediosPagoMenu]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMediosPagoMenu]
AS
BEGIN
	SELECT 
		MEDIO.Id AS [ID],
		MEDIO.Nombre AS [NOMBRE]
	FROM MEDIOPAGO MEDIO
	WHERE 
		MEDIO.Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMenuCategoria]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMenuCategoria]
AS
BEGIN
	SELECT 
		CAT.Id AS [ID],
		CAT.Nombre AS [NOMBRE]
	FROM CATEGORIA CAT
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMenuPersonal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMenuPersonal]
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT TOP 5
		PERS.Id AS [ID],
		CONCAT(PERS.Nombre, ' ', PERS.ApellidoPaterno, ' ', PERS.ApellidoMaterno) AS [NOMBRE]
	FROM PERSONAL PERS
	WHERE 
		CONCAT(PERS.Nombre, ' ', PERS.ApellidoPaterno, ' ', PERS.ApellidoMaterno) LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMenuPlato]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMenuPlato]
(
	@pidCategoria INT
)
AS
BEGIN
	SELECT 
		PLAT.Id AS [ID],
		PLAT.Nombre AS [NOMBRE]
	FROM PLATO PLAT
	WHERE 
		PLAT.IdCategoria = @pidCategoria
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMenuRol]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMenuRol]
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT TOP 5
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE]
	FROM ROL ROL
	WHERE 
		(ROL.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMenuSucursal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMenuSucursal]
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT
		SUCU.Id AS [ID],
		SUCU.Nombre AS [NOMBRE]
	FROM SUCURSAL SUCU
	WHERE 
		SUCU.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMesa]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMesa]
(
	@pTermino VARCHAR(10),
	@pIdSucursal INT,
	@pIdPiso INT
)
AS
BEGIN
	SELECT 
		MESA.Id AS [ID],
		MESA.Numero AS [NUMERO],
		MESA.Capacidad AS [CAPACIDAD],
		PISO.Nombre AS [PISO],
		SUCU.Nombre AS [SUCURSAL],
		(CASE MESA.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM MESA MESA
	LEFT JOIN PISO PISO ON PISO.Id = MESA.IdPiso
	LEFT JOIN SUCURSAL SUCU ON SUCU.Id = PISO.IdSucural
	WHERE 
		(PISO.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND
		(PISO.IdSucural = @pIdSucursal OR 
		(@pIdSucursal IS NULL OR @pIdSucursal = 0)) AND
		(MESA.IdPiso = @pIdPiso OR 
		(@pIdPiso IS NULL OR @pIdPiso = 0))
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMesaPorPersonal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerMesaPorPersonal]
(
	@pidPiso INT
)
AS
BEGIN
	SELECT 
		MESA.Id AS [ID],
		MESA.Numero AS [NUMERO],
		(CASE 
			WHEN PEDI.Id IS NULL THEN 0
			WHEN PEDI.Id IS NOT NULL THEN 
				(CASE PEDI.Estado
						WHEN 'I' THEN 1 --INICIADO
						WHEN 'P' THEN 2 --PENDIENTTE
						WHEN 'A' THEN 2 --ANULADO
						WHEN 'T' THEN 3 --TERMINADO
				END)
		END) AS [ESTADO]
	FROM MESA MESA
	LEFT JOIN PEDIDO PEDI ON PEDI.IdMesa = MESA.Id AND PEDI.Estado IN ('I', 'P')
	LEFT JOIN PISO PISO ON PISO.Id = MESA.IdPiso 
	WHERE PISO.Id = @pidPiso
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPedidoPorMesa]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerPedidoPorMesa]
(
	@pidMesa INT
)
AS
BEGIN
	SELECT 
		PEDI.Id AS [ID],
		PEDI.NumeroSerie AS [SERIE],
		PEDI.NumeroCorrelativo AS [CORRELATIVO],
		CLI.Id AS [CLIENTE_ID],
		CLI.NumeroDocumento AS [NUMERO_DOCUMENTO],
		CLI.Nombre AS [NOMBRE_CLIENTE],
		CLI.ApellidoPaterno AS [APELLIDO_PATERNO_CLIENTE],
		CLI.ApellidoMaterno AS [APELLIDO_MATERNO_CLIENTE],
		CLI.Ruc AS [RUC],
		CLI.RazonSocial AS [RAZON_SOCIAL],
		(CASE PEDI.Estado
						WHEN 'I' THEN 1 --INICIADO
						WHEN 'P' THEN 2 --PENDIENTTE
						WHEN 'A' THEN 2 --ANULADO
				END) AS [ESTADO]
	FROM 
	PEDIDO PEDI 
	LEFT JOIN MESA MES ON MES.Id = PEDI.IdMesa 
	LEFT JOIN CLIENTE CLI ON CLI.Id = PEDI.IdCliente
	WHERE PEDI.IdMesa = @pidMesa AND PEDI.Estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPersonal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerPersonal]
(
	@pNumeroPersonal VARCHAR(10),
	@pNumeroDocumento VARCHAR(20),
	@pNombre VARCHAR(10),
	@pRol INT
)
AS
BEGIN
	SELECT 
		PER.Id AS [ID],
		(CASE PER.TipoDocumento
			WHEN '01' THEN 'DNI' 
			WHEN '02' THEN 'CARNET DE EXTRANJERIA'
			WHEN '03' THEN 'PARTIDA DE NACIMIENTO'
			WHEN '04' THEN 'PASAPORTE' END) AS [TIPO_DOCUMENTO],
		PER.NumeroDocumento AS [NUMERO_DOCUMENTO],
		CONCAT(PER.Nombre,' ', PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [NOMBRE],
		PER.Telefono AS [TELEFONO],
		PER.Correo AS [CORREO],
		(
			CASE PER.Estado
				WHEN 'A' THEN 'ACTIVO'
				WHEN 'I' THEN 'INACTIVO'
			END
		) AS [ESTADO],
		ROL.Nombre AS [ROL],
		SUC.Nombre AS [SUCURSAL]
	FROM PERSONAL PER
	LEFT JOIN ROL ROL ON ROL.Id = PER.IdRol
	LEFT JOIN ASIGNACIONPERSONAL ASI ON ASI.IdPersonal = PER.Id
	LEFT JOIN SUCURSAL SUC ON SUC.Id = ASI.IdSucursal
	WHERE 
		(PER.Nombre LIKE CONCAT('%', @pNombre,'%') OR 
		(@pNombre IS NULL OR @pNombre = '')) AND
		(PER.CodigoPersonal LIKE CONCAT(@pNumeroPersonal,'%') OR 
		(@pNumeroPersonal IS NULL OR @pNumeroPersonal = '')) AND
		(PER.NumeroDocumento LIKE CONCAT(@pNumeroDocumento,'%') OR 
		(@pNumeroDocumento IS NULL OR @pNumeroDocumento = '')) AND
		(PER.IdRol LIKE CONCAT(@pRol,'%') OR 
		(@pRol IS NULL OR @pRol = ''))

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPiso]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerPiso]
(
	@pTermino VARCHAR(10),
	@pIdSucursal INT
)
AS
BEGIN
	SELECT 
		PISO.Id AS [ID],
		PISO.Nombre AS [NOMBRE],
		PISO.CapacidadClientes AS [CLIENTES],
		PISO.CapacidadEmpleados AS [EMPLEADOS],
		SUCU.Nombre AS [SUCURSAL],
		(CASE PISO.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM PISO PISO
	LEFT JOIN SUCURSAL SUCU ON SUCU.Id = PISO.IdSucural
	WHERE 
		(PISO.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND
		(PISO.IdSucural = @pIdSucursal OR 
		(@pIdSucursal IS NULL OR @pIdSucursal = 0))
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPlato]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerPlato]
(
	@pTermino VARCHAR(10),
	@pIdCategoria INT
)
AS
BEGIN
	SELECT 
		PLAT.Id AS [ID],
		PLAT.Nombre AS [NOMBRE],
		CAT.Nombre AS [CATEGORIA],
		PRE.Monto AS [PRECIO],
		(CASE PLAT.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM PLATO PLAT
	LEFT JOIN CATEGORIA CAT ON CAT.Id = PLAT.IdCategoria
	LEFT JOIN PRECIO PRE ON PRE.IdPlato = PLAT.Id AND PRE.Estado = 1
	WHERE 
		(PLAT.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND
		(CAT.Id =  @pIdCategoria OR
		(@pIdCategoria IS NULL OR @pIdCategoria = ''))
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerRol]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerRol]
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE],
		(
			CASE ROL.Estado 
				WHEN 1 THEN 'ACTIVO'
				ELSE 'INACTIVO' END
		) AS [ESTADO]
	FROM ROL ROL
	WHERE 
		ROL.Nombre LIKE CONCAT(@pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerSucursales]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ObtenerSucursales]
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT 
		SUC.Id AS [ID],
		SUC.CodigoSuc AS [CODIGO_SUCURSAL],
		SUC.Nombre AS [NOMBRE],
		SUC.Direccion AS [DIRECCION],
		SUC.Telefono AS [TELEFONO],
		SUC.HoraEntrada AS [HORA_ENTRADA],
		SUC.HoraSalida AS [HORA_SALIDA],
		(CASE SUC.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO],
		CONCAT(PER.Nombre, ' ' , PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [RESPONSABLE]
	FROM SUCURSAL SUC
	LEFT JOIN PERSONAL PER ON PER.Id = SUC.IdResponsable
	WHERE 
		SUC.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PagarPedido]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_PagarPedido]
(
	@pidPedido INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			UPDATE PEDIDO SET Estado = 'P' WHERE Id = @pidPedido
			SET @codigo = 'OK';
			SET @msj = 'Mesa lista para atención!';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCliente]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarCliente]
(
	@ptipoDocumento VARCHAR(1),
	@pnumeroDocumento VARCHAR(30),
	@pnombre VARCHAR(100),
	@papellidoPaterno VARCHAR(200),
	@papellidoMaterno VARCHAR(200),
	@pruc VARCHAR(100),
	@prazonSocial VARCHAR(2000),
	@pdireccion VARCHAR(2000),
	@pdireccionEntrega VARCHAR(3000),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @countClientes INT;
			SELECT @countClientes = COUNT(*) FROM CLIENTE WHERE TipoDocumento = @ptipoDocumento AND NumeroDocumento = @pnumeroDocumento

			IF(@countClientes > 0)
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'Numero de documento de cliente ya se encuentra registrado.';
				END
			ELSE
				BEGIN
					INSERT INTO CLIENTE(TipoDocumento, NumeroDocumento, Nombre, ApellidoPaterno, ApellidoMaterno, Ruc, RazonSocial, Dirreccion, DirreccionEntrega)
					VALUES(@ptipoDocumento, @pnumeroDocumento, @pnombre, @papellidoPaterno, @papellidoMaterno, @pruc, @prazonSocial, @pdireccion, @pdireccionEntrega)

					SET @codigo = 'OK';
					SET @msj = 'Se registró el cliente de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarPedido]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarPedido]
(
	@pidCliente INT,
	@pidMesa INT,
	@pidPersonal INT,
	@pdetPedidos XML,

	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @correlativo VARCHAR(20), @correlativoNum INT, 
					@serie VARCHAR(3),	@serieNum INT

			SELECT TOP 1 
				@correlativo = NumeroCorrelativo
			FROM PEDIDO ORDER BY Id DESC

			SET @correlativo = COALESCE(@correlativo, '0')

			SELECT
				@serieNum = SUC.Id
			FROM PERSONAL PER
			INNER JOIN ASIGNACIONPERSONAL ASIG ON ASIG.IdPersonal = PER.Id
			INNER JOIN SUCURSAL SUC ON SUC.Id = ASIG.IdSucursal
			WHERE PER.Id = @pidPersonal

			SET @correlativoNum = CAST(@correlativo AS INT) + 1

			SET @correlativo = RIGHT(REPLICATE('0', 9) + CAST(@correlativoNum AS VARCHAR), 9)
			SET @serie = RIGHT(REPLICATE('0', 3) + CAST(@serieNum AS VARCHAR), 3)

			DECLARE @idPedidoNuevo INT

			INSERT INTO PEDIDO(NumeroSerie, NumeroCorrelativo, TipoPedido, IdCliente, IdMesa, IdPersonal, Estado)
			VALUES(@serie, @correlativo, 'M', @pidCliente, @pidMesa, @pidPersonal, 'I')

			SET @idPedidoNuevo = SCOPE_IDENTITY();

			INSERT INTO DETALLEPEDIDO(Cantidad, PrecioUnitario, IdPato, IdPedido, Comentario)
			SELECT
				Detalles.value('(cantidad)[1]', 'INT') AS cantidad,
				PRE.Monto AS monto,
				Detalles.value('(idPlato)[1]', 'INT') AS idPlato,
				@idPedidoNuevo,
				Detalles.value('(comentario)[1]', 'VARCHAR(MAX)') AS comentario
			FROM 
				@pdetPedidos.nodes('/detalles/detalle') AS X(Detalles)
				INNER JOIN PRECIO PRE ON PRE.IdPlato = Detalles.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

			SET @codigo = 'OK';
			SET @msj = 'Se registró el pedido de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarPedidoDivido]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarPedidoDivido]
(
	@pidPedido INT,
	@pidMedioPago INT,
	@pdetPedido XML,
	@pdetSubpedidos XML,

	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @idPersonal INT, @idCliente INT, @idMesa INT;

			SELECT 
				@idPersonal = IdPersonal,
				@idCliente = IdCliente,
				@idMesa = IdMesa
			FROM PEDIDO WHERE Id = @pidPedido

			DELETE FROM DETALLEPEDIDO WHERE IdPedido = @pidPedido

			INSERT INTO DETALLEPEDIDO(Cantidad, PrecioUnitario, IdPato, IdPedido)
			SELECT
				Detalles.value('(cantidad)[1]', 'INT') AS cantidad,
				PRE.Monto AS monto,
				Detalles.value('(idPlato)[1]', 'INT') AS idPlato,
				@pidPedido
			FROM 
				@pdetPedido.nodes('/detalles/detalle') AS X(Detalles)
				INNER JOIN PRECIO PRE ON PRE.IdPlato = Detalles.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

			UPDATE PEDIDO SET 
					Estado = 'P',
					IdMedioPago = @pidMedioPago 
			WHERE Id = @pidPedido


			DECLARE @correlativo VARCHAR(20), @correlativoNum INT, 
					@serie VARCHAR(3), @serieNum INT

			SELECT TOP 1 
				@correlativo = NumeroCorrelativo
			FROM PEDIDO ORDER BY Id DESC

			SET @correlativo = COALESCE(@correlativo, '0')

			SELECT
				@serieNum = SUC.Id
			FROM PERSONAL PER
			INNER JOIN ASIGNACIONPERSONAL ASIG ON ASIG.IdPersonal = PER.Id
			INNER JOIN SUCURSAL SUC ON SUC.Id = ASIG.IdSucursal
			WHERE PER.Id = @idPersonal

			--Subcuentas
			DECLARE @IdPedidoSubCuenta INT, @idClienteSubcuenta INT, @idMedioPago INT, @subcuentas XML

			DECLARE cliente_cursor CURSOR FOR
				SELECT info.value('(idCliente)[1]', 'INT') AS IdCliente,
						info.value('(idMedioPago)[1]', 'INT') AS IdMedioPago,
					   info.query('detallesSubcuenta') AS DetallesSubcuenta
				FROM @pdetSubpedidos.nodes('/pedido/informacion') AS T(info);

			OPEN cliente_cursor;

			FETCH NEXT FROM cliente_cursor INTO @idClienteSubcuenta, @idMedioPago, @subcuentas;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @correlativoNum = CAST(@correlativo AS INT) + 1
				
				SET @correlativo = RIGHT(REPLICATE('0', 9) + CAST(@correlativoNum AS VARCHAR), 9)
				SET @serie = RIGHT(REPLICATE('0', 3) + CAST(@serieNum AS VARCHAR), 3)

				INSERT INTO PEDIDO(NumeroSerie, NumeroCorrelativo, TipoPedido, IdCliente, IdMedioPago, IdMesa, IdPersonal, Estado)
				VALUES(@serie, @correlativo, 'M', @idClienteSubcuenta, @idMedioPago, @idMesa, @idPersonal, 'T')

				SET @IdPedidoSubCuenta = SCOPE_IDENTITY();

				INSERT INTO DetallePedido (IdPedido, IdPato, Cantidad, PrecioUnitario)
				SELECT
					@IdPedidoSubCuenta,
					detalle.value('(idPlato)[1]', 'INT') AS IdPlato,
					detalle.value('(cantidad)[1]', 'INT') AS Cantidad,
					PRE.Monto AS monto
				FROM 
					@subcuentas.nodes('detallesSubcuenta/detalleSubcuenta') AS D(detalle)
					INNER JOIN PRECIO PRE ON PRE.IdPlato = detalle.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

				FETCH NEXT FROM cliente_cursor INTO @idClienteSubcuenta, @idMedioPago, @subcuentas;
			END

			CLOSE cliente_cursor;
			DEALLOCATE cliente_cursor;

			SET @codigo = 'OK';
			SET @msj = 'Se registró el pedido de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerCategoria]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerCategoria]
(
	@pid INT
)
AS
BEGIN
	SELECT 
		CAT.Id AS [ID],
		CAT.Nombre AS [NOMBRE]
	FROM CATEGORIA CAT
	WHERE CAT.Id = @pid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerCliente]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerCliente]
(
	@pid INT
)
AS
BEGIN
	SELECT 
		CLIE.Id AS [ID],
		CLIE.TipoDocumento AS [TIPO_DOCUMENTO],
		CLIE.NumeroDocumento AS [NUMERO_DOCUMENTO],
		CLIE.Nombre AS [NOMBRE],
		CLIE.ApellidoPaterno AS [APELLIDO_PATERNO],
		CLIE.ApellidoMaterno AS [APELLIDO_MATERNO],
		CLIE.Ruc AS [RUC],
		CLIE.RazonSocial AS [RAZON_SOCIAL],
		CLIE.Dirreccion AS [DIRECCION],
		CLIE.DirreccionEntrega AS [DIRECCION_ENTREGA]
	FROM CLIENTE CLIE
	WHERE 
		CLIE.Id = @pid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerDetallePedidoParaPagar]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerDetallePedidoParaPagar]
(
	@pidPedido INT
)
AS
BEGIN
	SELECT 
		PEDI.Id AS [ID],

		PEDI.NumeroSerie AS [SERIE],
		PEDI.NumeroCorrelativo AS [CORRELATIVO],

		CONCAT(CLI.NumeroDocumento, ' - ', CLI.Nombre, ' ', CLI.ApellidoPaterno, ' ', CLI.ApellidoMaterno) AS [CLIENTE_NATURAL],
		CONCAT(CLI.Ruc, ' - ', CLI.RazonSocial) AS [CLIENTE_JURIDICO],
		PER.Id AS [ID_PERSONAL],
		CONCAT(PER.Nombre, ' ', PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [PERSONAL],
		MES.Id AS [ID_MESA],
		MES.Numero AS [MESA]
	FROM 
	PEDIDO PEDI 
	LEFT JOIN MESA MES ON MES.Id = PEDI.IdMesa 
	LEFT JOIN CLIENTE CLI ON CLI.Id = PEDI.IdCliente
	LEFT JOIN PERSONAL PER ON PER.Id = PEDI.IdPersonal
	WHERE PEDI.Id = @pidPedido
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerDetallesPago]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerDetallesPago]
(
	@pidPedido INT
)
AS
BEGIN
	SELECT 
		DET_PED.Id AS [ID],
		PLAT.Id AS [ID_PLATO],
		PLAT.Nombre AS [PLATO],
		DET_PED.PrecioUnitario AS [PRECIO],
		DET_PED.Cantidad AS [CANTIDAD],
		(DET_PED.Cantidad*DET_PED.PrecioUnitario) AS [SUBTOTAL]
	FROM 
	DETALLEPEDIDO DET_PED
	LEFT JOIN PLATO PLAT ON PLAT.Id = DET_PED.IdPato
	WHERE DET_PED.IdPedido = @pidPedido
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerMediosPago]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerMediosPago]
(
	@pid INT
)
AS
BEGIN
	SELECT 
		MEDIO.Id AS [ID],
		MEDIO.Nombre AS [NOMBRE],
		(CASE MEDIO.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM MEDIOPAGO MEDIO
	WHERE MEDIO.Id = @pid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerMesa]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerMesa]
(
	@pid INT
)
AS
BEGIN
	SELECT 
		MESA.Id AS [ID],
		MESA.Numero AS [NUMERO],
		MESA.Capacidad AS [CAPACIDAD],
		PISO.Id AS [PISO],
		SUCU.Id AS [SUCURSAL],
		(CASE MESA.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM MESA MESA
	LEFT JOIN PISO PISO ON PISO.Id = MESA.IdPiso
	LEFT JOIN SUCURSAL SUCU ON SUCU.Id = PISO.IdSucural
	WHERE MESA.Id = @pid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerPersonal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerPersonal]
(
	@pId INT
)
AS
BEGIN
	SELECT 
		PER.Id AS [ID],
		PER.TipoDocumento AS [TIPO_DOCUMENTO],
		PER.NumeroDocumento AS [NUMERO_DOCUMENTO],
		PER.Nombre AS [NOMBRE],
		PER.ApellidoPaterno AS [APELLIDO_PATERNO],
		PER.ApellidoMaterno AS [APELLIDO_MATERNO],
		PER.Telefono AS [TELEFONO],
		PER.Correo AS [CORREO],
		(CASE PER.Estado
			WHEN 'A' THEN 'ACTIVO'
			WHEN 'I' THEN 'INACTIVO' END) AS [ESTADO],
		ROL.Id AS [ROL],
		SUC.Id AS [SUCURSAL]
	FROM PERSONAL PER
	LEFT JOIN ROL ROL ON ROL.Id = PER.IdRol
	LEFT JOIN ASIGNACIONPERSONAL ASI ON ASI.IdPersonal = PER.Id
	LEFT JOIN SUCURSAL SUC ON SUC.Id = ASI.IdSucursal
	WHERE 
		PER.Id LIKE @pId OR 
		(@pId IS NULL OR @pId = '')

END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerPiso]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerPiso]
(
	@pid INT
)
AS
BEGIN
	SELECT 
		PISO.Id AS [ID],
		PISO.Nombre AS [NOMBRE],
		PISO.CapacidadClientes AS [CLIENTES],
		PISO.CapacidadEmpleados AS [EMPLEADOS],
		PISO.IdSucural AS [ID_SUCURSAL],
		SUCU.Nombre AS [SUCURSAL]
	FROM PISO PISO
	LEFT JOIN SUCURSAL SUCU ON SUCU.Id = PISO.IdSucural
	WHERE PISO.Id = @pid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerPlato]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerPlato]
(
	@pid INT
)
AS
BEGIN
	SELECT 
		PLAT.Id AS [ID],
		PLAT.Nombre AS [NOMBRE],
		PLAT.IdCategoria AS [CATEGORIA],
		PRE.Monto AS [MONTO]
	FROM PLATO PLAT
	LEFT JOIN PRECIO PRE ON PRE.IdPlato = PLAT.Id AND PRE.Estado = 1
	WHERE 
		PLAT.Id =  @pid OR
		(@pid IS NULL OR @pid = '')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerRol]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerRol]
(
	@pId INT
)
AS
BEGIN
	SELECT TOP 5
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE]
	FROM ROL ROL
	WHERE 
		Id = @pId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_VerSucursal]    Script Date: 7/9/2025 3:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_VerSucursal]
(
	@pid INT
)
AS
BEGIN
	SELECT 
		SUC.Id AS [ID],
		SUC.CodigoSuc AS [CODIGO_SUCURSAL],
		SUC.Nombre AS [NOMBRE],
		SUC.Direccion AS [DIRECCION],
		SUC.Telefono AS [TELEFONO],
		SUC.HoraEntrada AS [HORA_ENTRADA],
		SUC.HoraSalida AS [HORA_SALIDA],
		SUC.Estado AS [ESTADO],
		SUC.IdResponsable AS [ID_RESPONSABLE],
		CONCAT(PER.Nombre, ' ' , PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [RESPONSABLE]
	FROM SUCURSAL SUC
	LEFT JOIN PERSONAL PER ON PER.Id = SUC.Id
	WHERE 
		SUC.Id = @pid OR 
		@pid IS NULL OR @pid = ''
END
GO
