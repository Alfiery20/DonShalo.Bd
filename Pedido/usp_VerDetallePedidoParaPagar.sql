USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerDetallePedidoParaPagar') 
	BEGIN
		DROP PROCEDURE usp_VerDetallePedidoParaPagar;
	END
GO

CREATE PROCEDURE usp_VerDetallePedidoParaPagar
(
	@pidPedido INT
)
AS
BEGIN
	SELECT 
		PEDI.Id AS [ID],

		PEDI.NumeroSerie AS [SERIE],
		PEDI.NumeroCorrelativo AS [CORRELATIVO],

		CONCAT(CLI.NumeroDocumento, ' - ', CLI.Nombre, ' ', CLI.ApellidoPaterno, ' ', CLI.ApellidoMaterno) AS [CLIENTE_NATURAL],
		CONCAT(CLI.Ruc, ' - ', CLI.RazonSocial) AS [CLIENTE_JURIDICO],
		PER.Id AS [ID_PERSONAL],
		CONCAT(PER.Nombre, ' ', PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [PERSONAL],
		MES.Id AS [ID_MESA],
		MES.Numero AS [MESA]
	FROM 
	PEDIDO PEDI 
	LEFT JOIN MESA MES ON MES.Id = PEDI.IdMesa 
	LEFT JOIN CLIENTE CLI ON CLI.Id = PEDI.IdCliente
	LEFT JOIN PERSONAL PER ON PER.Id = PEDI.IdPersonal
	WHERE PEDI.Id = @pidPedido
END