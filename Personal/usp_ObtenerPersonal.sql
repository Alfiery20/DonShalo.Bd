USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerPersonal') 
	BEGIN
		DROP PROCEDURE usp_ObtenerPersonal;
	END
GO

CREATE PROCEDURE usp_ObtenerPersonal
(
	@pNumeroPersonal VARCHAR(10),
	@pNumeroDocumento VARCHAR(20),
	@pNombre VARCHAR(10),
	@pRol INT
)
AS
BEGIN
	SELECT 
		PER.Id AS [ID],
		PER.TipoDocumento AS [TIPO_DOCUMENTO],
		PER.NumeroDocumento AS [NUMERO_DOCUMENTO],
		CONCAT(PER.Nombre, PER.ApellidoPaterno, PER.ApellidoMaterno) AS [NOMBRE],
		PER.Telefono AS [TELEFONO],
		PER.Correo AS [CORREO],
		PER.Estado AS [ESTADO],
		ROL.Nombre AS [ROL]
	FROM PERSONAL PER
	LEFT JOIN ROL ROL ON ROL.Id = PER.IdRol
	WHERE 
		(PER.Nombre LIKE CONCAT('%', @pNombre,'%') OR 
		(@pNombre IS NULL OR @pNombre = '')) AND
		(PER.CodigoPersonal LIKE CONCAT(@pNumeroPersonal,'%') OR 
		(@pNumeroPersonal IS NULL OR @pNumeroPersonal = '')) AND
		(PER.NumeroDocumento LIKE CONCAT(@pNumeroDocumento,'%') OR 
		(@pNumeroDocumento IS NULL OR @pNumeroDocumento = '')) AND
		(PER.IdRol LIKE CONCAT(@pRol,'%') OR 
		(@pRol IS NULL OR @pRol = ''))

END