--Base De Datos Academico
--Autor: Hugo Espetia
--Fecha: Cusco 22 de abril de 2024

create tablespace "TBS_Academico"
datafile 'C:\Temp\DF_Academico.BDF'
size 100M;

--crear tablas
--tabla carrera , las tablas son objetos
create table TCarrera
(
  CodCarrera char(5)primary key,
  Carrera varchar(50)
) tablespace "TBS_Academico";

--tabla Usuario 
create table TUsuario
(
   Usuario char(5)primary key,
   Contrasena char(5)
)tablespace "TBS_Academico";

--Tabla Asignatura
create table TAsignatura
(
   CodAsignatura char(5)primary key,
   Asignatura varchar(50),
   CodRequisito char(5),
   foreign key (CodRequisito)references TAsignatura
)tablespace "TBS_Academico";


--Tabla Alumno
create table TAlumno
(
   CodAlumno char(5)primary key,
   APaterno varchar(50),
   AMaterno varchar(50),
   Nombres varchar(50),
   Usuario char(5) unique,
   CodCarrera char(5),
   foreign key (Usuario)references TUsuario,
   foreign key (CodCarrera)references TCarrera 
) tablespace "TBS_Academico";


--Tabla Docente
create table TDocente
(
   CodPaterno char(5)primary key,
   APaterno varchar(50),
   AMaterno varchar(50),
   Nombres varchar(50),
   Usuario char(5)unique,
   foreign key(Usuario)references TUsuario
)tablespace "TBS_Academico";


--Tabla Carga
create table TCarga
(
   IdCarga int primary key,
   CodDocente char(5),
   CodAsignatura char(5),
   Semestre varchar(50),
   foreign key(CodDocente)references TDocente,
   foreign key(CodAsignatura)references TAsignatura
) tablespace "TBS_Academico";


--Tabla Notas
create table TNotas
(
   CodAlumno char(5),
   CodAsignatura char(5),
   Semestre varchar(50),
   Parcial1 decimal(4,2),
   Parcial2 decimal(4,2),
   NotaFinal decimal(4,2),
   primary key (CodAlumno,CodAsignatura,Semestre),
   foreign key (CodAlumno)references TAlumno,
   foreign key (CodAsignatura)references TAsignatura
)tablespace "TBS_Academico";


