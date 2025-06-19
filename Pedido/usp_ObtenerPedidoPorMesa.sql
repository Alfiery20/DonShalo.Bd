USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerPedidoPorMesa') 
	BEGIN
		DROP PROCEDURE usp_ObtenerPedidoPorMesa;
	END
GO

CREATE PROCEDURE usp_ObtenerPedidoPorMesa
(
	@pidMesa INT
)
AS
BEGIN
	SELECT 
		PEDI.Id AS [ID],
		PEDI.NumeroSerie AS [SERIE],
		PEDI.NumeroCorrelativo AS [CORRELATIVO],
		CLI.Id AS [CLIENTE_ID],
		CLI.NumeroDocumento AS [NUMERO_DOCUMENTO],
		CLI.Nombre AS [NOMBRE_CLIENTE],
		CLI.ApellidoPaterno AS [APELLIDO_PATERNO_CLIENTE],
		CLI.ApellidoMaterno AS [APELLIDO_MATERNO_CLIENTE],
		CLI.Ruc AS [RUC],
		CLI.RazonSocial AS [RAZON_SOCIAL],
		(CASE PEDI.Estado
						WHEN 'I' THEN 1 --INICIADO
						WHEN 'P' THEN 2 --PENDIENTTE
						WHEN 'A' THEN 2 --ANULADO
				END) AS [ESTADO]
	FROM 
	PEDIDO PEDI 
	LEFT JOIN MESA MES ON MES.Id = PEDI.IdMesa 
	LEFT JOIN CLIENTE CLI ON CLI.Id = PEDI.IdCliente
	WHERE PEDI.IdMesa = @pidMesa AND PEDI.Estado = 'I'
END