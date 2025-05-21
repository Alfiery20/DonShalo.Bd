USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarMediosPago') 
	BEGIN
		DROP PROCEDURE usp_EliminarMediosPago;
	END
GO

CREATE PROCEDURE usp_EliminarMediosPago
(
	@pIdMedioPago INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE MEDIOPAGO 
				SET Estado = (
					CASE Estado
					WHEN 1 THEN 0
					ELSE 1 END
					) 
			WHERE Id = @pIdMedioPago

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el estado del medio de pago de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END