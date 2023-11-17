create database examen7;
use examen7;

create table departamento(
	codigo int identity(1, 1),
	nombre_depto varchar(70) not null,
	constraint PK_codigo primary key(codigo)
);

create table empleado(
	codigo int identity(1, 1),
	nombres varchar(30) not null,
	apellidos varchar(30) not null,
	departamento int,
	salario int,
	descuento_afp int,
	total_ganado int,
	constraint PK_codigoEmpleado primary key(codigo),
	constraint FK_empleado_departamento foreign key(departamento) references departamento(codigo)
);

insert into departamento(nombre_depto) values
('Gerencia'),
('Contabilidad'),
('Sistemas'),
('legal');


insert into empleado(nombres, apellidos, departamento, salario, descuento_afp, total_ganado) values
('Juan', 'Perez', 1, 10000, 1500, 8500),
('Rocio', 'Vazquez', 1, 10000, 1500, 8500),
('Karen', 'Choque', 2, 7000, 700, 6300),
('Antonio', 'Vargas', 2, 7000, 700, 6300),
('Maria', 'Delgado', 2, 7000, 700, 6300),
('Rudy', 'Choque', 2, 7000, 700, 6300),
('Julio', 'Perez', 3, 5000, 400, 4600),
('Juan', 'Choque', 3, 5000, 400, 4600),
('Gabriel', 'Gomez', 3, 5000, 400, 4600),
('Maria', 'Canaviri', 3, 5000, 400, 4600),
('Marcia', 'Zapata', 4, 3800, 190, 3610);

-- Modificamos los registros
alter table empleado
add salario int;

update empleado
set salario = 8000
where departamento = 1;

update empleado
set salario = 6000
where departamento = 2;

update empleado
set salario = 4600
where departamento = 3;

update empleado
set salario = 4200
where departamento = 4;

alter table empleado
add descuento_afp int;

update empleado
set descuento_afp  = descuento_afp - (salario * 0.15)
where departamento = 1;

update empleado
set descuento_afp  = descuento_afp - (salario * 0.10)
where departamento = 2;

update empleado
set descuento_afp  = descuento_afp - (salario * 0.08)
where departamento = 3;

update empleado
set descuento_afp  = descuento_afp - (salario * 0.05)
where departamento = 4;

alter table empleado
add total_ganado int;

-- acaaaa
select * from empleado;

-- sistemas y contab
create view vista1
as 
select e.nombres as Nombres, e.apellidos as apellidos, e.departamento as depto, d.nombre_depto as nombreDpto
from empleado e 
inner join departamento d
on e.departamento = d.codigo
where d.nombre_depto in('Contabilidad', 'Sistemas');

-- acaaa
select * from vista1;

create view vista2
as 
select e.nombres as Nombres, e.apellidos as apellidos, e.departamento as depto, e.total_ganado as ganancia, d.nombre_depto as nombreDpto
from empleado e 
inner join departamento d
on e.departamento = d.codigo
where e.total_ganado >= 4000 and e.total_ganado <= 6000;

-- acaaa
select * from vista2;


-- acaaaa
select * from empleado;

-- acaaa
select * from vista1;

-- acaaa
select * from vista2;


