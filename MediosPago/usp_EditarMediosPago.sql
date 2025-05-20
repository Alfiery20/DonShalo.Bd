USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EditarMediosPago') 
	BEGIN
		DROP PROCEDURE usp_EditarMediosPago;
	END
GO

CREATE PROCEDURE usp_EditarMediosPago
(
	@pId INT,
	@pnombre VARCHAR(200),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE MEDIOPAGO SET 
				Nombre = @pnombre
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito el medio de pago de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END