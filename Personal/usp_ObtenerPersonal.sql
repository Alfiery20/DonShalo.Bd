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
		(CASE PER.TipoDocumento
			WHEN '01' THEN 'DNI' 
			WHEN '02' THEN 'CARNET DE EXTRANJERIA'
			WHEN '03' THEN 'PARTIDA DE NACIMIENTO'
			WHEN '04' THEN 'PASAPORTE' END) AS [TIPO_DOCUMENTO],
		PER.NumeroDocumento AS [NUMERO_DOCUMENTO],
		CONCAT(PER.Nombre,' ', PER.ApellidoPaterno, ' ', PER.ApellidoMaterno) AS [NOMBRE],
		PER.Telefono AS [TELEFONO],
		PER.Correo AS [CORREO],
		(
			CASE PER.Estado
				WHEN 'A' THEN 'ACTIVO'
				WHEN 'I' THEN 'INACTIVO'
			END
		) AS [ESTADO],
		ROL.Nombre AS [ROL],
		SUC.Nombre AS [SUCURSAL]
	FROM PERSONAL PER
	LEFT JOIN ROL ROL ON ROL.Id = PER.IdRol
	LEFT JOIN ASIGNACIONPERSONAL ASI ON ASI.IdPersonal = PER.Id
	LEFT JOIN SUCURSAL SUC ON SUC.Id = ASI.IdSucursal
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