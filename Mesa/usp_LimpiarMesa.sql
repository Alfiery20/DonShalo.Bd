USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_LimpiarMesa') 
	BEGIN
		DROP PROCEDURE usp_LimpiarMesa;
	END
GO

CREATE PROCEDURE usp_LimpiarMesa
(
	@pidMesa INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			UPDATE PEDIDO SET Estado = 'T' WHERE IdMesa = @pidMesa
			SET @codigo = 'OK';
			SET @msj = 'Mesa lista para atención!';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END