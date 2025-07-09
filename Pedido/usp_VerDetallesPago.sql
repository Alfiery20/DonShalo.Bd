USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerDetallesPago') 
	BEGIN
		DROP PROCEDURE usp_VerDetallesPago;
	END
GO

CREATE PROCEDURE usp_VerDetallesPago
(
	@pidPedido INT
)
AS
BEGIN
	SELECT 
		DET_PED.Id AS [ID],
		PLAT.Id AS [ID_PLATO],
		PLAT.Nombre AS [PLATO],
		DET_PED.PrecioUnitario AS [PRECIO],
		DET_PED.Cantidad AS [CANTIDAD],
		(DET_PED.Cantidad*DET_PED.PrecioUnitario) AS [SUBTOTAL]
	FROM 
	DETALLEPEDIDO DET_PED
	LEFT JOIN PLATO PLAT ON PLAT.Id = DET_PED.IdPato
	WHERE DET_PED.IdPedido = @pidPedido
END