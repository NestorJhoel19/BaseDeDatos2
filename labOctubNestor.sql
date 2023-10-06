create database labOctubre;
use labOctubre;

create table Articulo(
	codigo int not null identity(1, 1),
	nombre varchar(30) not null,
	precio int,
	responsable int,
	constraint PK_codigo_articulo primary key(codigo),
	constraint FK_articulo_responsable foreign key(responsable) references Responsable(codigo)
);


create table Responsable(
	codigo int not null identity(1, 1),
	nombre varchar(30) not null,
	salario int,
	constraint PK_codigoResponsable primary key(codigo)
);

insert into Articulo(nombre, precio, responsable) values
('Laptosis', 1500, 1),
('Alicate', 80, 4), 
('Tornillos', 20, 3),
('Pala', 180, 2),  
('Laptop i7', 2800, 4),
('Picota', 215, 3),
('Laptop i3', 1900, 5),
('Mouse', 80, 4),
('Monitor', 7200, 3),
('Pala', 120, 5),
('Picota', 200, 3),  
('Alicate', 100, 2),
('Lija', 15, 1),   
('Alicate', 120, 2),
('Carretilla', 350, 4);

insert into Responsable(nombre, salario) values
('Juan', 3800),
('Luis', 5200),
('Pedro', 2900),
('Ana', 3400),
('Maria', 4200);
     

select * from Articulo;
select * from Responsable;

-- 1.- De cuales articulos es responsable Pedro
select a.nombre as "Nombre del articulo", a.precio as "Precio del articulo", r.nombre as "Nombre del responsable"
from Articulo a
inner join Responsable r
on a.responsable = r.codigo
where r.nombre like 'Pedro';

-- 2.- Cual es el promedio de precios de Laptops
select avg(precio) as "Promedio de las Laptops" from Articulo
where nombre like 'Laptop%';

-- 3.- Cual es el articulo mas caro del responsable 3
select max(precio) as "Articulo mas caro" from Articulo
where responsable = 3;

-- 4.- Cual es el total de precio de articulos del responsable 5
select sum(precio) as "Total de precio" from Articulo
where Responsable = 5;

--5.- Cual es el promedio de precios de palas picotas o alicates
select avg(precio) as "Promedio de precios" from Articulo
where nombre in('Pala', 'Picota', 'Alicate');

-- 6.- Cual es el promedio de precios de los articulos de los responsables 3, 4, 5
select avg(precio) as "Promedio de los precios" from Articulo
where Responsable in(3, 4, 5);

-- 7.- De que articulos son responsables Ana o Maria
select a.nombre as "Nombre del articulo", a.precio as "Precio del articulo", r.nombre as "Nombre del responsable"
from Articulo a
inner join Responsable r
on a.responsable = r.codigo
where (r.nombre like 'Ana') or (r.nombre like 'Maria');

-- 8.- Cual es el articulo mas caro del responsable 4
select max(precio) as "Articulo mas caro" from Articulo
where responsable = 4;

-- 9.- Cuales son los articulos de los responsables con salario entre 3000 y 4000
select a.nombre as "Nombre del articulo", a.precio as "Precio del articulo", r.nombre as "Nombre del responsable", r.salario as "Salario del responsable"
from Articulo a
inner join Responsable r
on a.responsable = r.codigo
where r.salario between 3000 and 4000;
 

-- 10.- Cual es el promedio del salario de los responsables
select avg(Responsable) as "salario de los responsables" from Articulo;

