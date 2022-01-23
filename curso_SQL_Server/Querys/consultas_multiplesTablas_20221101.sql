---1---
SELECT i.nombre_instructor nombre,
		i.primerApellido 'Apellido Paterno',
		i.segundoApellido 'Apellido Materno',
		i.rfc rfc,
		i.cuotaHora 'Cuota por Hora',
		i.activo
FROM instructores i;

--2--
SELECT ct.clave_catCurso clave,
	   ct.horas,
		c.fechaInicio 'fecha Inicio',
		c.fechaTermino 'fecha Termino'
FROM cursos c,
	cat_cursos ct
WHERE ct.id_catCurso = c.id_catCurso ;

SELECT ct.clave_catCurso clave,
	   ct.horas,
		c.fechaInicio 'fecha Inicio',
		c.fechaTermino 'fecha Termino'
FROM cursos c
INNER JOIN cat_cursos ct
	ON ct.id_catCurso = c.id_catCurso;

---3--
SELECT a.nombre_alumno nombre,
	   a.primerApellido primerApellido,
	   a.segundoApellido segundoApellido,
	   a.curp curp,
	   e.nombre_estado estado,
	   ea.nombre estatus
FROM alumnos a,
	estados e,
	estatus_alumnos ea
WHERE 1=1
AND e.id_estado = a.id_estado
AND ea.id_estatus = a.id_estatus;

SELECT a.nombre_alumno nombre,
	   a.primerApellido primerApellido,
	   a.segundoApellido segundoApellido,
	   a.curp curp,
	   e.nombre_estado estado,
	   ea.nombre estatus
FROM alumnos a
INNER JOIN  estados e ON e.id_estado = a.id_estado
INNER JOIN estatus_alumnos ea ON ea.id_estatus = a.id_estatus;

--4--
SELECT i.nombre_instructor + ' ' + i.primerApellido + ' ' + i.segundoApellido instructor,
	   i.cuotaHora cuotaHora,
	   ct.nombre_catCurso nombre,
	   c.fechaInicio fechaInicio,
	   c.fechaTermino fechaTermino
FROM instructores i,
	 cursos c,
	 cat_cursos ct,
	 cursoInstructores ci
WHERE 1=1
AND i.id_instructor = ci.id_instructor
AND ci.id_curso = c.id_curso
AND ct.id_catCurso = c.id_catCurso;

SELECT i.nombre_instructor + ' ' + i.primerApellido + ' ' + i.segundoApellido instructor,
	   i.cuotaHora cuotaHora,
	   ct.nombre_catCurso nombre,
	   c.fechaInicio fechaInicio,
	   c.fechaTermino fechaTermino
FROM instructores i
INNER JOIN cursoInstructores ci ON i.id_instructor = ci.id_instructor
INNER JOIN cursos c ON ci.id_curso = c.id_curso
INNER JOIN cat_cursos ct ON ct.id_catCurso = c.id_catCurso;

--5-.-
SELECT a.nombre_alumno nombre,
	  a.primerApellido,
	  a.segundoApellido,
	  e.nombre_estado,
	  ct.nombre_catCurso,
	  ca.fechaInscripcion,
	  c.fechaInicio,
	  c.fechaTermino,
	  ca.calificacion
FROM alumnos a,
	estados e,
	cat_cursos ct,
	cursoAlumnos ca,
	cursos c
WHERE 1=1
AND ct.id_catCurso = c.id_catCurso
AND c.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
AND a.id_estado = e.id_estado;

SELECT a.nombre_alumno nombre,
	  a.primerApellido,
	  a.segundoApellido,
	  e.nombre_estado,
	  ct.nombre_catCurso,
	  ca.fechaInscripcion,
	  c.fechaInicio,
	  c.fechaTermino,
	  ca.calificacion
FROM alumnos a
INNER JOIN estados e ON a.id_estado = e.id_estado
INNER JOIN cursoAlumnos ca ON a.id_alumno = ca.id_alumno
INNER JOIN cursos c ON c.id_curso = ca.id_curso
INNER JOIN cat_cursos ct ON ct.id_catCurso = c.id_catCurso;

--6--

SELECT a.nombre_alumno nombre,
	  a.primerApellido,
	  a.segundoApellido,
	  ct.nombre_catCurso,
	  c.fechaInicio,
	  c.fechaTermino,
	  ca.calificacion
FROM alumnos a,
	cat_cursos ct,
	cursoAlumnos ca,
	cursos c
WHERE 1=1
AND ct.id_catCurso = c.id_catCurso
AND c.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
ORDER BY ca.calificacion DESC;

SELECT a.nombre_alumno nombre,
	  a.primerApellido,
	  a.segundoApellido,
	  ct.nombre_catCurso,
	  c.fechaInicio,
	  c.fechaTermino,
	  ca.calificacion
FROM alumnos a
INNER JOIN cursoAlumnos ca ON a.id_alumno = ca.id_alumno
INNER JOIN cursos c ON c.id_curso = ca.id_curso
INNER JOIN cat_cursos ct ON ct.id_catCurso = c.id_catCurso
ORDER BY ca.calificacion DESC;

-- 7--
SELECT ct.clave_catCurso,
	   ct.nombre_catCurso,
	   ct.horas,
	   --ct1.idPrerequisito,
	   ISNULL(ct1.nombre_catCurso, 'Sin Prerrequisitro') Prerequisito
FROM cat_cursos ct
LEFT JOIN cat_cursos ct1 ON ct.id_catCurso = ct1.idPrerequisito;

---8--
SELECT a.nombre_alumno nombre,
	  a.primerApellido,
	  a.segundoApellido,
	  ct.nombre_catCurso,
	  c.fechaInicio,
	  c.fechaTermino,
	  ca.calificacion,
	  CASE ca.calificacion
		WHEN 10 THEN 'EXCELENTE'
		WHEN 9 THEN 'EXCELENTE'
		WHEN 8 THEN 'BIEN'
		WHEN 7 THEN 'BIEN'
		WHEN 6 THEN 'SUFICIENTE'
		ELSE 'N/A'
		END nivel
FROM alumnos a,
	cat_cursos ct,
	cursoAlumnos ca,
	cursos c
WHERE 1=1
AND ct.id_catCurso = c.id_catCurso
AND c.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
ORDER BY ca.calificacion DESC;

SELECT a.nombre_alumno nombre,
	  a.primerApellido,
	  a.segundoApellido,
	  ct.nombre_catCurso,
	  c.fechaInicio,
	  c.fechaTermino,
	  ca.calificacion,
	  CASE ca.calificacion
		WHEN 10 THEN 'EXCELENTE'
		WHEN 9 THEN 'EXCELENTE'
		WHEN 8 THEN 'BIEN'
		WHEN 7 THEN 'BIEN'
		WHEN 6 THEN 'SUFICIENTE'
		ELSE 'N/A'
		END nivel
FROM alumnos a
INNER JOIN cursoAlumnos ca ON a.id_alumno = ca.id_alumno
INNER JOIN cursos c ON c.id_curso = ca.id_curso
INNER JOIN cat_cursos ct ON ct.id_catCurso = c.id_catCurso
ORDER BY ca.calificacion DESC;

--9