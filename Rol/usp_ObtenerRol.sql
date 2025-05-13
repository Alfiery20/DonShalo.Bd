USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerRol') 
	BEGIN
		DROP PROCEDURE usp_ObtenerRol;
	END
GO

CREATE PROCEDURE usp_ObtenerRol
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT TOP 5
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE]
	FROM ROL ROL
	WHERE 
		ROL.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END