--1
SELECT * FROM alumnos
WHERE 1 = 1
AND primerApellido = 'Mendoza'
OR segundoApellido LIKE 'Mendoza';

--2
SELECT a.nombre_alumno + ' ' 
	  + a.primerApellido Nombre,
	   ea.nombre
FROM alumnos a,
	 estatus_alumnos ea
WHERE 1 = 1
AND ea.id_estatus = a.id_estatus
AND ea.nombre LIKE 'En capacitación';

--3
SELECT i.nombre_instructor + ' ' 
	  + i.primerApellido + ' '
	  + i.segundoApellido Nombre,
	  DATEDIFF(YEAR, i.fechaNacimiento, SYSDATETIME()) Edad
FROM instructores i
WHERE 1=1
AND DATEDIFF(YEAR, i.fechaNacimiento, SYSDATETIME()) > 30;

--4
SELECT a.nombre_alumno + ' ' 
	  + a.primerApellido  Nombre,
	  DATEDIFF(YEAR, a.fechaNacimiento, SYSDATETIME()) Edad
FROM alumnos a
WHERE 1 =1 
AND DATEDIFF(YEAR, a.fechaNacimiento, SYSDATETIME()) BETWEEN 20 AND 25;

--5
SELECT CONCAT (a.nombre_alumno ,' ' 
	  ,a.primerApellido)  Nombre,
	  e.nombre_estado Estado,
	  ea.nombre Estatus
FROM alumnos a
INNER JOIN estados e ON a.id_estado = e.id_estado
INNER JOIN estatus_alumnos ea ON a.id_estatus = ea.id_estatus
WHERE
(e.nombre_estado ='Oaxaca' AND ea.nombre ='En capacitación')
OR (e.nombre_estado = 'Campeche' AND ea.nombre = 'Prospecto');

--6
SELECT *
FROM alumnos a
WHERE 1=1
AND a.correo LIKE '%gmail%'

--7
SELECT *
FROM alumnos a
WHERE 1=1
AND DATENAME(MONTH,a.fechaNacimiento) = 'March'

--8
SELECT *
FROM alumnos
WHERE 1 = 1
AND DATEDIFF(YEAR, fechaNacimiento, DATEADD(YEAR, 5, SYSDATETIME())) = 30

--9
SELECT *
FROM alumnos
WHERE 1 =1
AND LEN(nombre_alumno) > 10

--10
SELECT *
FROM alumnos
WHERE 1 = 1
AND SUBSTRING (curp, 18,1) IN (0,1,2,3,4,5,6,7,8,9);

--11
SELECT a.nombre_alumno,
		ca.calificacion
FROM alumnos a,
	 cursoAlumnos ca
WHERE 1 = 1
AND a.id_alumno = ca.id_alumno
AND ca.calificacion > 8;

--12
SELECT *
FROM alumnos a
INNER JOIN estatus_alumnos ea ON a.id_estatus = ea.id_estatus
WHERE ea.nombre = 'Laborando' OR ea.nombre = 'Liberado'
AND a.sueldo > 15000

--13
SELECT *
FROM alumnos
WHERE 1=1
AND  (YEAR(fechaNacimiento) BETWEEN 1990 AND 1995)
AND (SUBSTRING(primerApellido, 1, 1) IN ('B', 'C', 'Z'));

--14
SELECT nombre_alumno,
	   curp,
	   fechaNacimiento
FROM alumnos
WHERE 1=1
AND CONVERT (DATE,SUBSTRING (curp, 5, 6)) <> fechaNacimiento;

--15
SELECT *
FROM alumnos
WHERE 1=1
AND  DATENAME(MONTH, fechaNacimiento) = 'April'
AND (SUBSTRING(primerApellido, 1, 1) = 'A')
AND DATEDIFF(YEAR, fechaNacimiento, SYSDATETIME()) BETWEEN 21 AND 30;

--16
SELECT *
FROM alumnos
WHERE 1 = 1
AND nombre_alumno LIKE'%Luis%';

--17
SELECT cat.nombre_catCurso nombreCurso,
	   c.fechaInicio,
	   c.fechaTermino,
	   COUNT(a.id_alumno) 'cantidad Alumnos',
	   AVG(ca.calificacion) 'promedio Calificaciones'
FROM cat_cursos cat,
	cursoAlumnos ca,
	cursos c,
	alumnos a
WHERE 1=1
AND cat.id_catCurso = c.id_catCurso
AND c.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
AND YEAR(c.fechaInicio) = 2021
GROUP BY cat.nombre_catCurso,
	   c.fechaInicio,
	   c.fechaTermino;

--18
SELECT e.nombre_estado Estado,
	   COUNT (a.id_alumno) Total,
	   AVG(ca.calificacion) PromCalif,
	   AVG(a.sueldo) PromSueldo
FROM alumnos a,
	estados e,
	cursoAlumnos ca
WHERE 1=1
AND e.id_estado = a.id_estado
AND a.id_alumno = ca.id_alumno
AND ca.calificacion > 6
GROUP BY e.nombre_estado
HAVING COUNT (a.id_alumno) > 1