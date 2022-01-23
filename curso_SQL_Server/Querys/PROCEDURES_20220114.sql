/*1. Crear un store procedureCodigoAscii que imprima los caracteres con su respectivo código ascii en decimal. 
Solo para los caracteres cuyo código sea mayor a 32*/
ALTER PROCEDURE procedureCodigoAscii 
AS
BEGIN
	DECLARE @i INT,
			@PrintMessage NVARCHAR(50),
			@ASCI CHAR(2),
			@CARACTER int;
	SET @i = 32;
	
	WHILE @i <=255
	BEGIN
		SET @ASCI = CHAR(@i);
		SET @CARACTER = ASCII(@ASCI);
		SET @PrintMessage = @ASCI + 
							N'  ' + 
							N'ASCII => ' + 
							N'  ';
		PRINT @PrintMessage + CAST(@CARACTER AS nvarchar(10));
		SET @i = @i + 1;
	END;
END;

EXECUTE procedureCodigoAscii;


/*2. Crear el store procedure Factorial que reciba como parámetro un número entero y que devuelve el factorial calculado 
en un parámetro de salida*/
CREATE PROCEDURE FactorialNum @num INT, 
@Factor INT OUT
AS

BEGIN
	DECLARE @i INT = 1;
	SET @Factor = 1
	WHILE @i <= @num
	BEGIN
		IF @num <= 1
			PRINT @Factor;
		ELSE
			SET @Factor = @Factor * @i;
			SET @i +=1;
	END;
	PRINT @Factor;
END;

DECLARE @Result INT;
EXECUTE FactorialNum 
					@num = 6,
					@Factor = @Result;

--3. Crear las siguientes Tablas
use instituto_tich

CREATE TABLE saldos(
id INT  IDENTITY(1,1) NOT NULL PRIMARY KEY,
Nombre VARCHAR (50),
saldo DECIMAL(9,2)
);

CREATE TABLE Transacciones (
id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
idOrigen INT NOT NULL FOREIGN KEY REFERENCES saldos (id),
idDestino INT NOT NULL FOREIGN KEY REFERENCES saldos(id),
monto DECIMAL(9,2) NOT NULL
);

SET IDENTITY_INSERT [dbo].[saldos] ON 
INSERT INTO saldos (id,
					Nombre,
					saldo)
			VALUES (1,
					'Jorge Alonso',
					50000.50);

INSERT INTO saldos (id,
					Nombre,
					saldo)
			VALUES (2,
					'Gerardo Suarez Vazquez',
					35000.75);

SET IDENTITY_INSERT [dbo].[saldos] OFF
SELECT * FROM saldos;

/* 4. Crear un store procedure “Transacciones” que recibirá como parámetros el id de la cuenta de origen, 
el id de la cuenta destino y el monto de la transacción. Se deberá crear dentro de una transacción a 
fin de que los saldos de las cuentas involucradas y la tabla de transacciones quede perfectamente consistente.*/
USE instituto_tich
ALTER PROCEDURE Transactions @idOrigen INT,
@idDestino INT,
@Monto DECIMAL(9,2)
AS
BEGIN
	
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE saldos
			SET saldo = saldo - @Monto
			WHERE id = @idOrigen;

			UPDATE saldos
			SET saldo = saldo + @Monto
			WHERE id = @idDestino;

			INSERT INTO Transacciones VALUES (@idOrigen,
											   @idDestino,
											   @Monto);			
			COMMIT TRANSACTION
		PRINT 'La Transaccion fue Exitosa';
	END TRY
	BEGIN CATCH	
		ROLLBACK TRANSACTION
		PRINT 'La Transaccion No se puedo realizar';
	END CATCH
END;


EXECUTE dbo.Transactions 
					@idOrigen = 2,
					@idDestino = 1,
					@Monto = 300000.00;

SELECT * FROM saldos
SELECT * FROM Transacciones;
DELETE FROM Transacciones

USE instituto_tich;

ALTER TABLE saldos
add CONSTRAINT CK_saldoPositivo
check (saldo >=0);

alter table libros
 add constraint CK_libros_precio_positivo
 check (preciomin>=0 and preciomay>=0);