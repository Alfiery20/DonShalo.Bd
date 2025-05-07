--USE master

--DROP DATABASE DonShalo

--CREATE DATABASE DonShalo

--USE DonShalo

CREATE TABLE ROL
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(100),
	CONSTRAINT pk_rol
		PRIMARY KEY (Id)
)

CREATE TABLE MENU
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(200),
	Ruta VARCHAR(MAX),
	Orden INT,
	MenuPadre INT,
	CONSTRAINT pk_menu
		PRIMARY KEY (Id),
	CONSTRAINT fk_menu_menuhijo
		FOREIGN KEY (Id)
		REFERENCES MENU(Id)
)


CREATE TABLE ROLXMENU
(
	Id INT IDENTITY(1,1),
	IdRol INT,
	IdMenu INT,
	CONSTRAINT pk_rolxmenu
		PRIMARY KEY (Id),
	CONSTRAINT fk_rolxmenu_rol
		FOREIGN KEY (IdRol)
		REFERENCES ROL(Id),
	CONSTRAINT fk_rolxmenu_menu
		FOREIGN KEY (IdMenu)
		REFERENCES MENU(Id)
)

CREATE TABLE MEDIOPAGO
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(100),
	CONSTRAINT pk_mediopago
		PRIMARY KEY (Id)
)

CREATE TABLE CATEGORIA
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(100),
	CONSTRAINT pk_categoria
		PRIMARY KEY (Id)
)

CREATE TABLE PLATO
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(100),
	IdCategoria INT,
	CONSTRAINT pk_plato
		PRIMARY KEY (Id),
	CONSTRAINT fk_plato_categoria
		FOREIGN KEY (Id)
		REFERENCES CATEGORIA(Id)
)

CREATE TABLE PRECIO
(
	Id INT IDENTITY(1,1),
	Monto DECIMAL(4,2),
	Fecha DATETIME,
	Estado BIT,
	IdPlato INT,
	CONSTRAINT pk_precio
		PRIMARY KEY (Id),
	CONSTRAINT fk_precio_plato
		FOREIGN KEY (Id)
		REFERENCES PLATO(Id)
)

CREATE TABLE PERSONAL
(
	Id INT IDENTITY(1,1),
	CodigoPersonal VARCHAR(10),
	TipoDocumento VARCHAR(2),
	NumeroDocumento VARCHAR(20),
	Nombre VARCHAR(200),
	ApellidoPaterno VARCHAR(100),
	ApellidoMaterno VARCHAR(100),
	Telefono VARCHAR(10),
	Correo VARCHAR(100),
	Clave VARCHAR(MAX),
	Estado CHAR(1),
	IdRol INT,
	CONSTRAINT pk_personal
		PRIMARY KEY (Id),
	CONSTRAINT fk_personal_rol
		FOREIGN KEY (IdRol)
		REFERENCES ROL(Id)
)

CREATE TABLE SUCURSAL
(
	Id INT IDENTITY(1,1),
	CodigoSuc VARCHAR(3),
	Nombre VARCHAR(200),
	Direccion VARCHAR(500),
	Telefono VARCHAR(10),
	IdResponsable INT,
	HoraEntrada TIME,
	HoraSalida TIME,
	Estado BIT,
	CONSTRAINT pk_sucursal
		PRIMARY KEY (Id),
	CONSTRAINT fk_sucursal_persona
		FOREIGN KEY (IdResponsable)
		REFERENCES PERSONAL(Id)
)

CREATE TABLE ASIGNACIONPERSONAL
(
	Id INT IDENTITY(1,1),
	IdSucursal INT,
	IdPersonal INT,
	CONSTRAINT pk_asignacion_personal
		PRIMARY KEY (Id),
	CONSTRAINT fk_asignacion_personal_personal
		FOREIGN KEY (Id)
		REFERENCES PERSONAL(Id),
	CONSTRAINT fk_asignacion_personal_sucursal
		FOREIGN KEY (Id)
		REFERENCES SUCURSAL(Id)
)

