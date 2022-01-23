USE instituto_tich
--1. Realizar una vista vAlumnos que obtenga el siguiente resultado.
CREATE VIEW vAlumnos
AS
	SELECT a.id_alumno nombre,
		   a.primerApellido primerApellido,
		   a.segundoApellido segundoApellido,
		   a.correo correo,
		   a.telefono telefono,
		   a.curp curp,
		   e.nombre_estado Estado,
		   ea.nombre Estatus
	FROM alumnos a,
		 estados e,
		 estatus_alumnos ea
	WHERE 1 = 1
	AND a.id_estado = e.id_estado
	AND a.id_estatus = ea.id_estatus

SELECT * FROM vAlumnos

/*2. Realizar el procedimiento almacenado consultarEstados el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Estados.
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/
CREATE PROCEDURE consultarEstados @idEstado INT 
AS
BEGIN
	IF @idEstado = -1
		SELECT *
		FROM estados;
	ELSE IF @idEstado >= 1
		SELECT * 
		FROM estados
		WHERE id_estado = @idEstado
END

EXECUTE consultarEstados @idEstado = 19

/*3. Realizar el procedimiento almacenado consultarEstatusAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla estatusAlumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/
CREATE PROCEDURE consultarEstatusAlumnos @idEstatus INT 
AS
BEGIN
	IF @idEstatus = -1
		SELECT *
		FROM estatus_alumnos
	ELSE IF @idEstatus >= 1
		SELECT * 
		FROM estatus_alumnos
		WHERE id_estatus = @idEstatus
END

EXECUTE consultarEstatusAlumnos @idEstatus = 5

/*4. Realizar el procedimiento almacenado consultarAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Alumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/
ALTER PROCEDURE consultarAlumnos @idAlumno INT 
AS
BEGIN
	IF @idAlumno = -1
		SELECT a.id_alumno id,
			   a.nombre_alumno nombre,
			   a.primerApellido primerApellido,
			   a.segundoApellido segundoApelllido,
			   a.correo correo,
			   a.fechaNacimiento fechaNaci,
			   a.telefono telefono,
			   a.curp curp,
			   e.nombre_estado Estado,
			   ea.nombre Estatus
		FROM alumnos a,
			 estados e,
			 estatus_alumnos ea
	   WHERE 1 = 1
	   AND a.id_estado = e.id_estado
	   AND a.id_estatus = ea.id_estatus
	ELSE IF @idAlumno >= 1
		SELECT a.id_alumno id,
			   a.nombre_alumno nombre,
			   a.primerApellido primerApellido,
			   a.segundoApellido segundoApelllido,
			   a.correo correo,
			   a.fechaNacimiento fechaNaci,
			   a.telefono telefono,
			   a.curp curp,
			   e.nombre_estado Estado,
			   ea.nombre Estatus
		FROM alumnos a,
			 estados e,
			 estatus_alumnos ea
		WHERE 1 = 1
		AND a.id_estado = e.id_estado
	    AND a.id_estatus = ea.id_estatus
END

EXECUTE consultarAlumnos @idAlumno = 5

/*5. Realizar el procedimiento almacenado consultarEAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Alumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/

CREATE PROCEDURE consultarEAlumnos @idAlumno INT 
AS
BEGIN
	IF @idAlumno = -1
		SELECT a.id_alumno id,
			   a.nombre_alumno nombre,
			   a.primerApellido primerApellido,
			   a.segundoApellido segundoApelllido,
			   a.fechaNacimiento fechaNaci,
			   a.correo correo,
			   a.telefono telefono,
			   a.curp curp,
			   a.id_estado idEstadoOrigen,
			   a.id_estatus idEstatus
		FROM alumnos a
	ELSE IF @idAlumno >= 1
		SELECT a.id_alumno id,
			   a.nombre_alumno nombre,
			   a.primerApellido primerApellido,
			   a.segundoApellido segundoApelllido,
			   a.fechaNacimiento fechaNaci,
			   a.correo correo,
			   a.telefono telefono,
			   a.curp curp,
			   a.id_estado idEstadoOrigen,
			   a.id_estatus idEstatus
		FROM alumnos a
		WHERE id_alumno = @idAlumno
END

EXECUTE consultarEAlumnos @idAlumno = 5

/*6. Realizar el procedimiento almacenado actualizarEstatusAlumnos 
el cual recibirá como parámetros el id del Alumno al cual se le requiere cambiar el estatus y el valor del nuevo estatus.*/
ALTER PROCEDURE actualizarEstatusAlumnos @idAlumno INT,
@idEstatusNuevo INT
AS
BEGIN
	UPDATE alumnos
	SET id_estatus = @idEstatusNuevo
	WHERE id_alumno  = @idAlumno
