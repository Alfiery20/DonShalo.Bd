USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerPlato') 
	BEGIN
		DROP PROCEDURE usp_ObtenerPlato;
	END
GO

CREATE PROCEDURE usp_ObtenerPlato
(
	@pTermino VARCHAR(10),
	@pIdCategoria INT
)
AS
BEGIN
	SELECT 
		PLAT.Id AS [ID],
		PLAT.Nombre AS [NOMBRE],
		CAT.Nombre AS [CATEGORIA],
		PRE.Monto AS [PRECIO],
		(CASE PLAT.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM PLATO PLAT
	LEFT JOIN CATEGORIA CAT ON CAT.Id = PLAT.IdCategoria
	LEFT JOIN PRECIO PRE ON PRE.IdPlato = PLAT.Id AND PRE.Estado = 1
	WHERE 
		(PLAT.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND
		(CAT.Id =  @pIdCategoria OR
		(@pIdCategoria IS NULL OR @pIdCategoria = ''))
END