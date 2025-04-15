USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerSucursal') 
	BEGIN
		DROP PROCEDURE usp_VerSucursal;
	END
GO

CREATE PROCEDURE usp_VerSucursal
(
	@pid INT
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
		SUC.Estado AS [ESTADO],
		SUC.IdResponsable AS [ID_RESPONSABLE],
		CONCAT(PER.Nombre, ' ' , PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [RESPONSABLE]
	FROM SUCURSAL SUC
	INNER JOIN PERSONAL PER ON PER.Id = SUC.IdResponsable
	WHERE 
		SUC.Id = @pid OR 
		@pid IS NULL OR @pid = ''
END