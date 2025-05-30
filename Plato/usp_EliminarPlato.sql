USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarPlato') 
	BEGIN
		DROP PROCEDURE usp_EliminarPlato;
	END
GO

CREATE PROCEDURE usp_EliminarPlato
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