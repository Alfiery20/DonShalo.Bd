USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMenuRol') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMenuRol;
	END
GO

CREATE PROCEDURE usp_ObtenerMenuRol
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
		(ROL.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND Estado = 1
END

