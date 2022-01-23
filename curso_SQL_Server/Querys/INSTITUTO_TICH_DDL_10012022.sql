CREATE DATABASE instituto_tich;

use instituto_tich;

CREATE TABLE estados
(id_estado INT IDENTITY(1,1) NOT NULL,
nombre_estado VARCHAR(100),
PRIMARY KEY (id_estado)
);



CREATE TABLE estatus_alumnos
(id_estatus SMALLINT IDENTITY(1,1) NOT NULL,
clave CHAR(10) NOT NULL,
nombre VARCHAR(100) NOT NULL,
PRIMARY KEY (id_estatus)
);

CREATE TABLE cat_cursos
(id_catCurso SMALLINT IDENTITY(1,1) NOT NULL,
clave_catCurso VARCHAR(15) NOT NULL,
nombre_catCurso VARCHAR(50) NOT NULL,
desc_catCurso	VARCHAR(1000),
horas TINYINT NOT NULL,
idPrerequisito SMALLINT,
activo BIT,
PRIMARY KEY(id_catCurso),
CONSTRAINT FK_catCursos FOREIGN KEY (idPrerequisito)
REFERENCES cat_cursos (id_catCurso)
);

CREATE TABLE cursos(
id_curso SMALLINT IDENTITY(1,1) NOT NULL,
id_catCurso SMALLINT,
fechaInicio DATE,
fechaTermino DATE,
activo bit,
PRIMARY KEY(id_curso),
CONSTRAINT FK_curso_catCurso FOREIGN KEY (id_catCurso)
REFERENCES cat_cursos(id_catCurso)
);

CREATE TABLE alumnos
(id_alumno INT IDENTITY(1,1) NOT NULL,
nombre_alumno VARCHAR(60) NOT NULL,
primerApellido VARCHAR(50) NOT NULL,
segundoApellido VARCHAR(50),
correo VARCHAR(80) NOT NULL,
telefono NCHAR(10) NOT NULL,
fechaNacimiento DATE NOT NULL,
curp CHAR(18) NOT NULL,
sueldo DECIMAL(9,2) NOT NULL,
id_estado INT NOT NULL,
id_estatus SMALLINT NOT NULL,
PRIMARY KEY (id_alumno),
CONSTRAINT FK_alumnosEstado FOREIGN KEY (id_estado)
REFERENCES estados (id_estado),
CONSTRAINT FK_alumnosEstatus FOREIGN KEY (id_estatus)
REFERENCES estatus_alumnos (id_estatus)
);

CREATE TABLE instructores
(id_instructor SMALLINT IDENTITY (1,1)NOT NULL,
nombre_instructor VARCHAR(60) NOT NULL,
primerApellido VARCHAR(50) NOT NULL,
segundoApellido VARCHAR(50),
correo VARCHAR(80) NOT NULL,
telefono NCHAR(10) NOT NULL,
fechaNacimiento DATE NOT NULL,
rfc CHAR(13) NOT NULL,
curp CHAR(18) NOT NULL,
cuotaHora DECIMAL(9,2) NOT NULL,
activo BIT NOT NULL,
PRIMARY KEY(id_instructor)
);

CREATE TABLE cursoAlumnos
(idCurso_alumno INT IDENTITY(1,1) NOT NULL,
id_curso SMALLINT NOT NULL,
id_alumno INT NOT NULL,
fechaInscripcion DATE NOT NULL,
fechaBaja DATE,
calificacion TINYINT,
PRIMARY KEY (idCurso_alumno),
CONSTRAINT FK_curso_CursoAlumno FOREIGN KEY (id_curso)
REFERENCES cursos (id_curso),
CONSTRAINT FK_alumno_CursoAlumno FOREIGN KEY (id_alumno)
REFERENCES alumnos (id_alumno)
);

CREATE TABLE cursoInstructores
(idCurso_instructor INT IDENTITY (1,1) NOT NULL,
id_curso SMALLINT NOT NULL,
id_instructor SMALLINT NOT NULL,
fechaContratacion DATE,
PRIMARY KEY (idCurso_instructor),
CONSTRAINT FK_curso_CursoInstructor FOREIGN KEY (id_curso)
REFERENCES cursos (id_curso),
CONSTRAINT FK_inst_CursoInstructor FOREIGN KEY (id_instructor)
REFERENCES instructores (id_instructor)
);

CREATE TABLE alumnosBaja
(idAlumnos_Baja INT IDENTITY(1,1) NOT NULL,
nombreAlumno VARCHAR(60) NOT NULL,
primerApellido VARCHAR(50) NOT NULL,
segundoApellido VARCHAR(50),
fechaBaja DATETIME NOT NULL,
PRIMARY KEY (idAlumnos_Baja)
);