insert into cat_cursos (clave_catCurso, 
						nombre_catCurso, 
						desc_catCurso, 
						horas, 
						idPrerequisito, 
						activo)
					values ('SQL', 'Bases de datos SQL Server', 
							'Curso de SQL Server (conceptos basicos, DDL, DML) y manipulacion de datos',
							50,
							null,
							1);
insert into cat_cursos (clave_catCurso, 
						nombre_catCurso, 
						desc_catCurso, 
						horas, 
						idPrerequisito, 
						activo)
					values ('Asp .NET y C# 2', 'Asp .NET y C#', 
							'Curso de reforzamiento a los lenguajes Asp .NET y C#',
							50,
							2,
							0);


insert into cat_cursos (clave_catCurso, 
						nombre_catCurso, 
						desc_catCurso, 
						horas, 
						idPrerequisito, 
						activo)
					values ('Asp .NET -MVC', 'Tecnologia MVC', 
							'Curso Tecnologia Asp .NET -MVC',
							50,
							5,
							0);
SELECT * FROM cat_cursos;

delete from cat_cursos;


___________________________________________________________________________________________________________________________
SET IDENTITY_INSERT [dbo].[cursos] ON 

insert into cursos (id_curso, 
					id_catCurso, 
					fechaInicio, 
					fechaTermino, 
					activo)
				VALUES(1,
					   1,
					   '2022-01-10',
					   '2022-01-14',
					   0);

insert into cursos (id_curso, 
					id_catCurso, 
					fechaInicio, 
					fechaTermino, 
					activo)
				VALUES(2,
					   2,
					   '2022-01-17',
					   '2022-01-21',
					   0);

insert into cursos (id_curso, 
					id_catCurso, 
					fechaInicio, 
					fechaTermino, 
					activo)
				VALUES(3,
					   5,
					   '2022-01-24',
					   '2022-01-28',
					   0);

insert into cursos (id_curso, 
					id_catCurso, 
					fechaInicio, 
					fechaTermino, 
					activo)
				VALUES(4,
					   8,
					   '2022-01-31',
					   '2022-02-04',
					   0);

insert into cursos (id_curso, 
					id_catCurso, 
					fechaInicio, 
					fechaTermino, 
					activo)
				VALUES(5,
					   1,
					   '2022-02-07',
					   '2022-02-11',
					   0);

insert into cursos (id_curso, 
					id_catCurso, 
					fechaInicio, 
					fechaTermino, 
					activo)
				VALUES(6,
					   2,
					   '2022-02-14',
					   '2022-02-18',
					   0);
SET IDENTITY_INSERT [dbo].[cursos] OFF
SELECT * FROM CURSOS;
UPDATE CURSOS 
SET activo = 1
where id_curso = 1;

____________________________________________________________________________________________
SET IDENTITY_INSERT [dbo].[alumnos] ON 

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(1,
				   'JORGE',
				   'ALONSO',
				   'JIMENEZ'
				   , 'jalonso4ce.com.mx',
				   '5547915953',
				   '1993-12-04',
				   'AOJJ931204HOCLMRO1',
				   30000.00,
				   19,
				   3);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(2,
				   'GIOVANNI',
				   'PEREZ',
				   NULL
				   , 'giovanni@4ce.com.mx',
				   '5545367801',
				   '1995-02-20',
				   'GIOV1234HOCLMR02',
				   0.00,
				   14,
				   3);
insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(3,
				   'IVAN',
				   'HERNANDEZ',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1995-08-10',
				   'ABCD1234HOCLMR03',
				   0.00,
				   10,
				   3);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(4,
				   'JUAN GERARDO',
				   'SUAREZ',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1992-05-15',
				   'ABCD1234HOCLMR04',
				   0.00,
				   19,
				   3);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(5,
				   'WILLIAM',
				   'LOPEZ',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1992-03-21',
				   'ABCD1234HOCLMR05',
				   0.00,
				   19,
				   3);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(6,
				   'JABNEL',
				   'MENDOZA',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1996-02-22',
				   'ABCD1234HOCLMR06',
				   0.00,
				   12,
				   3);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(7,
				   'GABRIEL',
				   'SANTIAGO',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1996-04-12',
				   'ABCD1234HOCLMR07',
				   0.00,
				   19,
				   6);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(8,
				   'LUIS',
				   'MATUS',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1996-07-03',
				   'ABCD1234HOCLMR08',
				   24000.00,
				   19,
				   6);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(9,
				   'EDITH',
				   'RASGADO',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1994-04-30',
				   'ABCD1234HOCLMR09',
				   30000.00,
				   19,
				   5);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(10,
				   'JIOVANY',
				   'LOPEZ',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1994-06-14',
				   'ABCD1234HOCLMR010',
				   22000.00,
				   19,
				   5);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(11,
				   'PEDRO',
				   'PEREZ',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1993-11-07',
				   'ABCD1234HOCLMR11',
				   0.00,
				   3,
				   1);

