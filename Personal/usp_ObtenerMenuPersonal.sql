USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMenuPersonal') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMenuPersonal;
	END
GO

CREATE PROCEDURE usp_ObtenerMenuPersonal
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT TOP 5
		PERS.Id AS [ID],
		CONCAT(PERS.Nombre, ' ', PERS.ApellidoPaterno, ' ', PERS.ApellidoMaterno) AS [NOMBRE]
	FROM PERSONAL PERS
	WHERE 
		CONCAT(PERS.Nombre, ' ', PERS.ApellidoPaterno, ' ', PERS.ApellidoMaterno) LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END