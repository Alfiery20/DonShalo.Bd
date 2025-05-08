USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_RegistrarUsuario') 
	BEGIN
		DROP PROCEDURE sp_RegistrarUsuario;
	END
GO

CREATE PROCEDURE sp_RegistrarUsuario
(
	@ptipoDocumento VARCHAR(10),
	@pnumeroDocumento VARCHAR(20),
	@pnombre VARCHAR(250),
	@papellidoPaterno VARCHAR(250),
	@papellidoMaterno VARCHAR(250),
	@ptelefono VARCHAR(20),
	@pcorreo VARCHAR(250),
	@pclave VARCHAR(MAX),
	@pidRol INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @UsuarioCorreo INT, 
					@UsuarioNumeroDocumento INT

			SELECT @UsuarioCorreo = COUNT(Id) FROM PERSONAL WHERE Correo = @pcorreo
			SELECT @UsuarioNumeroDocumento = COUNT(Id) FROM PERSONAL WHERE NumeroDocumento = @pnumeroDocumento

			IF(@UsuarioNumeroDocumento != 0)
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'Numero documento existente.';
				END
			ELSE IF(@UsuarioCorreo != 0)
				BEGIN
					SET @codigo = 'E2';
					SET @msj = 'Correo existente.';
				END
			ELSE
				BEGIN
					DECLARE @codigoPersonal VARCHAR(10) = ''
					SELECT TOP 1 @codigoPersonal = (Id + 1) FROM PERSONAL ORDER BY ID DESC
					INSERT INTO PERSONAL(
							CodigoPersonal, TipoDocumento, NumeroDocumento, 
							Nombre, ApellidoPaterno, 
							ApellidoMaterno, Telefono, 
							Correo, Clave, Estado, IdRol)
					VALUES(RIGHT(REPLICATE('0', 10) + @codigoPersonal, 10), @ptipoDocumento, @pnumeroDocumento,
							@pnombre, @papellidoPaterno, 
							@papellidoMaterno, @ptelefono,
							@pcorreo, @pclave, 'A', @pidRol)

					SET @codigo = 'OK';
					SET @msj = 'Se registró el personal de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END