USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarPersonal') 
	BEGIN
		DROP PROCEDURE usp_EliminarPersonal;
	END
GO

CREATE PROCEDURE usp_EliminarPersonal
(
	@pId INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PERSONAL 
				SET Estado = (
					CASE Estado
					WHEN 'I' THEN 'A'
					ELSE 'I' END
					) 
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del personal de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END