USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_RegistrarSucursal') 
	BEGIN
		DROP PROCEDURE sp_RegistrarSucursal;
	END
GO

CREATE PROCEDURE sp_RegistrarSucursal
(
	@pnombre VARCHAR(250),
	@pdireccion VARCHAR(MAX),
	@ptelefono VARCHAR(20),
	@pidEncargado INT,
	@pfechaEntrada TIME,
	@pfechaSalida TIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @codigoSucursal VARCHAR(3) = ''
			SELECT TOP 1 @codigoSucursal = (Id + 1) FROM PERSONAL ORDER BY ID DESC
			INSERT INTO SUCURSAL(
					CodigoSuc, Nombre, Direccion, 
					Telefono, IdResponsable, 
					HoraEntrada, HoraSalida, Estado)
			VALUES(RIGHT(REPLICATE('0', 3) + @codigoSucursal, 3), @pnombre, @pdireccion,
					@ptelefono, @pidEncargado,
					@pfechaEntrada, @pfechaSalida, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró la sucursal de forma satisfactoria.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END