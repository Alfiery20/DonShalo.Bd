USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarSucursal') 
	BEGIN
		DROP PROCEDURE usp_EliminarSucursal;
	END
GO

CREATE PROCEDURE usp_EliminarSucursal
(
	@pIdSucursal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE SUCURSAL SET Estado = 0 WHERE Id = @pIdSucursal

			SET @codigo = 'OK';
			SET @msj = 'Se elimino la sucursal de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END