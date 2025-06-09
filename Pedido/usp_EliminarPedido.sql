USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarPedido') 
	BEGIN
		DROP PROCEDURE usp_EliminarPedido;
	END
GO

CREATE PROCEDURE usp_EliminarPedido
(
	@pIdPedido INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PEDIDO 
				SET Estado = 'A'
			WHERE Id = @pIdPedido

			SET @codigo = 'OK';
			SET @msj = 'Se cancelo el pedido de manera satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END