USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerPiso') 
	BEGIN
		DROP PROCEDURE usp_ObtenerPiso;
	END
GO

CREATE PROCEDURE usp_ObtenerPiso
(
	@pTermino VARCHAR(10),
	@pIdSucursal INT
)
AS
BEGIN
	SELECT 
		PISO.Id AS [ID],
		PISO.Nombre AS [NOMBRE],
		PISO.CapacidadClientes AS [CLIENTES],
		PISO.CapacidadEmpleados AS [EMPLEADOS],
		SUCU.Nombre AS [SUCURSAL],
		(CASE PISO.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM PISO PISO
	LEFT JOIN SUCURSAL SUCU ON SUCU.Id = PISO.IdSucural
	WHERE 
		(PISO.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND
		(PISO.IdSucural = @pIdSucursal OR 
		(@pIdSucursal IS NULL OR @pIdSucursal = 0))
END