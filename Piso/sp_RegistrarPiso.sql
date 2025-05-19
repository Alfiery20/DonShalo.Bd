USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_RegistrarPiso') 
	BEGIN
		DROP PROCEDURE sp_RegistrarPiso;
	END
GO

CREATE PROCEDURE sp_RegistrarPiso
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