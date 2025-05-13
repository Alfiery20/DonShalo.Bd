USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerSucursales') 
	BEGIN
		DROP PROCEDURE usp_ObtenerSucursales;
	END
GO

CREATE PROCEDURE usp_ObtenerSucursales
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT 
		SUC.Id AS [ID],
		SUC.CodigoSuc AS [CODIGO_SUCURSAL],
		SUC.Nombre AS [NOMBRE],
		SUC.Direccion AS [DIRECCION],
		SUC.Telefono AS [TELEFONO],
		SUC.HoraEntrada AS [HORA_ENTRADA],
		SUC.HoraSalida AS [HORA_SALIDA],
		(CASE SUC.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO],
		CONCAT(PER.Nombre, ' ' , PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [RESPONSABLE]
	FROM SUCURSAL SUC
	LEFT JOIN PERSONAL PER ON PER.Id = SUC.IdResponsable
	WHERE 
		SUC.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END