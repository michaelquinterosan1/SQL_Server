USE instituto_tich;

---1
CREATE FUNCTION Suma ( @Num1 INT,
					   @Num2 INT)
RETURNS INT AS

BEGIN
	DECLARE @SUMA INT;
	SET @SUMA = @Num1 + @Num2;
	RETURN @SUMA
END;

SELECT dbo.Suma(1,2);

---2. Crear la función GetGenero la cual reciba como parámetros el curp y regrese el género al que pertenece
ALTER FUNCTION GetGenero
(@curp VARCHAR(20))
RETURNS VARCHAR(20) AS

BEGIN
	DECLARE @gen CHAR(1),
			@genero VARCHAR(20);
	SET @gen = SUBSTRING(@curp, 11,1);

	IF @gen = 'M'
		SET @genero = 'Femenino';
	ELSE
		SET @genero = 'Masculino';
	RETURN @genero;
END;

SELECT dbo.GetGenero(a.curp)
FROM alumnos a
WHERE A.id_alumno = 1;

---3. Crear la función GetFechaNacimiento la cual reciba como parámetros el curp y regrese la fecha de nacimiento. 
--La fecha de nacimiento deberá completarse a 4 dígitos, debiéndose determinar si es año dos mil o año mil novecientos
CREATE FUNCTION GetFechaNacimiento (@curp CHAR(18))
RETURNS DATE AS

BEGIN
	DECLARE @getFechaNacimiento VARCHAR(6),
			@fechaNacimiento DATE;
	SET @getFechaNacimiento = SUBSTRING(@curp, 5, 10);
	SET @fechaNacimiento = CONVERT(DATE, @getFechaNacimiento);

	RETURN @fechaNacimiento;
END;

SELECT dbo.GetFechaNacimiento(a.curp) 
FROM alumnos a
WHERE a.id_alumno = 1

---4. Crear la función GetidEstado la cual reciba como parámetros el curp y regrese el Id Estado con base en la siguiente tabla.
CREATE FUNCTION GetidEstado (@curp CHAR(18))
RETURNS INT AS

BEGIN
	DECLARE @estado CHAR(2),
			@idEstado INT;
	SET @estado = SUBSTRING(@curp,12,2);

	RETURN 
	 CASE 
		WHEN @estado='AS'	THEN  1
		WHEN @estado='BC'	THEN  2
		WHEN @estado='BS'	THEN  3
		WHEN @estado='CC'	THEN  4
		WHEN @estado='CH'	THEN  5
		WHEN @estado='CS'	THEN  6
		WHEN @estado='CL'	THEN  7
		WHEN @estado='CM'	THEN  8
		WHEN @estado='DG'	THEN  9
		WHEN @estado='GT'	THEN  10
		WHEN @estado='GR'	THEN  11
		WHEN @estado='HG'	THEN  12
		WHEN @estado='JC'	THEN  13
		WHEN @estado='MC'	THEN  14
		WHEN @estado='MN'	THEN  15
		WHEN @estado='MS'	THEN 16
		WHEN @estado='NT'	THEN 17
		WHEN @estado='NL'	THEN 18
		WHEN @estado='OC'	THEN 19
		WHEN @estado='PL'	THEN 20
		WHEN @estado='QT'	THEN 21
		WHEN @estado='QR'	THEN 22
		WHEN @estado='SP'	THEN 23
		WHEN @estado='SL'	THEN 24
		WHEN @estado='SR'	THEN 25
		WHEN @estado='TC'	THEN 26
		WHEN @estado='TS'	THEN 27
		WHEN @estado='TL'	THEN 28
		WHEN @estado='VZ'	THEN 29
		WHEN @estado='YN'	THEN 30
		ELSE 31
	END
END;

SELECT dbo.GetidEstado(a.curp)
FROM alumnos a
WHERE a.id_alumno = 1

--5. Realizar una función llamada Calculadora que reciba como parámetros dos
--enteros y un operador (+,-,*,/,%) regresando el resultado de la operación se
--deberá cuidar de no hacer división entre cero

ALTER FUNCTION Calculadora 
(@Num1 INT,
 @Num2 INT,
 @Operador CHAR(1))
RETURNS INT AS
BEGIN
	DECLARE @Resultado INT;

	IF @Operador = '+'
		SET @Resultado = @Num1 + @Num2;
	ELSE IF @Operador = '-'
		SET @Resultado = @Num1 - @Num2;
	ELSE IF @Operador = '*'
		SET @Resultado = @Num1 * @Num2;
	ELSE IF @Operador = '/'
		IF @Num2 <>0
			SET @Resultado = @Num1 / @Num2;
	ELSE IF @Operador = '%'
		SET @Resultado = @Num1 % @Num2;
	
	RETURN @Resultado;
END;

SELECT dbo.Calculadora(20,3,'%')


