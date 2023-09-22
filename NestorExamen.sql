create database NestorMamani;
use NestorMamani;

create table Medicamento(
	codigo int,
	nombre varchar(60),
	precio int,
	fabricante int,
	presentacion varchar(60),
	constraint PK_codigo primary key(codigo)
);

create table Fabricante(
	codigo int,
	nombre varchar(30),
	ciudad varchar(30),
	constraint PK_codigoFabricante primary key(codigo)
);

alter table Medicamento
add constraint FK_Medicamento_Fabricante foreign key(fabricante) references Fabricante(codigo);

-- 1 ok
-- 2 ok
-- 3 ok
-- 4 ok

insert into Fabricante(codigo, nombre, ciudad) values
(1, 'Inti', 'La Paz'),
(2, 'Vita', 'Oruro'),
(3, 'Bago', 'La Paz'),
(4, 'Alfa', 'Cochabamba');

insert into Medicamento(codigo, nombre, precio, fabricante, presentacion) values
(1, 'Mentisan', 12, 1, 'Pomada'),
(2,'Paracetamol', 6, 2, 'Pastilla'),
(3, 'Ibuprofeno', 4, 1, 'Pomada'),
(4, 'Aspirina', 2, 3, 'Pastilla'),
(5, 'Complejo B', 20, 2, 'Gragea'),
(6, 'Lertus', 15, 1, 'Pastilla'),
(7, 'Dolorub', 22, 2, 'Pomada'),
(8, 'Certal', 12, 3, 'Gragea'),
(9, 'Migranol', 8, 1, 'Pastilla'),
(10, 'Complejo B', 27, 4, 'Inyectable'),
(11, 'Vitamina C', 30, 3, 'Inyectable'),
(12, 'Lertus', 40, 2, 'Pomada');
 
 select * from Fabricante;
 select * from Medicamento;

 -- Realizar.....
 -- 1. Cambiar el precio del lertus pastilla a 18
 update Medicamento
 set precio = 18
 where (nombre like 'Lertus') and (presentacion like 'Pastilla');

 -- 2. Cambiar el precio de la aspirina a 4
 update Medicamento
 set precio = 4
 where nombre like 'Aspirina'; 

 -- 3. elaborar una consulta que muestre los medicamentos con precio mayor a 5 de bago
 select m.nombre, m.precio, m.presentacion, f.nombre
 from Medicamento M
 inner join fabricante F
 on m.fabricante = f.codigo
 where (m.precio > 5) and (f.nombre like 'Bago');

 -- 4. Elaborar una consulta que muestre los medicamentos del fabricante alfa
 select m.nombre, m.presentacion, f.nombre 
 from Medicamento m
 inner join Fabricante f
 on m.fabricante = f.codigo
 where f.nombre like 'Alfa';

 -- 5. elaborar una consulta que muestre los medicamentos que son pomada o gragea
 select m.nombre, m.presentacion, f.nombre
 from Medicamento m
 inner join Fabricante f
 on m.fabricante = f.codigo
 where m.presentacion like 'Pomada' or  m.presentacion like 'Gragea';

 -- 6. elaborar una consulta que muestre cuales que fabricantes traen complejo b
 select m.nombre, m.presentacion, f.nombre, f.ciudad
 from Medicamento m
 inner join Fabricante f
 on m.fabricante = f.codigo
 where m.nombre like 'Complejo B';
