USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EditarPiso') 
	BEGIN
		DROP PROCEDURE usp_EditarPiso;
	END
GO

CREATE PROCEDURE usp_EditarPiso
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