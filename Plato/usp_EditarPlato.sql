USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EditarPlato') 
	BEGIN
		DROP PROCEDURE usp_EditarPlato;
	END
GO

CREATE PROCEDURE usp_EditarPlato
(
	@pId INT,
	@pnombre VARCHAR(100),
	@pidCategoria INT,
	@pPrecio DECIMAL(4,2),
	@pFecha DATETIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PLATO SET 
				Nombre = @pnombre,
				IdCategoria = @pidCategoria
			WHERE Id = @pId

			UPDATE PRECIO SET Estado = 0 WHERE IdPlato = @pId

			INSERT INTO PRECIO(Monto, Fecha, Estado, IdPlato) VALUES (@pPrecio, @pFecha, 1, @pId)

			SET @codigo = 'OK';
			SET @msj = 'Se edito el plato de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
		ROLLBACK TRANSACTION;
	END CATCH
END