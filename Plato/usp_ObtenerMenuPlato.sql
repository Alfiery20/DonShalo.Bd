USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMenuPlato') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMenuPlato;
	END
GO

CREATE PROCEDURE usp_ObtenerMenuPlato
(
	@pidCategoria INT
)
AS
BEGIN
	SELECT 
		PLAT.Id AS [ID],
		PLAT.Nombre AS [NOMBRE]
	FROM PLATO PLAT
	WHERE 
		PLAT.IdCategoria = @pidCategoria
END