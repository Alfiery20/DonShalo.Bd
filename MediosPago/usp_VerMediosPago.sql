USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerMediosPago') 
	BEGIN
		DROP PROCEDURE usp_VerMediosPago;
	END
GO

CREATE PROCEDURE usp_VerMediosPago
(
	@pid INT
)
AS
BEGIN
	SELECT 
		MEDIO.Id AS [ID],
		MEDIO.Nombre AS [NOMBRE],
		(CASE MEDIO.Estado
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' 
		END) AS [ESTADO]
	FROM MEDIOPAGO MEDIO
	WHERE MEDIO.Id = @pid
END