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
	SELECT
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE],
		(
			CASE ROL.Estado 
				WHEN 1 THEN 'ACTIVO'
				ELSE 'INACTIVO' END
		) AS [ESTADO]
	FROM ROL ROL
	WHERE 
		ROL.Nombre LIKE CONCAT(@pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END