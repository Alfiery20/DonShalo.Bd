USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_RegistrarPedido') 
	BEGIN
		DROP PROCEDURE usp_RegistrarPedido;
	END
GO

CREATE PROCEDURE usp_RegistrarPedido
(
	@pidCliente INT,
	@pidMesa INT,
	@pidPersonal INT,
	@pdetPedidos XML,

	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @correlativo VARCHAR(20), @correlativoNum INT, 
					@serie VARCHAR(3),	@serieNum INT

			SELECT TOP 1 
				@correlativo = NumeroCorrelativo
			FROM PEDIDO ORDER BY Id DESC

			SET @correlativo = COALESCE(@correlativo, '0')

			SELECT
				@serieNum = SUC.Id
			FROM PERSONAL PER
			INNER JOIN ASIGNACIONPERSONAL ASIG ON ASIG.IdPersonal = PER.Id
			INNER JOIN SUCURSAL SUC ON SUC.Id = ASIG.IdSucursal
			WHERE PER.Id = @pidPersonal

			SET @correlativoNum = CAST(@correlativo AS INT) + 1

			SET @correlativo = RIGHT(REPLICATE('0', 9) + CAST(@correlativoNum AS VARCHAR), 9)
			SET @serie = RIGHT(REPLICATE('0', 3) + CAST(@serieNum AS VARCHAR), 3)

			DECLARE @idPedidoNuevo INT

			INSERT INTO PEDIDO(NumeroSerie, NumeroCorrelativo, TipoPedido, IdCliente, IdMesa, IdPersonal, Estado)
			VALUES(@serie, @correlativo, 'M', @pidCliente, @pidMesa, @pidPersonal, 'I')

			SET @idPedidoNuevo = SCOPE_IDENTITY();

			INSERT INTO DETALLEPEDIDO(Cantidad, PrecioUnitario, IdPato, IdPedido)
			SELECT
				Detalles.value('(cantidad)[1]', 'INT') AS cantidad,
				PRE.Monto AS monto,
				Detalles.value('(idPlato)[1]', 'INT') AS idPlato,
				@idPedidoNuevo
			FROM 
				@pdetPedidos.nodes('/detalles/detalle') AS X(Detalles)
				INNER JOIN PRECIO PRE ON PRE.IdPlato = Detalles.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

			SET @codigo = 'OK';
			SET @msj = 'Se registró el pedido de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END