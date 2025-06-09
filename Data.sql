--CREAR ROL
DECLARE @RolSuperAdmin INT
INSERT INTO ROL(Nombre) VALUES('Super Administrador')
SET @RolSuperAdmin = SCOPE_IDENTITY();

--CREAR USUARIO
INSERT INTO PERSONAL(CodigoPersonal, TipoDocumento, NumeroDocumento, Nombre, ApellidoPaterno, ApellidoMaterno, Telefono, Correo, Clave, Estado, IdRol)
VALUES('0000000000', '01', '74128515', 'Rodolfo Alfiery', 'Furlong', 'Millones', '966676402', 'alfieryfurlong18@gmail.com', 'K29Fc05aZ01FSjdoQ3p6Tko2Y3ZQUT09', 'A', 1)

--MENU DE CONFIGURACION
DECLARE @MenuConfiguracion INT
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Configuración', 'configuracion', 1, null)

SET @MenuConfiguracion = SCOPE_IDENTITY();

DECLARE @MenuSucursal INT, @MenuPiso INT, @MenuMesa INT, @MenuPersonal INT, @MenuRol INT, @MenuMedioPago INT
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Sucursal', 'sucursal', 3, @MenuConfiguracion)
SET @MenuSucursal = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Personal', 'personal', 2, @MenuConfiguracion)
SET @MenuPersonal = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Piso', 'piso', 4, @MenuConfiguracion)
SET @MenuPiso = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Mesa', 'mesa', 5, @MenuConfiguracion)
SET @MenuMesa = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Rol', 'rol', 1, @MenuConfiguracion)
SET @MenuRol = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Medio Pago', 'medioPago', 6, @MenuConfiguracion)
SET @MenuMedioPago = SCOPE_IDENTITY();


--GESTION DE MESAS
DECLARE @MenuGestionMesas INT
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Gestion de Mesas', 'gestionmesa', 1, null)

SET @MenuGestionMesas = SCOPE_IDENTITY();

DECLARE @MenuAtencionMesas INT
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Atencion de Mesas', 'atencionmesa', 1, @MenuGestionMesas)
SET @MenuAtencionMesas = SCOPE_IDENTITY();


--GESTION DE MESAS
DECLARE @MenuGestionCarta INT
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Gestion Carta', 'gestionmesa', 1, null)

SET @MenuGestionCarta = SCOPE_IDENTITY();

DECLARE @MenuCategoria INT, @MenuPlato INT
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Categoria', 'categoria', 1, @MenuGestionCarta)
SET @MenuCategoria = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Plato', 'plato', 2, @MenuGestionCarta)
SET @MenuPlato = SCOPE_IDENTITY();


--PERMISOS DE SUPER ADMIN
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuConfiguracion)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuSucursal)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuPersonal)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuPiso)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuMesa)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuRol)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuMedioPago)

INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuGestionMesas)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuAtencionMesas)

INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuGestionCarta)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuCategoria)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuPlato)


SELECT * FROM MENU