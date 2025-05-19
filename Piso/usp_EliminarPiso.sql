USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarPiso') 
	BEGIN
		DROP PROCEDURE usp_EliminarPiso;
	END
GO

CREATE PROCEDURE usp_EliminarPiso
(
	@pIdPiso INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PISO SET Estado = 0 WHERE Id = @pIdPiso

			SET @codigo = 'OK';
			SET @msj = 'Se elimino el Piso de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END