USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EditarSucursal') 
	BEGIN
		DROP PROCEDURE usp_EditarSucursal;
	END
GO

CREATE PROCEDURE usp_EditarSucursal
(
	@pId INT,
	@pNombre VARCHAR(250),
	@pDireccion VARCHAR(MAX),
	@pTelefono VARCHAR(20),
	@pHoraIngreso TIME,
	@pHoraSalida TIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE SUCURSAL SET 
				Nombre = @pNombre, 
				Direccion = @pDireccion, 
				Telefono = @pTelefono,
				HoraEntrada = @pHoraIngreso,
				HoraSalida = @pHoraSalida
			WHERE Id = @pId

			SET @codigo = 'OK';
			SET @msj = 'Se edito la sucursal de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END