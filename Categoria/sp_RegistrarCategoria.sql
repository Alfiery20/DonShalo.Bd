USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_RegistrarCategoria') 
	BEGIN
		DROP PROCEDURE sp_RegistrarCategoria;
	END
GO

CREATE PROCEDURE sp_RegistrarCategoria
(
	@pnombre VARCHAR(100),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO CATEGORIA(Nombre, Estado)
			VALUES(@pnombre, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró la caetgoria de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END