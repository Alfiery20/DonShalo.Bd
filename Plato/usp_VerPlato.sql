USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerCategoria') 
	BEGIN
		DROP PROCEDURE usp_VerCategoria;
	END
GO

CREATE PROCEDURE usp_VerCategoria
(
	@pid INT
)
AS
BEGIN
	SELECT 
		PLAT.Id AS [ID],
		PLAT.Nombre AS [NOMBRE],
		PLAT.IdCategoria AS [CATEGORIA],
		PRE.Monto AS [MONTO]
	FROM PLATO PLAT
	LEFT JOIN PRECIO PRE ON PRE.IdPlato = PLAT.Id AND PRE.Estado = 1
	WHERE 
		PLAT.Id =  @pid OR
		(@pid IS NULL OR @pid = '')
END