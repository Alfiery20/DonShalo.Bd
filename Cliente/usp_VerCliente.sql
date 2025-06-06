USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerCliente') 
	BEGIN
		DROP PROCEDURE usp_VerCliente;
	END
GO

CREATE PROCEDURE usp_VerCliente
(
	@pid INT
)
AS
BEGIN
	SELECT 
		CLIE.Id AS [ID],
		CLIE.TipoDocumento AS [TIPO_DOCUMENTO],
		CLIE.NumeroDocumento AS [NUMERO_DOCUMENTO],
		CLIE.Nombre AS [NOMBRE],
		CLIE.ApellidoPaterno AS [APELLIDO_PATERNO],
		CLIE.ApellidoMaterno AS [APELLIDO_MATERNO],
		CLIE.Ruc AS [RUC],
		CLIE.RazonSocial AS [RAZON_SOCIAL],
		CLIE.Dirreccion AS [DIRECCION],
		CLIE.DirreccionEntrega AS [DIRECCION_ENTREGA]
	FROM CLIENTE CLIE
	WHERE 
		CLIE.Id = @pid
END