--CREAR ROL
DECLARE @RolSuperAdmin INT
INSERT INTO ROL(Nombre) VALUES('Super Administrador')
SET @RolSuperAdmin = SCOPE_IDENTITY();

--CREAR USUARIO
INSERT INTO PERSONAL(CodigoPersonal, TipoDocumento, NumeroDocumento, Nombre, ApellidoPaterno, ApellidoMaterno, Telefono, Correo, Clave, Estado, IdRol)
VALUES('0000000000', '01', '74128515', 'Rodolfo Alfiery', 'Furlong', 'Millones', '966676402', 'alfieryfurlong18@gmail.com', 'K29Fc05aZ01FSjdoQ3p6Tko2Y3ZQUT09', '1', 1)

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

--PERMISOS DE SUPER ADMIN
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuConfiguracion)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuSucursal)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuPersonal)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuPiso)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuMesa)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuRol)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuMedioPago)