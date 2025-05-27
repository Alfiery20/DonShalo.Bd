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
	@pidCategoria INT,
	@pFecha DATETIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			DECLARE @idNuevo INT
			
			INSERT INTO PLATO(Nombre, IdCategoria ,Estado)
			VALUES(@pnombre, @pidCategoria, 1)

			SET @idNuevo = SCOPE_IDENTITY()

			UPDATE PRECIO SET Estado = 0 WHERE IdPlato = @idNuevo

			INSERT INTO PRECIO(Monto, Fecha, Estado, IdPlato) VALUES (@codigo, @pFecha, 1, @idNuevo)

			SET @codigo = 'OK';
			SET @msj = 'Se registró el plato de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END