insert into alumnos (id_alumno,
					nombre_alumno,
					primerApellido,
					segundoApellido,
					correo,
					telefono,
					fechaNacimiento,
					curp,
					sueldo,
					id_estado,
					id_estatus)
			VALUES(12,
				   'REYNA',
				   'LOPEZ',
				   NULL
				   ,'email@4ce.com.mx',
				   '5555555555',
				   '1992-11-26',
				   'ABCD1234HOCLMR12',
				   0.00,
				   10,
				   1);

SET IDENTITY_INSERT [dbo].[alumnos] OFF
select * from alumnos;

______________________________________________________________________________________________
SET IDENTITY_INSERT [dbo].[instructores] ON

insert into instructores (id_instructor, 
						nombre_instructor, 
						primerApellido, 
						segundoApellido,
						correo, 
						telefono, 
						fechaNacimiento, 
						rfc, 
						curp, 
						cuotaHora, 
						activo)
					values(1, 
					'JAVIER', 
					'ESPINOZA', 
					NULL, 
					'correo@tich.com.mx',
					'2222222222', 
					'1991-09-25', 
					'ABCD123456XYZ',
					'ABCD123456HOCLMR00',
					180.00,
					1);

insert into instructores (id_instructor, 
						nombre_instructor, 
						primerApellido, 
						segundoApellido,
						correo, 
						telefono, 
						fechaNacimiento, 
						rfc, 
						curp, 
						cuotaHora, 
						activo)
					values(2, 
					'JORGE', 
					'PEDRAZA', 
					NULL, 
					'correo@tich.com.mx',
					'2222222222', 
					'1977-10-09', 
					'ABCD123456XYZ',
					'ABCD123456HOCLMR00',
					180.00,
					0);

insert into instructores (id_instructor, 
						nombre_instructor, 
						primerApellido, 
						segundoApellido,
						correo, 
						telefono, 
						fechaNacimiento, 
						rfc, 
						curp, 
						cuotaHora, 
						activo)
					values(3, 
					'OSCAR', 
					'OCAÑA', 
					NULL, 
					'correo@tich.com.mx',
					'2222222222', 
					'1989-10-19', 
					'ABCD123456XYZ',
					'ABCD123456HOCLMR00',
					180.00,
					0);

insert into instructores (id_instructor, 
						nombre_instructor, 
						primerApellido, 
						segundoApellido,
						correo, 
						telefono, 
						fechaNacimiento, 
						rfc, 
						curp, 
						cuotaHora, 
						activo)
					values(4, 
					'LUIS', 
					'VASQUEZ', 
					NULL, 
					'correo@tich.com.mx',
					'2222222222', 
					'1980-05-29', 
					'ABCD123456XYZ',
					'ABCD123456HOCLMR00',
					250.00,
					0);

SET IDENTITY_INSERT [dbo].[instructores] OFF

delete from instructores;
select * from instructores;
_________________________________________________________________________________________________
SET IDENTITY_INSERT [dbo].[cursoInstructores] ON

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (1,
						1,
						1,
						'2022-01-10',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (2,
						1,
						2,
						'2022-01-10',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (3,
						1,
						3,
						'2022-01-10',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (4,
						1,
						4,
						'2022-01-10',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (5,
						1,
						5,
						'2022-01-10',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (6,
						1,
						6,
						'2022-01-10',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (7,
						2,
						13,
						'2022-01-18',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (8,
						2,
						14,
						'2022-01-18',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (9,
						3,
						15,
						'2022-01-24',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (10,
						3,
						16,
						'2022-01-24',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (11,
						4,
						17,
						'2022-01-31',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (12,
						4,
						18,
						'2022-01-31',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (13,
						5,
						19,
						'2022-02-07',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (14,
						5,
						20,
						'2022-02-07',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (15,
						6,
						21,
						'2022-02-14',
						NULL,
						NULL);

insert into cursoAlumnos (idCurso_alumno,
						 id_curso,
						 id_alumno,
						 fechaInscripcion,
						 fechaBaja,
						 calificacion)
				VALUES (16,
						6,
						22,
						'2022-02-14',
						NULL,
						NULL);
SET IDENTITY_INSERT [dbo].[cursoInstructores] OFF
_______________________________________________________________________________________________

SET IDENTITY_INSERT [dbo].[cursoInstructores] ON



SET IDENTITY_INSERT [dbo].[cursoInstructores] OFF