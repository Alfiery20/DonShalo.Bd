USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerMenuSucursal') 
	BEGIN
		DROP PROCEDURE usp_ObtenerMenuSucursal;
	END
GO

CREATE PROCEDURE usp_ObtenerMenuSucursal
(
	@pTermino VARCHAR(10)
)
AS
BEGIN
	SELECT
		SUCU.Id AS [ID],
		SUCU.Nombre AS [NOMBRE]
	FROM SUCURSAL SUCU
	WHERE 
		SUCU.Nombre LIKE CONCAT('%', @pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')
END