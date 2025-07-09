USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMediosPagoMenu') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMediosPagoMenu;
	END
GO

CREATE PROCEDURE usp_ObtenerMediosPagoMenu
AS
BEGIN
	SELECT 
		MEDIO.Id AS [ID],
		MEDIO.Nombre AS [NOMBRE]
	FROM MEDIOPAGO MEDIO
	WHERE 
		MEDIO.Estado = 1
END