SELECT a.id_alumno id,
		a.nombre_alumno nombre,
		a.primerApellido,
		a.segundoApellido,
		CAST(a.fechaNacimiento AS DATETIME) fechaNacimiento,
		SYSDATETIME() hoy,
		DATEDIFF(YEAR, CAST(a.fechaNacimiento AS DATETIME), SYSDATETIME()) Edad,
		DATEDIFF(YEAR, a.fechaNacimiento, DATEADD(MONTH, 5, SYSDATETIME())) "Edad Meses"
FROM alumnos a