END;

EXECUTE actualizarEstatusAlumnos @idAlumno = 5,
						  @idEstatusNuevo = 1

/*7. Realizar el procedimiento almacenado agregarAlumnos el cual recibirá como parámetros los valores de cada una de las columnas 
de la tabla de Alumnos con los cuales se insertará el registro a la tabla Alumnos. 
El procedimiento deberá regresar el id con el que se creo el registro en formato de entero.*/
CREATE PROCEDURE agregarAlumnos
@NOMBRE VARCHAR (60),
@primerApellido VARCHAR (50),
@segundoApellido VARCHAR (50),
@correo VARCHAR (80),
@telefono NCHAR(10),
@fechaNacimiento DATE,
@curp char(18),
@sueldo DECIMAL(9,2),
@id_estado INT,
@id_estatus INT

AS
BEGIN
	INSERT INTO alumnos (nombre_alumno,
						 primerApellido,
						 segundoApellido,
						 correo,
						 telefono,
						 fechaNacimiento,
						 curp,
						 sueldo,
						 id_estado,
						 id_estatus)
				VALUES (@NOMBRE,
						@primerApellido,
						@segundoApellido,
						@correo,
						@telefono,
						@fechaNacimiento,
						@curp,
						@sueldo,
						@id_estado,
						@id_estatus);

	SELECT MAX(id_alumno)
	FROM alumnos;
END

EXECUTE agregarAlumnos @NOMBRE = 'Asael',
						@primerApellido = 'Espinoza',
						@segundoApellido = 'Hernandez',
						@correo = 'dezzpickH@gmail.com',
						@telefono = '9711240654',
						@fechaNacimiento = '1993-06-12',
						@curp = 'EIHA930612HOCSRS05',
						@sueldo = 15000.00,
						@id_estado = 19,
						@id_estatus = 3

/*8. Realizar el procedimiento almacenado actualizarAlumnos el cual recibirá como parámetros los valores de cada una de las columnas 
de la tabla de Alumnos con los cuales se actualizarán los valores que existen en la tabla Alumnos del registro que corresponda 
al id enviado como parámetro. El procedimiento deberá regresar la cantidad de registros actualizados.*/
CREATE PROCEDURE actualizarAlumnos 
@idAlumno INT,
@NOMBRE VARCHAR (60),
@primerApellido VARCHAR (50),
@segundoApellido VARCHAR (50),
@correo VARCHAR (80),
@telefono NCHAR(10),
@fechaNacimiento DATE,
@curp char(18),
@sueldo DECIMAL(9,2),
@id_estado INT,
@id_estatus INT
AS
BEGIN
	UPDATE alumnos
	SET nombre_alumno =@NOMBRE,
		primerApellido = @primerApellido,
		segundoApellido =@segundoApellido,
		correo = @correo,
		telefono = @telefono,
		fechaNacimiento = @fechaNacimiento,
		curp = @curp,
		sueldo = @sueldo,
		id_estado = @id_estado,
		id_estatus = @id_estatus
	WHERE id_alumno = @idAlumno;

	SELECT @@ROWCOUNT  

	IF @@ROWCOUNT = 0
		PRINT 'No se actualizo ningun registro'
END

EXECUTE actualizarAlumnos @idAlumno = 31,
						@NOMBRE = 'Julio Cesar',
						@primerApellido = 'Bartolo',
						@segundoApellido = 'Terán',
						@correo = 'bartolo@gmail.com',
						@telefono = '9711052755',
						@fechaNacimiento = '1994-02-28',
						@curp = 'BATJ940228HOCRRL07',
						@sueldo = 17000.00,
						@id_estado = 1,
						@id_estatus = 4

