USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerCliente') 
	BEGIN
		DROP PROCEDURE usp_ObtenerCliente;
	END
GO

CREATE PROCEDURE usp_ObtenerCliente
(
	@pNumeroDocumento VARCHAR(30)
)
AS
BEGIN
	SELECT 
		CLIE.Id AS [ID],
		CONCAT(CLIE.Nombre, ' ' , CLIE.ApellidoPaterno, ' ' , CLIE.ApellidoMaterno) AS [NOMBRE]
	FROM CLIENTE CLIE
	WHERE 
		CLIE.NumeroDocumento = @pNumeroDocumento
END