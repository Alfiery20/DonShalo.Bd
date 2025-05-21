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