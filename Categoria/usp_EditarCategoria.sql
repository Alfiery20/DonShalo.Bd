USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EditarCategoria') 
	BEGIN
		DROP PROCEDURE usp_EditarCategoria;
	END
GO

CREATE PROCEDURE usp_EditarCategoria
(
	@pId INT,
	@pnombre VARCHAR(100),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE CATEGORIA SET 
				Nombre = @pnombre
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito la categoria de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END