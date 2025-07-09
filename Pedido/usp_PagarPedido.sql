USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_PagarPedido') 
	BEGIN
		DROP PROCEDURE usp_PagarPedido;
	END
GO

CREATE PROCEDURE usp_PagarPedido
(
	@pidPedido INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			UPDATE PEDIDO SET Estado = 'P' WHERE Id = @pidPedido
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