SELECT 'Alumno' TipoPersona,
		a.nombre_alumno nombre,
		a.primerApellido primerApellido,
		a.segundoApellido segundoApellido,
		MONTH(a.fechaNacimiento) MesNacimiento,
		DAY(a.fechaNacimiento) DiaNacimiento
FROM alumnos a
UNION
SELECT 'Profesor' TipoPersona,
		i.nombre_instructor nombre,
		i.primerApellido primerApellido,
		i.segundoApellido segundoApellido,
		MONTH(i.fechaNacimiento) MesNacimiento,
		DAY(i.fechaNacimiento) DiaNacimiento
FROM instructores i
