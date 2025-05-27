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
		CAT.Id AS [ID],
		CAT.Nombre AS [NOMBRE]
	FROM CATEGORIA CAT
	WHERE CAT.Id = @pid
END