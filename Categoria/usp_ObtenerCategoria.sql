USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerCategoria') 
	BEGIN
		DROP PROCEDURE usp_ObtenerCategoria;
	END
GO

CREATE PROCEDURE usp_ObtenerCategoria
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT 
		CAT.Id AS [ID],
		CAT.Nombre AS [NOMBRE],
		(CASE CAT.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM CATEGORIA CAT
	WHERE 
		CAT.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END