--6. Realizar una función llamada GetHonorarios que calcule el importe a pagar a un
--determinado instructor y curso, por lo que la función recibirá como parámetro el id
--del instructor y el id del curso.
ALTER FUNCTION GetHonorarios
(@id_istructor INT,
 @id_curso INT)
 RETURNS DECIMAL(9,2) AS

 BEGIN
	DECLARE @honorario DECIMAL(9,2);

	RETURN
	(SELECT (i.cuotaHora * cat.horas)
	FROM instructores i,
		cursoInstructores ci,
		cursos c,
		cat_cursos cat
	WHERE 1 = 1
	AND i.id_instructor = ci.id_instructor
	AND ci.id_curso = c.id_curso
	AND c.id_catCurso = cat.id_catCurso
	AND i.id_instructor = @id_istructor
	AND ci.id_curso = @id_curso);
	
 END;

 SELECT dbo.GetHonorarios(2,3)

 SELECT i.id_instructor,
		i.nombre_instructor,
		i.curp,
		c.id_curso,
		cat.nombre_catCurso,
		i.cuotaHora,
		cat.horas,
		(i.cuotaHora * cat.horas)
 FROM instructores i,
	 cursoInstructores ci,
	 cursos c,
	 cat_cursos cat
WHERE 1 =1
AND i.id_instructor = ci.id_instructor
AND ci.id_curso = c.id_curso
AND c.id_catCurso = cat.id_catCurso
AND i.id_instructor = 2
AND c.id_curso = 3

---7. Crear la función GetEdad la cual reciba como parámetros la fecha de nacimiento y
---la fecha a la que se requiere realizar el cálculo de la edad. Los años deberán se
---cumplidos, considerando mes y día

