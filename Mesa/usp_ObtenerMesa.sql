USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMesa') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMesa;
	END
GO

CREATE PROCEDURE usp_ObtenerMesa
(
	@pTermino VARCHAR(10),
	@pIdSucursal INT,
	@pIdPiso INT
)
AS
BEGIN
	SELECT 
		MESA.Id AS [ID],
		MESA.Numero AS [NUMERO],
		MESA.Capacidad AS [CAPACIDAD],
		PISO.Nombre AS [PISO],
		SUCU.Nombre AS [SUCURSAL],
		(CASE MESA.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM MESA MESA
	LEFT JOIN PISO PISO ON PISO.Id = MESA.IdPiso
	LEFT JOIN SUCURSAL SUCU ON SUCU.Id = PISO.IdSucural
	WHERE 
		(PISO.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND
		(PISO.IdSucural = @pIdSucursal OR 
		(@pIdSucursal IS NULL OR @pIdSucursal = 0)) AND
		(MESA.IdPiso = @pIdPiso OR 
		(@pIdPiso IS NULL OR @pIdPiso = 0))
END