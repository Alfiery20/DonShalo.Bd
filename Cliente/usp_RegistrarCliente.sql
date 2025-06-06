USE DonShalo;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_RegistrarCliente') 
	BEGIN
		DROP PROCEDURE usp_RegistrarCliente;
	END
GO

CREATE PROCEDURE usp_RegistrarCliente
(
	@ptipoDocumento VARCHAR(1),
	@pnumeroDocumento VARCHAR(30),
	@pnombre VARCHAR(100),
	@papellidoPaterno VARCHAR(200),
	@papellidoMaterno VARCHAR(200),
	@pruc VARCHAR(100),
	@prazonSocial VARCHAR(2000),
	@pdireccion VARCHAR(2000),
	@pdireccionEntrega VARCHAR(3000),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @countClientes INT;
			SELECT @countClientes = COUNT(*) FROM CLIENTE WHERE TipoDocumento = @ptipoDocumento AND NumeroDocumento = @pnumeroDocumento

			IF(@countClientes > 0)
				BEGIN
					SET @codigo = 'E1';
					SET @msj = 'Numero de documento de cliente ya se encuentra registrado.';
				END
			ELSE
				BEGIN
					INSERT INTO CLIENTE(TipoDocumento, NumeroDocumento, Nombre, ApellidoPaterno, ApellidoMaterno, Ruc, RazonSocial, Dirreccion, DirreccionEntrega)
					VALUES(@ptipoDocumento, @pnumeroDocumento, @pnombre, @papellidoPaterno, @papellidoMaterno, @pruc, @prazonSocial, @pdireccion, @pdireccionEntrega)

					SET @codigo = 'OK';
					SET @msj = 'Se registró el cliente de forma satisfactoria.';
				END
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END