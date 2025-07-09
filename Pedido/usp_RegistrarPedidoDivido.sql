--USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_RegistrarPedidoDivido') 
	BEGIN
		DROP PROCEDURE usp_RegistrarPedidoDivido;
	END
GO

CREATE PROCEDURE usp_RegistrarPedidoDivido
(
	@pidPedido INT,
	@pidMedioPago INT,
	@pdetPedido XML,
	@pdetSubpedidos XML,

	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @idPersonal INT, @idCliente INT, @idMesa INT;

			SELECT 
				@idPersonal = IdPersonal,
				@idCliente = IdCliente,
				@idMesa = IdMesa
			FROM PEDIDO WHERE Id = @pidPedido

			DELETE FROM DETALLEPEDIDO WHERE IdPedido = @pidPedido

			INSERT INTO DETALLEPEDIDO(Cantidad, PrecioUnitario, IdPato, IdPedido)
			SELECT
				Detalles.value('(cantidad)[1]', 'INT') AS cantidad,
				PRE.Monto AS monto,
				Detalles.value('(idPlato)[1]', 'INT') AS idPlato,
				@pidPedido
			FROM 
				@pdetPedido.nodes('/detalles/detalle') AS X(Detalles)
				INNER JOIN PRECIO PRE ON PRE.IdPlato = Detalles.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

			UPDATE PEDIDO SET 
					Estado = 'P',
					IdMedioPago = @pidMedioPago 
			WHERE Id = @pidPedido


			DECLARE @correlativo VARCHAR(20), @correlativoNum INT, 
					@serie VARCHAR(3), @serieNum INT

			SELECT TOP 1 
				@correlativo = NumeroCorrelativo
			FROM PEDIDO ORDER BY Id DESC

			SET @correlativo = COALESCE(@correlativo, '0')

			SELECT
				@serieNum = SUC.Id
			FROM PERSONAL PER
			INNER JOIN ASIGNACIONPERSONAL ASIG ON ASIG.IdPersonal = PER.Id
			INNER JOIN SUCURSAL SUC ON SUC.Id = ASIG.IdSucursal
			WHERE PER.Id = @idPersonal

			--Subcuentas
			DECLARE @IdPedidoSubCuenta INT, @idClienteSubcuenta INT, @idMedioPago INT, @subcuentas XML

			DECLARE cliente_cursor CURSOR FOR
				SELECT info.value('(idCliente)[1]', 'INT') AS IdCliente,
						info.value('(idMedioPago)[1]', 'INT') AS IdMedioPago,
					   info.query('detallesSubcuenta') AS DetallesSubcuenta
				FROM @pdetSubpedidos.nodes('/pedido/informacion') AS T(info);

			OPEN cliente_cursor;

			FETCH NEXT FROM cliente_cursor INTO @idClienteSubcuenta, @idMedioPago, @subcuentas;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @correlativoNum = CAST(@correlativo AS INT) + 1
				
				SET @correlativo = RIGHT(REPLICATE('0', 9) + CAST(@correlativoNum AS VARCHAR), 9)
				SET @serie = RIGHT(REPLICATE('0', 3) + CAST(@serieNum AS VARCHAR), 3)

				INSERT INTO PEDIDO(NumeroSerie, NumeroCorrelativo, TipoPedido, IdCliente, IdMedioPago, IdMesa, IdPersonal, Estado)
				VALUES(@serie, @correlativo, 'M', @idClienteSubcuenta, @idMedioPago, @idMesa, @idPersonal, 'T')

				SET @IdPedidoSubCuenta = SCOPE_IDENTITY();

				INSERT INTO DetallePedido (IdPedido, IdPato, Cantidad, PrecioUnitario)
				SELECT
					@IdPedidoSubCuenta,
					detalle.value('(idPlato)[1]', 'INT') AS IdPlato,
					detalle.value('(cantidad)[1]', 'INT') AS Cantidad,
					PRE.Monto AS monto
				FROM 
					@subcuentas.nodes('detallesSubcuenta/detalleSubcuenta') AS D(detalle)
					INNER JOIN PRECIO PRE ON PRE.IdPlato = detalle.value('(idPlato)[1]', 'INT') AND PRE.Estado = 1

				FETCH NEXT FROM cliente_cursor INTO @idClienteSubcuenta, @idMedioPago, @subcuentas;
			END

			CLOSE cliente_cursor;
			DEALLOCATE cliente_cursor;

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