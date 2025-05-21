USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarRol') 
	BEGIN
		DROP PROCEDURE usp_EliminarRol;
	END
GO

CREATE PROCEDURE usp_EliminarRol
(
	@pId INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE ROL 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					)
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del rol de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
		ROLLBACK TRANSACTION;
	END CATCH
END