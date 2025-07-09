USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerDetallePedido') 
	BEGIN
		DROP PROCEDURE usp_ObtenerDetallePedido;
	END
GO

CREATE PROCEDURE usp_ObtenerDetallePedido
(
	@pidPedido INT
)
AS
BEGIN
	SELECT 
		DET_PED.IdPato AS [ID_PLATO],
		PLAT.Nombre AS [PLATO],
		DET_PED.Cantidad AS [CANTIDAD],
		DET_PED.Comentario AS [COMENTARIO]
	FROM 
	PEDIDO PEDI 
	LEFT JOIN DETALLEPEDIDO DET_PED ON DET_PED.IdPedido = PEDI.Id
	LEFT JOIN PLATO PLAT ON PLAT.Id = DET_PED.IdPato
	WHERE PEDI.Id = @pidPedido
END