/*9. Realizar el procedimiento almacenado eliminarAlumnos el cual recibirá como parámetros el valor del id del registro del alumno
del que se requiere eliminar.
Primeramente se deberán eliminar todos los registros de la Tabla de CursosAlumnos los cuales tengan el id del alumno a eliminar 
y posteriormente el eliminar al alumno de la Tabla de Alumnos.
Esto deberá considerarse como una transacción ya que se trate de actualizar dos tablas relacionadas.
En caso de que no se haya eliminado el registro de la tabla de Alumnos deberá levantar una excepción.*/

ALTER PROCEDURE eliminarAlumnos @idAlumno INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM cursoAlumnos WHERE id_alumno = @idAlumno;

			DELETE FROM alumnos WHERE id_alumno = @idAlumno;
		COMMIT TRANSACTION
		PRINT 'La Transaccion fue Exitosa';
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT ERROR_MESSAGE() AS ErrorMessage;
		Throw;
		PRINT 'La Transaccion No se puedo realizar';
	END CATCH
END

EXECUTE eliminarAlumnos @idAlumno= 1;

SELECT * FROM cursoAlumnos
SELECT * FROM alumnos

/*10. Crear el trigger Trigger_EliminarAlumnos el cual se debe ejecutar cuando se elimina un registro de la tabla de Alumnos. 
Este trigger deberá insertar un registro en la Tabla AlumnosBaja del alumno eliminado.*/
CREATE TRIGGER Trigger_EliminarAlumnos
ON alumnos
AFTER DELETE
AS
BEGIN
	INSERT INTO alumnosBaja (nombreAlumno,
							 primerApellido,
							 segundoApellido,
							 fechaBaja)
	SELECT d.nombre_alumno,
		   d.primerApellido,
		   d.segundoApellido,
		   GETDATE()
	FROM deleted d;
END
GO

DELETE FROM alumnos WHERE id_alumno = 1;

select * from alumnosBaja

--11. Obtener un respaldo de su base de datos InstitutoTich

BACKUP DATABASE instituto_tich 
  TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\instituto_tich.bak',  
  DISK = N'C:\Users\Tichs\Documents\curso_SQL_Server\instituto_tich.bak' 
  WITH NOFORMAT, NOINIT,  NAME = N'SQLShackDemo-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  
  STATS = 10
  GO

  USE instituto_tich;
GO
BACKUP DATABASE instituto_tich
TO DISK = 'C:\Users\Tichs\Documents\instituto_tich.bak'
   WITH FORMAT,
      MEDIANAME = 'SQLServerBackups',
      NAME = 'Full Backup of instituto_tich';
GO

/*13. Sobre la base de datos PruebasTich crear el store Procedure spEliminaAlumnosCurso el cual deberá eliminar los alumnos 
que se encuentren en un determinado curso por lo que recibirá como parámetro el nombre del curso.*/
use PruebasTich;

CREATE PROCEDURE spEliminaAlumnosCurso @nombreCurso VARCHAR (50)
AS
BEGIN
	/*DELETE FROM cursoAlumnos
	WHERE id_curso IN (SELECT c.id_curso
					  FROM cursos c,
							cat_cursos cat
					   WHERE cat.id_catCurso = c.id_catCurso
					   AND cat.nombre_catCurso = 'Bases de datos SQL Server');*/

	DELETE FROM alumnos
	WHERE id_alumno IN (SELECT a.id_alumno
						FROM alumnos a,
							cursoAlumnos ca,
							cursos c,
							cat_cursos cat
						WHERE 1 =1
						AND cat.id_catCurso = c.id_catCurso
						AND c.id_curso = ca.id_curso
						AND ca.id_alumno = a.id_alumno
						AND cat.nombre_catCurso = @nombreCurso)
END;


EXECUTE spEliminaAlumnosCurso @nombreCurso = 'Bases de datos SQL Server';
