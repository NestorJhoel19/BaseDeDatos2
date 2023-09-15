create database Estropical;
use Estropical;

create table Avion(
	codigo int,
	tipo varchar(40),
	capacidad int,
	constraint PK_codigoAvion primary key(codigo),
);

create table Aerolinea(
	codigo int,
	nombre varchar(30),
	pais varchar(40),
	constraint PK_codigoAerolinea primary key(codigo)
);

create table Vuelo(
	numVuelo int,
	codAvion int,
	codAerolinea int,
	origen varchar(40),
	destino varchar(40),
	constraint PK_numVuelo primary key(numVuelo)
	-- constraint FK_Vuelo_Avion foreign key(codAerolinea) references Avion(codigo)
);

create table Tripulacion(
	codigo int,
	nombre varchar(30),
	apellido varchar(30),
	cargo varchar(40),
	constraint PK_codigoTripulacion primary key(codigo)
);

create table TripulacionVuelo(
	codTripulacion int,
	codVuelo int,
	-- constraint FK_TripulacionVuelo_Tripulacion foreign key(codTripulacion) references Tripulacion(codigo),
	-- constraint FK_TripulacionVuelo_Vuelo foreign key(codVuelo) references Vuelo(NumVuelo)
);

-- Llaves foraneas
alter table Vuelo
add constraint FK_Vuelo_Avion_ foreign key(codAerolinea) references Avion(codigo);

alter table TripulacionVuelo
add constraint FK_TripulacionVuelo_Tripulacion foreign key(codTripulacion) references Tripulacion(codigo);

alter table TripulacionVuelo
add constraint FK_TripulacionVuelo_Vuelo foreign key(codVuelo) references Vuelo(numVuelo);

insert into Avion(codigo, tipo, capacidad) values
(1, 'Boeing', 1),
(2, 'Embraer', 1),
(3, 'Airbus', 1),
(4, 'Galaxy', 1);

insert into Aerolinea(codigo, nombre, pais) values
(1, 'Boa', 'Bolivia'),
(2, 'LATAM', 'Mexico'),
(3, 'Delta', 'Uruguay'),
(4, 'American', 'Colombia');
/*
insert into Tripulacion(codigo, nombre, apellido, cargo) values
(1, 'Nestor', 'Mamani', 'Piloto'),
(2, 'Carla', 'Gironda', 'Copiloto'),
(3, 'Mariana', 'Martinez', 'Azafata');
*/

insert into Tripulacion(codigo, nombre, apellido, cargo) values
(1, 'Nestor', 'Mamani', 'Piloto'),
(2, 'Carla', 'Gironda', 'Copiloto'),
(3, 'Mariana', 'Martinez', 'Azafata'),
(4, 'Roberto', 'Mamani', 'Piloto'),
(5, 'Marcos', 'Aguilar', 'Copiloto'),
(6, 'Maria', 'Quispe', 'Azafata'),
(7, 'Pedro', 'Ruiz', 'Piloto'),
(8, 'John', 'Savedra', 'Copiloto'),
(9, 'Natalia', 'Salvatierra', 'Azafata'),
(10, 'Richard', 'Jimenez', 'Piloto'),
(11, 'Dilan', 'Quisbert', 'Copiloto'),
(12, 'Marlene', 'Cornejo', 'Azafata'),
(13, 'Ronald', 'Mamani', 'Piloto'),
(14, 'Ruben', 'Quispe', 'Copiloto'),
(15, 'Emilce', 'Gutierrez', 'Azafata'),
(16, 'Mario', 'Sanchez', 'Piloto'),
(17, 'Jhoel', 'Salazar', 'Copiloto'),
(18, 'Elizabeth', 'Braun', 'Azafata'),
(19, 'Jesus', 'Pacage', 'Piloto'),
(20, 'Paco', 'Aguilar', 'Copiloto'),
(21, 'Adriana', 'Mamani', 'Azafata');

insert into Vuelo(numVuelo, codAvion, codAerolinea, origen, destino) values
(1, 1, 1, 'Bolivia', 'Chile'),
(2, 1, 1, 'Mexico', 'Brasil'),
(3, 2, 2, 'Uruguay', 'Argentina'),
(4, 2, 2, 'Colombia', 'Ecuador');
/*
insert into TripulacionVuelo(codTripulacion, codVuelo) values
(1, 1),
(2, 1),
(3, 1),
(3, 1),
(1, 2),
(3, 2),
(3, 2),
(3, 2),
(1 ,3),
(2, 3),
(3, 3),
(3, 3),
(3, 3),
(1, 4),
(2, 4);
*/

insert into TripulacionVuelo(codTripulacion, codVuelo) values
(1, 1),
(2, 1),
(3, 1),
(6, 1), -- Vuelo 1
(4, 2),
(9, 2),
(12, 2),
(15, 2), -- Vuelo 2
(7 ,3),
(5, 3),
(15, 3),
(18, 3),
(21, 3), -- Vuelo 3
(10, 4),
(8, 4); -- Vuelo 4


select * from Avion;
select * from Aerolinea
select * from Vuelo;
select * from Tripulacion;
select * from TripulacionVuelo;