ALTER FUNCTION GetEdad
(@fechaNac DATE,
 @fechaCalc DATE)
 RETURNS INT AS

 BEGIN
	DECLARE @Edad INT,
			@EdadDia INT,
			@EdadMes INT,
			@Anio INT;

	SET @Edad = DATEDIFF(YEAR, @fechaNac, @fechaCalc);
	SET @EdadDia = DATEDIFF(DAY, @fechaNac, @fechaCalc)
	SET @EdadMes = ABS( (DATEPART(MONTH,@fechaNac)) - (DATEPART(MONTH, @fechaCalc)));

	IF @EdadDia =0
		IF @EdadMes < 12
			SET @Anio= @Edad - 1;
		ELSE IF @EdadMes=0
		SET @Anio= @Edad;
	ELSE IF @EdadDia < 365
		--SET @Anio = @Edad - 1;
		IF @EdadMes < 12
			SET @Anio= @Edad - 1;
		ELSE IF @EdadMes=0
			SET @Anio = @Edad;
	RETURN @Edad;
 END;

 SELECT dbo.GetEdad('1993-12-04', '2022-12-04');

 SELECT ABS( DATEPART(DAY, (CONVERT(DATETIME,'1993-12-04'))) - DATEPART(DAY, (CONVERT(DATETIME, '2022-01-14'))));

 SELECT CONVERT(DATETIME, '1993-12-04' )
 SELECT DATEDIFF(year,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');

 ---Crear la función Factorial la cual reciba como parámetros un número entero y
--regrese como resultado el factorial.
ALTER FUNCTION Factorial
(@Num INT)
RETURNS INT AS

BEGIN
	DECLARE @Factor INT,
			@i INT;
	
  IF @Num <= 1
    SET @Factor = 1;
  ELSE
    SELECT @Factor = @Num * (dbo.Factorial(@Num - 1));
  RETURN @Factor;
END;

PRINT dbo.Factorial(6);

---9. Crear la función ReembolsoQuincenal la cual reciba como parámetros un
--SueldoMensual y regrese como resultado el Importe de Reembolso quincenal,
--considerando que el importe total a reembolsar es igual a dos meses y medio de
--sueldo, y el periodo de reembolso es de 6 meses

CREATE FUNCTION ReembolsoQuincenal
(@sueldoM DECIMAL(9,2))
RETURNS DECIMAL(9,2) AS

BEGIN
	DECLARE @reembolsoQ DECIMAL(9,2),
			@TotalReembolso DECIMAL(9,2);
	SET @TotalReembolso = (@sueldoM * 2.5);
	SET @reembolsoQ = @TotalReembolso / 12;
	
	RETURN @reembolsoQ;
END;

PRINT dbo.ReembolsoQuincenal(15000.00)

---10. Realizar una función que calcule el impuesto que debe pagar un instructor para un
--determinado curso. De tal manera que la función recibirá id de un instructor y el id
--del curso correspondiente.
--El cálculo del impuesto se realiza de la siguiente forma:
--Determinar el porcentaje que aplicará dependiendo del estado de nacimiento
--Chiapas = 5 %
--Sonora = 10 %
--Veracruz = 7 %
--El resto del país 8 %
--El impuesto se obtendrá aplicando el porcentaje al total de la cuota por hora por la
--cantidad de horas del curso
--El Estado de Origen se obtendrá de la posición 12 y 13 del curp de acuerdo con la
--siguiente tabla

CREATE FUNCTION ImpuestoIstructor
(@id_istructor INT,
 @id_curso INT)
 RETURNS DECIMAL(9,2) AS

 BEGIN
	DECLARE @estado INT, @impuesto DECIMAL(9,2);
	SET @estado = (SELECT dbo.GetidEstado(i.curp)
				 FROM instructores i
				 WHERE i.id_instructor = @id_istructor);
	IF @estado = 6
		SET @impuesto = ((SELECT dbo.GetHonorarios(@id_istructor, @id_curso)) * 0.05);
	ELSE IF @estado = 25
		SET @impuesto = ((SELECT dbo.GetHonorarios(@id_istructor, @id_curso)) * 0.1);
	ELSE IF @estado = 29
		SET @impuesto = ((SELECT dbo.GetHonorarios(@id_istructor, @id_curso)) * 0.07);
	ELSE 
		SET @impuesto = ((SELECT dbo.GetHonorarios(@id_istructor, @id_curso)) * 0.08);
	
	RETURN @impuesto;
 END;

  SELECT dbo.ImpuestoIstructor(2,3)

---11. Haciendo uso de la función GetEdad, obtener una relación de alumnos con la edad
--a la fecha de inscripción, y la edad actual. De aquellos alumnos que actualmente
--tengan más de 25 años.

SELECT a.id_alumno,
	   a.fechaNacimiento,
	   a.nombre_alumno,
	   ca.fechaInscripcion,
	   DATEDIFF (YEAR, a.fechaNacimiento, ca.fechaInscripcion),
	   DATEDIFF(YEAR, a.fechaNacimiento, GETDATE()),
	   dbo.GetEdad(a.fechaNacimiento, ca.fechaInscripcion) EdadIncripcion,
	   dbo.GetEdad(a.fechaNacimiento, GETDATE()) EdadActual
FROM alumnos a,
	cursoAlumnos ca,
	cursos C
WHERE 1 = 1
AND a.id_alumno = ca.id_alumno
AND C.id_curso = CA.id_curso
AND dbo.GetEdad(a.fechaNacimiento, GETDATE()) = 25;

/*12. Realizar una función que determine el porcentaje a descontar en los reembolsos,
con base a la cantidad de meses en que se realizará el reembolso y el sueldo
mensual logrado, de acuerdo al siguiente procedimiento:
a. El porcentaje de descuento será en función de la cantidad de mensualidades en que se realizará el reembolso.
b. La cantidad máximo de meses para realizar el reembolso es de 6 meses
c. El porcentaje máximo de descuento a otorgar será el que resulte el sueldo mensual entre 1,000
i. Ejemplo : Si el sueldo mensual es de 20,000 pesos el descuento será del 20 %
d. El porcentaje máximo de descuento será otorgado si el reembolso total se realiza cuando le corresponde efectuar 
la primera parcialidad de dicho reembolso
e. Los porcentaje de descuento a otorgar disminuirá inversamente proporcional a la cantidad de meses en que se cubrirá 
totalmente el reembolso, de tal forma que si el reembolso se cubre en la mitad del periodo máximo (3 meses = 6 meses /2),
el porcentaje a descontar será la mitad del porcentaje máximo ( en el ejemplo 10% = 20% / 2), y si el reembolso
se realiza en el máximo del plazo, el descuento a otorgar será cero.*/
ALTER FUNCTION ReembolsoTich
(@sueldoM	DECIMAL(9,2),
	@NumMeses INT)
RETURNS INT AS

BEGIN
	DECLARE	@Porcentaje INT;

	RETURN 
		CASE
			WHEN @NumMeses = 1 THEN (@sueldoM / 1000) /1
			WHEN @NumMeses = 2 THEN (@sueldoM / 1000) /1.5
			WHEN @NumMeses = 3 THEN ((@sueldoM / 1000)) / 2
			WHEN @NumMeses = 4 THEN (@sueldoM / 1000) /2.5
			WHEN @NumMeses = 5 THEN (@sueldoM / 1000) /3
			WHEN @NumMeses = 6 THEN (@sueldoM / 1000) * 0
		END;
END;

PRINT dbo.ReembolsoTich(20000.00, 5)

/*13. Hacer una función que convierta a mayúsculas la primera letra de cada palabra de un cadena de caracteres recibida.*/
CREATE FUNCTION Initcap
(@string VARCHAR(255))
RETURNS VARCHAR(255) AS

BEGIN
	RETURN UPPER(LEFT(@string,1)) + SUBSTRING(@string, 2, LEN(@string));
END;

PRINT dbo.Initcap('hola');