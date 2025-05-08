USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_EditarPersonal') 
	BEGIN
		DROP PROCEDURE sp_EditarPersonal;
	END
GO

CREATE PROCEDURE sp_EditarPersonal
(
	@pId INT,
	@pnombre VARCHAR(250),
	@papellidoPaterno VARCHAR(250),
	@papellidoMaterno VARCHAR(250),
	@ptelefono VARCHAR(20),
	@pcorreo VARCHAR(250),
	@pidRol INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @UsuarioCorreo INT

			SELECT @UsuarioCorreo = COUNT(Id) FROM PERSONAL WHERE Correo = @pcorreo AND Id <> @pId

			IF(@UsuarioCorreo != 0)
				BEGIN
					SET @codigo = 'E2';
					SET @msj = 'Correo existente.';
				END
			ELSE
				BEGIN
					UPDATE PERSONAL 
						SET Nombre = @pnombre, 
							ApellidoPaterno = @papellidoPaterno,
							ApellidoMaterno = @papellidoMaterno,
							Telefono = @ptelefono,
							Correo = @pcorreo, 
							IdRol = @pidRol
					WHERE Id = @pId

					SET @codigo = 'OK';
					SET @msj = 'Se edito el personal de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END