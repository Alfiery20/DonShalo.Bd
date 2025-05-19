USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerPiso') 
	BEGIN
		DROP PROCEDURE usp_VerPiso;
	END
GO

CREATE PROCEDURE usp_VerPiso
(
	@pid INT
)
AS
BEGIN
	SELECT 
		PISO.Id AS [ID],
		PISO.Nombre AS [NOMBRE],
		PISO.CapacidadClientes AS [CLIENTES],
		PISO.CapacidadEmpleados AS [EMPLEADOS],
		PISO.IdSucural AS [ID_SUCURSAL],
		SUCU.Nombre AS [SUCURSAL]
	FROM PISO PISO
	LEFT JOIN SUCURSAL SUCU ON SUCU.Id = PISO.IdSucural
	WHERE PISO.Id = @pid
END