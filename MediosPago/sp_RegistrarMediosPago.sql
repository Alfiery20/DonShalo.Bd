USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_RegistrarMediosPago') 
	BEGIN
		DROP PROCEDURE sp_RegistrarMediosPago;
	END
GO

CREATE PROCEDURE sp_RegistrarMediosPago
(
	@ptermino VARCHAR(100),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO MEDIOPAGO(Nombre, Estado)
			VALUES(@ptermino, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró el medio de pago de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END