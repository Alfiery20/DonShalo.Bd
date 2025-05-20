USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMediosPago') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMediosPago;
	END
GO

CREATE PROCEDURE usp_ObtenerMediosPago
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT 
		MEDIO.Id AS [ID],
		MEDIO.Nombre AS [NOMBRE],
		(CASE MEDIO.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM MEDIOPAGO MEDIO
	WHERE 
		MEDIO.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END