---1---
SELECT a.primerApellido 'Apellido Paterno',
	   a.segundoApellido 'Apellido Materno',
	   a.nombre_alumno nombre,
	   a.telefono telefono,
	   a.correo correo
FROM alumnos a
ORDER BY a.primerApellido ASC;

--2---
SELECT inst.nombre_instructor nombre,
		inst.primerApellido 'Apellido Paterno',
		inst.segundoApellido 'Apellido Materno',
		inst.rfc rfc,
		inst.cuotaHora 'Cuota por Hora'
FROM instructores inst;

--3---
SELECT ct.clave_catCurso clave,
		ct.nombre_catCurso nombre,
		ct.desc_catCurso descripcion,
		ct.horas horas
FROM cat_cursos ct
ORDER BY ct.clave_catCurso ASC;

---4---
SELECT TOP(5) *
FROM alumnos al
ORDER BY al.fechaNacimiento DESC;

---5---
CREATE DATABASE Ejercicios;

---6
SELECT * 
INTO Ejercicios.dbo.Alumnos_copia 
FROM alumnos;

SELECT * 
INTO Ejercicios.dbo.Instructores_copia 
FROM instructores;