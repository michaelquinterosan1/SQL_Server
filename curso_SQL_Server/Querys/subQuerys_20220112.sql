use instituto_tich

--1
SELECT a.nombre_alumno
FROM alumnos a
WHERE 
LEN (a.nombre_alumno) =
(SELECT MAX( LEN(a1.nombre_alumno))
		FROM alumnos a1)

--2
SELECT *
FROM alumnos a
WHERE 
DATEDIFF(YEAR, a.fechaNacimiento, SYSDATETIME()) > (SELECT AVG(DATEDIFF(YEAR, a1.fechaNacimiento, SYSDATETIME()))
												  FROM alumnos a1)

--3 
SELECT a.nombre_alumno nombre,
	   a.primerApellido,
	   a.segundoApellido,
	   ct.nombre_catCurso Curso,
	   c.fechaInicio,
	   c.fechaTermino,
	   ca.calificacion
FROM alumnos a,
	 cat_cursos ct,
	 cursos c,
	 cursoAlumnos ca
WHERE 1 = 1
AND ct.id_catCurso = c.id_catCurso
AND c.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
AND ca.calificacion = (SELECT MAX(cas.calificacion)
					   FROM cursoAlumnos cas);

--4
SELECT ct.nombre_catCurso nombre,
	   c.fechaInicio,
	   c.fechaTermino,
	   COUNT (a.id_alumno) Total,
	   MAX(ca.calificacion) CalMax,
	   MIN(ca.calificacion) CalMin,
	   AVG(ca.calificacion) CalProm
FROM cat_cursos ct,
	cursos c,
	cursoAlumnos ca,
	alumnos a
WHERE 1= 1
AND ct.id_catCurso = c.id_catCurso
AND c.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
GROUP BY ct.nombre_catCurso,
	   c.fechaInicio,
	   c.fechaTermino



SELECT ct.nombre_catCurso nombre,
	   cu.fechaInicio,
	   cu.fechaTermino,
	  COUNT (a.id_alumno) Total,
	   MAX(ca.calificacion) MaxCal,
	   MIN(ca.calificacion) MinCal,
	   AVG(ca.calificacion) Prom
FROM cat_cursos ct,
	(SELECT c.id_catCurso,
	        c.id_curso,
		    c.fechaInicio,
		    c.fechaTermino
	 FROM cursos c) AS cu,
	 (SELECT ca.id_alumno,
		     ca.id_curso,
			 ca.calificacion
	  FROM cursoAlumnos ca) AS ca,
     alumnos a
WHERE 1 = 1
AND ct.id_catCurso = cu.id_catCurso
AND cu.id_curso = ca.id_curso
AND ca.id_alumno = a.id_alumno
GROUP BY ct.nombre_catCurso,
	   cu.fechaInicio,
	   cu.fechaTermino

--5
SELECT a.id_alumno
      ,a.nombre_alumno
      ,a.primerApellido
      ,a.segundoApellido
      ,a.correo
      ,a.telefono
      ,a.fechaNacimiento
      ,a.curp
      ,a.sueldo
      ,a.id_estado
      ,a.id_estatus
  FROM alumnos a
INNER JOIN cursoAlumnos ca ON ca.id_alumno = a.id_alumno
WHERE ca.calificacion <= (SELECT AVG(ca1.calificacion)
						  FROM cursoAlumnos ca1)

--6
SELECT a.nombre_alumno,
	   a.primerApellido,
	   a.segundoApellido,
	   a.fechaNacimiento,
	   ct.nombre_catCurso,
	   c.fechaInicio,
	   c.fechaTermino,
	   alumMaxCal.calificacion
FROM alumnos a,
	(SELECT ca.id_curso,
			ca.id_alumno,
			ca.calificacion
	 FROM cursoAlumnos ca,
		  (SELECT ca1.id_curso,
				  MAX(ca1.calificacion) AS maxCal
		   FROM cursoAlumnos ca1
		   GROUP BY ca1.id_curso) AS calMax
		   WHERE ca.id_curso = calMax.id_curso AND ca.calificacion = calMax.maxCal) AS alumMaxCal,
	 cursos c,
	 cat_cursos ct
WHERE 1=1
AND a.id_alumno = alumMaxCal.id_alumno
AND c.id_curso = alumMaxCal.id_curso
AND c.id_catCurso = ct.id_catCurso


SELECT a.nombre_alumno,
	   a.primerApellido,
	   a.segundoApellido,
	   a.fechaNacimiento,
	   ct.nombre_catCurso,
	   c.fechaInicio,
	   c.fechaTermino,
	   alumCalMax.calificacion
FROM alumnos a
INNER JOIN(SELECT ca.id_curso,
				  ca.id_alumno,
				  ca.calificacion
		   FROM cursoAlumnos ca INNER JOIN (SELECT ca1.id_curso,
													MAX(ca1.calificacion) AS maxCal
												FROM cursoAlumnos ca1
												GROUP BY ca1.id_curso) AS CalMax
			ON ca.id_curso = CalMax.id_curso AND ca.calificacion = CalMax.maxCal) AS alumCalMax
			ON a.id_alumno = alumCalMax.id_alumno
INNER JOIN cursos c ON c.id_curso = alumCalMax.id_curso
INNER JOIN cat_cursos ct ON ct.id_catCurso = c.id_catCurso
