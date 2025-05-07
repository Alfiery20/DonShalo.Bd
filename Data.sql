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

DECLARE @MenuSucursal INT, @MenuPiso INT, @MenuMesa INT
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Sucursal', 'sucursal', 1, @MenuConfiguracion)
SET @MenuSucursal = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Piso', 'piso', 2, @MenuConfiguracion)
SET @MenuPiso = SCOPE_IDENTITY();
INSERT INTO MENU(Nombre, Ruta, Orden, MenuPadre) VALUES('Mesa', 'mesa', 3, @MenuConfiguracion)
SET @MenuMesa = SCOPE_IDENTITY();

--PERMISOS DE SUPER ADMIN
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuConfiguracion)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuSucursal)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuPiso)
INSERT INTO ROLXMENU(IdRol, IdMenu) VALUES (1, @MenuMesa)