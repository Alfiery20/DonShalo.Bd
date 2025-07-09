USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EditarPedido') 
	BEGIN
		DROP PROCEDURE usp_EditarPedido;
	END
GO

CREATE PROCEDURE usp_EditarPedido
(
	@pidPedido INT,
	@pidCliente INT,
	@pdetPedidos XML,

	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE PEDIDO 
				SET IdCliente = @pidCliente
			WHERE Id = @pidPedido

			DELETE FROM DETALLEPEDIDO WHERE IdPedido = @pidPedido

			INSERT INTO DETALLEPEDIDO(Cantidad, PrecioUnitario, IdPato, IdPedido, Comentario)
			SELECT
				Detalles.value('(cantidad)[1]', 'INT') AS cantidad,
				PRE.Monto AS monto,
				Detalles.value('(idPlato)[1]', 'INT') AS idPlato,
				@pidPedido,
				Detalles.value('(comentario)[1]', 'VARCHAR(MAX)') AS comentario
			FROM 
				@pdetPedidos.nodes('/detalles/detalle') AS X(Detalles)
				INNER JOIN PRECIO PRE ON PRE.IdPlato = Detalles.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

			SET @codigo = 'OK';
			SET @msj = 'Se editó el pedido de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END