CREATE TABLE PISO
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(100),
	CapacidadClientes INT,
	CapacidadEmpleados INT,
	IdSucural INT,
	CONSTRAINT pk_piso
		PRIMARY KEY (Id),
	CONSTRAINT fk_piso_sucursal
		FOREIGN KEY (Id)
		REFERENCES SUCURSAL(Id)
)

CREATE TABLE MESA
(
	Id INT IDENTITY(1,1),
	Numero VARCHAR(2),
	Capacidad INT,
	IdPiso INT,
	CONSTRAINT pk_mesa
		PRIMARY KEY (Id),
	CONSTRAINT fk_mesa_piso
		FOREIGN KEY (Id)
		REFERENCES PISO(Id)
)

CREATE TABLE CLIENTE
(
	Id INT IDENTITY(1,1),
	TipoDocumento VARCHAR(1),
	NumeroDocumento VARCHAR(20),
	Nombre VARCHAR(200),
	ApellidoPaterno VARCHAR(100),
	ApellidoMaterno VARCHAR(100),
	Ruc VARCHAR(20),
	RazonSocial VARCHAR(MAX),
	Dirreccion VARCHAR(MAX),
	DirreccionEntrega VARCHAR(MAX),
	CONSTRAINT pk_cliente
		PRIMARY KEY (Id),
)

CREATE TABLE PEDIDO
(
	Id INT IDENTITY(1,1),
	NumeroSerie VARCHAR(10),
	NumeroCorrelativo VARCHAR(20),
	TipoPedido CHAR(1),
	IdCliente INT,
	IdMesa INT,
	IdPersonal INT,
	IdMedioPago INT,
	CONSTRAINT pk_pedido
		PRIMARY KEY (Id),
	CONSTRAINT fk_pedido_mesa
		FOREIGN KEY (Id)
		REFERENCES MESA(Id),
	CONSTRAINT fk_pedido_personal
		FOREIGN KEY (Id)
		REFERENCES PERSONAL(Id),
	CONSTRAINT fk_pedido_mediopago
		FOREIGN KEY (Id)
		REFERENCES MEDIOPAGO(Id),
	CONSTRAINT fk_pedido_cliente
		FOREIGN KEY (Id)
		REFERENCES CLIENTE(Id)
)

CREATE TABLE DETALLEPEDIDO
(
	Id INT IDENTITY(1,1),
	Cantidad INT,
	PrecioUnitario DECIMAL(4,2),
	IdPato INT,
	IdPedido INT,
	CONSTRAINT pk_detallepedido
		PRIMARY KEY (Id),
	CONSTRAINT fk_detallepedido_plato
		FOREIGN KEY (Id)
		REFERENCES PLATO(Id),
	CONSTRAINT fk_detallepedido_pedido
		FOREIGN KEY (Id)
		REFERENCES PEDIDO(Id),
)


CREATE TABLE ASISTENCIA
(
	Id INT IDENTITY(1,1),
	Fecha DATETIME,
	Tipo CHAR(1),
	Justificacion TEXT,
	IdPersonal INT,
	CONSTRAINT pk_asistencia
		PRIMARY KEY (Id),
	CONSTRAINT fk_asistencia_personal
		FOREIGN KEY (Id)
		REFERENCES PERSONAL(Id),
)

CREATE TABLE TIPODESCUENTO
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(200),
	CONSTRAINT pk_tipodescuento
		PRIMARY KEY (Id)
)

CREATE TABLE DESCUENTO
(
	Id INT IDENTITY(1,1),
	Fecha DATETIME,
	TipoDesc INT,
	Justificacion TEXT,
	Monto DECIMAL(4,2),
	IdPersonal INT,
	CONSTRAINT pk_descuento
		PRIMARY KEY (Id),
	CONSTRAINT fk_descuento_tipodescuento
		FOREIGN KEY (Id)
		REFERENCES TIPODESCUENTO(Id),
	CONSTRAINT fk_descuento_personal
		FOREIGN KEY (Id)
		REFERENCES PERSONAL(Id)
)