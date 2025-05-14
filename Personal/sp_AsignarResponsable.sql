USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_AsignarResponsable') 
	BEGIN
		DROP PROCEDURE sp_AsignarResponsable;
	END
GO

CREATE PROCEDURE sp_AsignarResponsable
(
	@pIdPersonal INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION	
			DECLARE @idSucursal INT = 0
			SELECT 
				@idSucursal = SUC.Id 
			FROM PERSONAL PER
			INNER JOIN ASIGNACIONPERSONAL ASI ON ASI.IdPersonal = PER.Id
			INNER JOIN SUCURSAL SUC ON SUC.Id = ASI.IdSucursal

			IF @idSucursal IS NOT NULL
				BEGIN
					UPDATE SUCURSAL SET IdResponsable = @pIdPersonal WHERE Id = @idSucursal

					SET @codigo = 'OK';
					SET @msj = 'Se registró el encargado de forma satisfactoria.';
				END
			ELSE 
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'No se encontro sede del personal.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END