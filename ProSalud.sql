create database ProSalud;
use ProSalud;

create table paciente(
	codigo int not null identity(1, 1),
	nombre varchar(40),
	apellido varchar(40),
	constraint PK_codigoPaci primary key(codigo)
);

create table consulta(
	codConsulta int not null identity(1, 1),
	codPaciente int,
	descripcion varchar(70),
	precio int,
	constraint PK_codigoConsul primary key(codConsulta)
);

create table analisisLab(
	numero int not null identity(1, 1),
	descripcion varchar(70),
	precio int,
	codPaciente int,
	constraint PK_numero primary key(numero)
);

create table solicitudServicio(
	numeroSol int not null identity(1, 1),
	detalle varchar(70),
	costo int,
	codPaciente int,
	constraint PK_numSol primary key(numeroSol)
);

-- alters
alter table consulta
add constraint FK_consulta_paciente foreign key(codPaciente) references Paciente(codigo);

alter table solicitudServicio
add constraint FK_solServicio_paciente foreign key(codPaciente) references Paciente(codigo);

alter table analisisLab
add constraint FK_analisisLab_paciente foreign key(codPaciente) references Paciente(codigo);


-- INSERCCIONES
insert into paciente(nombre, apellido) values
('Nestor', 'Mamani'),
('Moises', 'Aparicio'),
('Robert', 'Rosales'),
('Ricardo', 'Jimenez'),
('Rodrigo', 'Villanueva');
select * from paciente;

insert into consulta(codPaciente, descripcion, precio) values
(1, 'Dolor abdominal', 234),
(2, 'Inchazon de rodilla', 244),
(3, 'Lesion cervical', 279),
(4, 'Lesion de mano', 334),
(5, 'Lesion cervical', 304),
(1, 'Lesion de mano', 294),
(2, 'Dolor abdominal', 345);
select * from consulta;

insert into solicitudServicio(detalle, costo, codPaciente) values
('Radiografia', 301, 5),
('Resonancia', 411, 4),
('Ecografia', 499, 3),
('Radiografia', 355, 2),
('Ecografia', 322, 1),
('Resonancia', 315, 5);
select * from solicitudServicio;

insert into analisisLab(descripcion, precio, codPaciente) values
('PH', 120, 1),
('Hemografia', 177, 2),
('Colesterol', 188, 3),
('Acido Folico', 155, 4),
('Hemografia', 134, 5),
('Colesterol', 102, 1);
select * from analisisLab;

-- 1.- Cuales pacientes vinieron por dolor cervical, lesion de mano o ecografia
select c.descripcion as "Descrip. Consulta", s.detalle as "Detalle Sol. Servicio", p.nombre as "Nombre de paciente", p.apellido as "Apellido de paciente"
from consulta c
inner join paciente p
on c.codPaciente = p.codigo
inner join solicitudServicio s
on s.codPaciente = p.codigo
where (c.descripcion like 'Lesion cervical') or (c.descripcion like 'Lesion de mano') or (s.detalle like 'Ecografia');

-- 2.- Cuales pacientes pagaron mas de 250 en la consulta o mas de 400 en servicios
select s.costo as "Costo paciente", p.nombre as "Paciente nombre" , p.apellido as "Paciente apellido", c.precio as "Precio consulta" 
from solicitudServicio s
inner join paciente p
on s.codPaciente = p.codigo
inner join consulta c
on c.codPaciente = p.codigo
where (c.precio > 250) or (s.costo > 400);

-- 3.- Cuales pacientes vinieron por dolor abdominal y se hicieron hemografia o PH
select c.descripcion as "Descripcion consulta", a.descripcion, p.nombre, p.apellido
from consulta c
inner join paciente p
on c.codPaciente = p.codigo
inner join analisisLab a
on a.codPaciente = p.codigo
where (c.descripcion like 'Dolor abdominal') or (a.descripcion like 'Hemograma') or (a.descripcion like 'PH');

-- 4.- Cuales pacientes se les hizo resonancia por lesion cervical o inchazon en la rodilla
select a.descripcion, c.descripcion, p.nombre, p.apellido
from analisisLab a
inner join paciente p
on a.codPaciente = p.codigo
inner join consulta c
on c.codPaciente = p.codigo
where (c.descripcion like 'Lesion cervical') or (c.descripcion like 'Inchazon de rodilla');

-- 5.- Cuales pacientes tuvieron consultas con lesiones y ecografias
select c.descripcion, s.detalle, p.nombre, p.apellido
from consulta c
inner join paciente p
on c.codPaciente = p.codigo
inner join solicitudServicio s
on s.codPaciente = p.codigo
where c.descripcion like 'Lesion%' or s.detalle like 'Ecografia';
