USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EditarMesa') 
	BEGIN
		DROP PROCEDURE usp_EditarMesa;
	END
GO

CREATE PROCEDURE usp_EditarMesa
(
	@pId INT,
	@pnumero VARCHAR(2),
	@pcapacidad INT,
	@pidPiso INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE MESA SET 
				Numero = @pnumero, 
				Capacidad = @pcapacidad,
				IdPiso = @pidPiso
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito el piso de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END