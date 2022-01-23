use instituto_tich
--1
UPDATE alumnos 
SET id_estatus = 3
WHERE id_estatus = 2;

--2
SELECT * FROM alumnos
UPDATE alumnos
SET segundoApellido = UPPER(segundoApellido)

--3
select segundoApellido from alumnos

UPDATE alumnos
SET segundoApellido = UPPER(LEFT(segundoApellido, 1)) + LOWER(SUBSTRING(segundoApellido, 2, LEN(segundoApellido)))

--4
SELECT *--SUBSTRING(CURP, 12, 2)
FROM instructores

UPDATE instructores
SET telefono ='55' + SUBSTRING(telefono, 3, LEN(telefono))
WHERE SUBSTRING(curp, 12, 2) = 'DF'

--5
select * from alumnos
SELECT a.id_alumno,
	  a.nombre_alumno,
	  e.id_estado,
	  e.nombre_estado,
	  c.id_curso,
	  c.fechaInicio,
	  ca.fechaInscripcion
FROM cursoAlumnos ca,
	alumnos a,
	cursos c,
	estados e
WHERE 1 =  1
AND e.id_estado = a.id_estado
AND a.id_alumno = ca.id_alumno
AND ca.id_curso = c.id_curso
AND (e.id_estado = 19 OR e.id_estado = 12)
--AND ca.calificacion <10


UPDATE cursoAlumnos
SET calificacion = calificacion + 1
WHERE calificacion <10;

--6
SELECT i.id_instructor,
	  i.nombre_instructor,
	  c.id_curso,
	  ct.id_catCurso,
	  ct.nombre_catCurso
FROM instructores i,
	 cursoInstructores ci,
	 cursos c,
	 cat_cursos ct
WHERE 1=1
AND	ct.id_catCurso = c.id_catCurso
AND c.id_curso = ci.id_curso
AND ci.id_instructor = i.id_instructor
AND ct.id_catCurso = 5

SELECT * FROM instructores;

UPDATE instructores
SET cuotaHora = (cuotaHora * 0.1) + cuotaHora
WHERE id_instructor IN (2, 4);

--7
 --A
SELECT * 
INTO Ejercicios.dbo.AlumnosTodos 
FROM alumnos;

--B
SELECT *
INTO Ejercicios.dbo.AlumnosHgo
FROM alumnos
WHERE 1 = 1
AND id_estado = 12;

--C
USE Ejercicios;

SELECT * FROM AlumnosHgo

UPDATE AlumnosHgo
SET telefono = '77' + SUBSTRING(telefono, 3, LEN(telefono))

--D
select * from AlumnosTodos
UPDATE AlumnosTodos 
SET telefono = (SELECT ah.telefono
				FROM AlumnosHgo ah
				WHERE ah.id_alumno = 6) 
WHERE id_alumno = 6

UPDATE AlumnosTodos 
SET telefono = (SELECT ah.telefono
				FROM AlumnosHgo ah
				WHERE ah.id_alumno = 16) 
WHERE id_alumno = 16