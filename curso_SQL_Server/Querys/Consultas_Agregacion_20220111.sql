---1

SELECT e.nombre_estado Estado, 
	   COUNT (a.id_alumno) 'Total Alumnos'
FROM alumnos a,
	estados e
WHERE 1 = 1
AND e.id_estado = a.id_estado
GROUP BY e.nombre_estado;

---2
SELECT ea.nombre Estatus,
	   COUNT (a.id_alumno) Total
FROM estatus_alumnos ea,
	 alumnos a
WHERE 1=1
AND ea.id_estatus = a.id_estatus
GROUP BY ea.nombre;

---3
SELECT 'Calificaciones Alumnos' as 'Resumen Calificaciones',
	   COUNT (a.id_alumno) Tot,
	   MAX(ca.calificacion) Maxima,
	   MIN(ca.calificacion) Minima,
	   AVG(ca.calificacion) Promedio
FROM cursoAlumnos ca,
	 alumnos a
WHERE 1=1
AND a.id_alumno = ca.id_alumno

---4
SELECT ct.nombre_catCurso Curso,
	   c.fechaInicio,
	   c.fechaTermino,
	   COUNT (a.id_alumno) Total,
	   MAX(ca.calificacion) Maxima,
	   MIN(ca.calificacion) Minima,
	   AVG(ca.calificacion) Promedio
FROM cursoAlumnos ca,
	 cursos c,
	 cat_cursos ct,
	 alumnos a
WHERE 1 = 1
AND ct.id_catCurso = c.id_catCurso
AND c.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
GROUP BY ct.nombre_catCurso,
		 c.fechaInicio,
	     c.fechaTermino

---5
SELECT e.nombre_estado Estado,
	   COUNT(a.id_alumno) Total,
	   MAX(ca.calificacion) Maxima,
	   MIN(ca.calificacion) Minima,
	   AVG(ca.calificacion) Promedio
FROM estados e,
	 alumnos a,
	 cursoAlumnos ca
WHERE 1 = 1
AND e.id_estado = a.id_estado
AND a.id_alumno = ca.id_alumno
GROUP BY e.nombre_estado
HAVING AVG(ca.calificacion) >6
