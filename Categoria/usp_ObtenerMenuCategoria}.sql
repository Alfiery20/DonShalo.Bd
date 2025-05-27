USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMenuCategoria') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMenuCategoria;
	END
GO

CREATE PROCEDURE usp_ObtenerMenuCategoria
AS
BEGIN
	SELECT 
		CAT.Id AS [ID],
		CAT.Nombre AS [NOMBRE]
	FROM CATEGORIA CAT
END