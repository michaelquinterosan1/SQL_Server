---1
SELECT a.id_alumno id,
		UPPER(a.nombre_alumno) nombre,
		UPPER(a.primerApellido),
		UPPER(a.segundoApellido),
		a.fechaNacimiento fechaNacimiento,
		SYSDATETIME() hoy,
		DATEDIFF(YEAR, CAST(a.fechaNacimiento AS DATETIME), SYSDATETIME()) Edad,
		DATEDIFF(YEAR, a.fechaNacimiento, DATEADD(MONTH, 5, SYSDATETIME())) Edad5Meses
FROM alumnos a

---2
SELECT a.id_alumno id,
		UPPER(a.nombre_alumno) nombre,
		UPPER(a.primerApellido) primerApellido,
		UPPER(a.segundoApellido) segundoApellido,
		a.fechaNacimiento fechaNacimiento,
		a.curp,
		CONVERT(DATE, SUBSTRING(a.curp, 5, 6)) FechaCurp
FROM alumnos a

---3
SELECT a.id_alumno id,
		a.nombre_alumno nombre,
		a.primerApellido primerApellido,
		a.segundoApellido segundoApellido,
		a.fechaNacimiento fechaNacimiento,
		a.correo,
		CASE SUBSTRING(a.curp, 11, 1) 
			WHEN 'H' THEN 'Hombre'
			ELSE 'Mujer'
			END Genero
FROM alumnos a

---4
SELECT a.id_alumno id,
		UPPER(a.nombre_alumno) nombre,
		UPPER(a.primerApellido) primerApellido,
		UPPER(a.segundoApellido) segundoApellido,
		a.fechaNacimiento fechaNacimiento,
		a.correo,
		REPLACE (a.correo, 'gmail', 'hotmail.com') correoHot
FROM alumnos a