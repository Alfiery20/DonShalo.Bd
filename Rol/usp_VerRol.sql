USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerRol') 
	BEGIN
		DROP PROCEDURE usp_VerRol;
	END
GO

CREATE PROCEDURE usp_VerRol
(
	@pId INT
)
AS
BEGIN
	SELECT TOP 5
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE]
	FROM ROL ROL
	WHERE 
		Id = @pId
END