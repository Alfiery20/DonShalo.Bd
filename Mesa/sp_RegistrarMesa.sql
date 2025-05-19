USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_RegistrarMesa') 
	BEGIN
		DROP PROCEDURE sp_RegistrarMesa;
	END
GO

CREATE PROCEDURE sp_RegistrarMesa
(
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
			INSERT INTO MESA(Numero, Capacidad, IdPiso, Estado)
			VALUES(@pnumero, @pcapacidad, @pidPiso, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró la mesa de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END