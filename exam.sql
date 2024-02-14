Create database fraccinamiento ;
use fraccinamiento ;

Create table Fraccionamiento
(
id int primary key auto_increment,
nombre varchar(500) not null,
ciudad varchar(255) not null,
estado varchar(255) not null,
colonia varchar(300) not null,
cp char(5) not null,
montocuota decimal(12,2) default 0,
diasprorroga int default 0,
montopenalizacion decimal(12,2) default 0
);
Create table Circuito(
id int primary key auto_increment,
nombre varchar(500) not null,
fraccionamiento int not null
);
Create table Casa
(
id int primary key auto_increment ,
numero int not null,
inquilino varchar(1000),
circuito int not null
);
Create table Tarjeta
(
id int primary key auto_increment,
Tag int default 0 ,
casa int not null
);
Create table Cuota
(
id int primary key auto_increment,
fechapago datetime, 
fechaini datetime ,
fechafin datetime,
montopago decimal(12,2) ,
meses int,
casa int not null
);
Create table Gasto
(
id int primary key auto_increment,
monto decimal(12,2),
fechapago datetime,
fechaini datetime,
fechafin datetime,
nombre varchar(255),
circuito int not null,
tipogasto int not null
);
Create table Tipo_Gasto
(
id int primary key auto_increment,
descripcion varchar(500)
);

alter table Circuito add foreign key (fraccionamiento) references Fraccionamiento(id);
alter table Casa add foreign key (circuito) references Circuito(id);
alter table Tarjeta add foreign key (casa) references Casa(id);
alter table Cuota add foreign key (casa) references Casa(id);
alter table Gasto add foreign key (circuito) references Circuito(id);
alter table Gasto add foreign key (tipogasto) references Tipo_Gasto(id);

-- (B)------------------------------------------------------
alter table Gasto add descripcion varchar(500) default '-----';
-- (C)-------------------------------------------------
insert into Fraccionamiento (nombre,ciudad,estado,colonia,cp,montocuota,diasprorroga,montopenalizacion) values
('Las Rosas','Gomez Palacio','Durango','la feria','35048',500,5,150),
('Las Margaritas','Gomez Palacio','Durango','santa maria','35068',700,2,200);
-------------------------------------------------
insert into Circuito (nombre,fraccionamiento) values
('Piñas',2),
('Naranjos',2),
('Platanos',1),
('Manzanos',1),
('Toronjas',2);

-- update Circuito set nombre='Piñas'  where id=1
-- select * from Circuito
-- UPDATE TABLA SET columna=valor WHERE

-- Casa Circuito 1
insert into Casa (numero,inquilino,circuito) values
(01,'Alan Lopez Garza',1),
(02,'Jose Luis Melendez Pelcastre',1),
(03,'Jose Orlando Martinez Castro',1),
(04,'Erik Adan Ruiseco Cisneros',1),
(05,'Orion Daniel De Santiago Madrid',1),
-- Casa Circuito2
(01,'Edgar David Ibarra Garcia',2),
(02,'Ana Martinez Perez',2),
(03,'Yareth Roman Martinez',2),
(04,'Marco Solis Perez',2),
(05,'Flavio Lozoria Padilla',2),
-- Casa Circuito3
(01,'Daniel Garcia Jaramillo',3),
(02,'Luis Gonzalez Moreno',3),
(03,'Alexis Ramirez Gracia',3),
(04,'Eduardo Reyes Moreno',3),
(05,'Daniel Barajas Gaytan',3),
-- Casa Circuito4
(01,'Celia Martinez Alvarado',4),
(02,'Cesar Gaytan Quesada',4),
(03,'Isabel De La Cruz Rodriguez',4),
(04,'Alan Perez Garza',4),
(05,'Alan Ramirez Castañeda',4),
-- Casa Circuito4
(01,'Romero Martinez Ramirez',5);
----------------------------------------------
insert into Tipo_Gasto (descripcion)values
('Pagos de servicios'), -- agua luz telefono cable
('Mantenimiento'),-- limpieza de jardines areas verdes recoleccion de basura
('Otros');-- vigilancia;
-- (D)---------------------- CAST(N'2018-07-10' AS Date)
insert into Cuota (fechapago,fechaini,fechafin,montopago,meses,casa) values
(CAST(N'2022-07-12' AS Date),CAST(N'2022-07-01' as date),CAST(N'2022-08-01' as date),3500,1,15),
(CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),2500,1,1),
(CAST(N'2022-02-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-03-01' as date),5000,3,2),
(CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-05-01' as date),2500,5,3),
(CAST(N'2022-11-12' AS Date),CAST(N'2022-11-01' as date),CAST(N'2022-12-01' as date),3000,1,10),
(CAST(N'2022-02-12' AS Date),CAST(N'2022-02-01' as date),CAST(N'2022-04-01' as date),5000,3,6),
(CAST(N'2022-03-12' AS Date),CAST(N'2022-03-01' as date),CAST(N'2022-04-01' as date),2000,1,7),
(CAST(N'2022-07-12' AS Date),CAST(N'2022-05-01' as date),CAST(N'2022-07-01' as date),4500,3,11),
(CAST(N'2022-02-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),5000,1,18),
(CAST(N'2022-08-12' AS Date),CAST(N'2022-09-01' as date),CAST(N'2022-10-01' as date),5000,1,17),
(CAST(N'2022-07-12' AS Date),CAST(N'2022-07-01' as date),CAST(N'2022-08-01' as date),3500,1,15);

Select * from cuota;

-- Gastos circuito 1-------------
insert into Gasto (monto,fechapago,fechaini,fechafin,nombre,circuito,tipogasto,descripcion) values
(5000,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Agua',1,1,'mmm no se'),
(5000,CAST(N'2022-02-12' AS Date),CAST(N'2022-02-01' as date),CAST(N'2022-04-01' as date),'Limpieza de jardines',1,2,'mmm no se'),
(3000,CAST(N'2022-01-12' AS Date),CAST(N'2022-03-01' as date),CAST(N'2022-04-01' as date),'Telefono',1,1,'mmm no se'),
(12000,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-04-01' as date),'Vigilancia',1,3,'mmm no se'),
(2850,CAST(N'2022-03-12' AS Date),CAST(N'2022-03-01' as date),CAST(N'2022-04-01' as date),'Recoleccion de basura',1,2,'mmm no se'),
-- Circuito2-----------
(2850,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Agua',2,1,'mmm no se'),
(15000,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-04-01' as date),'Vigilancia',2,3,'mmm no se'),
(3000,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Recoleccion de basura',2,2,'mmm no se'),
(3000,CAST(N'2022-02-12' AS Date),CAST(N'2022-02-01' as date),CAST(N'2022-03-01' as date),'Podado de arboles',2,2,'mmm no se'),
(8000,CAST(N'2022-04-12' AS Date),CAST(N'2022-04-01' as date),CAST(N'2022-06-01' as date),'Vigilancia',2,3,'mmm no se'),
-- Circuito3
(2850,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Luz',3,1,'mmm no se'),
(500,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Agua',3,1,'mmm no se'),
(1000,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Recoleccion de basura',3,2,'mmm no se'),
(5000,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Vigilancia',3,3,'mmm no se'),
(2963,CAST(N'2022-03-12' AS Date),CAST(N'2022-03-01' as date),CAST(N'2022-04-01' as date),'Telefono',3,1,'mmm no se'),
-- Circuito4
(3021,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Agua',4,1,'mmm no se'),
(5874,CAST(N'2022-01-12' AS Date),CAST(N'2022-01-01' as date),CAST(N'2022-02-01' as date),'Vigilancia',4,3,'mmm no se'),
(3208.25,CAST(N'2022-02-12' AS Date),CAST(N'2022-02-01' as date),CAST(N'2022-03-01' as date),'Recoleccion de basura',4,2,'mmm no se'),
(587,CAST(N'2022-03-12' AS Date),CAST(N'2022-03-01' as date),CAST(N'2022-03-01' as date),'Podada de arboles Casa 02',4,2,'mmm no se'),
(2583,CAST(N'2022-05-12' AS Date),CAST(N'2022-05-01' as date),CAST(N'2022-06-01' as date),'Telefono',4,1,'mmm no se');

Select * from Gasto;


-- [1]. Mostrar todos los pagos de cuotas por cada circuito ordenados por monto total de forma descendente y
--  después por nombre del circuito de manera descendente.
 -- Se debe mostrar Número y nombre del circuito, total de casas que hay en el circuito, monto de penalización y total pago.
WITH InfoCircuitos AS (
  SELECT c.id AS 'Número de Circuito',
         c.nombre AS 'Nombre de Circuito',
         COUNT(DISTINCT casa.id) AS 'Total de Casas',
         f.montopenalizacion AS 'Monto de Penalización',
         SUM(co.montopago) AS 'Total de Pago'
  FROM Circuito c
  INNER JOIN Fraccionamiento f ON c.fraccionamiento = f.id
  INNER JOIN Casa casa ON c.id = casa.circuito
  LEFT JOIN Cuota co ON casa.id = co.casa
  GROUP BY c.id, c.nombre, f.montopenalizacion
)
SELECT * FROM InfoCircuitos
ORDER BY 'Total de Pago' DESC, 'Nombre de Circuito' DESC;


-- [2].	Mostrar todos los pagos de cuotas por cada circuito siempre y cuando el monto total de cuotas supere a $10,000.00, 
-- estos datos deben estar ordenados por monto total de forma descendente y después por nombre del circuito de manera descendente. 
-- Se debe mostrar Número y nombre del circuito, total de casas que hay en el circuito, monto de penalización y total pago.  
WITH InfoCircuitos AS (
  SELECT c.id AS 'Número de Circuito',
         c.nombre AS 'Nombre de Circuito',
         COUNT(DISTINCT casa.id) AS 'Total de Casas',
         f.montopenalizacion AS 'Monto de Penalización',
         SUM(co.montopago) AS 'Total de Pago'
  FROM Circuito c
  INNER JOIN Fraccionamiento f ON c.fraccionamiento = f.id
  INNER JOIN Casa casa ON c.id = casa.circuito
  LEFT JOIN Cuota co ON casa.id = co.casa
  GROUP BY c.id, c.nombre, f.montopenalizacion
  HAVING SUM(co.montopago) > 10000
)
SELECT * FROM InfoCircuitos
ORDER BY 'Total de Pago' DESC, 'Nombre de Circuito' DESC;


-- [3].	Mostrar todos los pagos de cuotas por cada circuito siempre y cuando el monto total de cuotas supere a la media, 
-- estos datos deben estar ordenados por monto total de forma descendente y después por nombre del circuito de manera descendente.  
-- Se debe mostrar Número y nombre del circuito, total de casas que hay en el circuito, monto de penalización y total pago. 

WITH InfoCircuitos AS (
  SELECT c.id AS 'Número de Circuito',
         c.nombre AS 'Nombre de Circuito',
         COUNT(DISTINCT casa.id) AS 'Total de Casas',
         f.montopenalizacion AS 'Monto de Penalización',
         SUM(co.montopago) AS 'Total de Pago'
  FROM Circuito c
  INNER JOIN Fraccionamiento f ON c.fraccionamiento = f.id
  INNER JOIN Casa casa ON c.id = casa.circuito
  LEFT JOIN Cuota co ON casa.id = co.casa
  GROUP BY c.id, c.nombre, f.montopenalizacion
  HAVING SUM(co.montopago) > (SELECT AVG(montopago) FROM Cuota)
)
SELECT * FROM InfoCircuitos
ORDER BY 'Total de Pago' DESC, 'Nombre de Circuito' DESC;

-- [4]. Mostrar los datos del circuito que menos cuotas recaudan.

WITH InfoCircuitos AS (
  SELECT c.id AS 'Número de Circuito',
         c.nombre AS 'Nombre de Circuito',
         f.nombre AS 'Nombre de Fraccionamiento',
         COUNT(DISTINCT casa.id) AS 'Total de Casas',
         f.montopenalizacion AS 'Monto de Penalización',
         SUM(co.montopago) AS 'Total de Pago'
  FROM Circuito c
  INNER JOIN Fraccionamiento f ON c.fraccionamiento = f.id
  INNER JOIN Casa casa ON   c.id = casa.circuito
  LEFT JOIN Cuota co ON casa.id = co.casa
  GROUP BY c.id, c.nombre, f.nombre, f.montopenalizacion
)
SELECT * FROM InfoCircuitos
ORDER BY 'Total de Pago' DESC;


-- [5].	Mostrar todos los pagos de cuotas por cada fraccionamiento y por cada circuito ordenados monto total de forma descendente.  
-- Se debe mostrar nombre del circuito,
-- nombre del fraccionamiento, total de casas que hay en el circuito y fraccionamiento,  monto de penalización y total pago
 
WITH InfoCircuitos AS (
  SELECT c.id AS 'Número de Circuito',
         c.nombre AS 'Nombre de Circuito',
         f.nombre AS 'Nombre de Fraccionamiento',
         COUNT(DISTINCT casa.id) AS 'Total de Casas',
         f.montopenalizacion AS 'Monto de Penalización',
         SUM(co.montopago) AS 'Total de Pago'
  FROM Circuito c
  INNER JOIN Fraccionamiento f ON c.fraccionamiento = f.id
  INNER JOIN Casa casa ON c.id = casa.circuito
  LEFT JOIN Cuota co ON casa.id = co.casa
  GROUP BY c.id, c.nombre, f.nombre, f.montopenalizacion
)
SELECT * FROM InfoCircuitos
WHERE 'Total de Pago' > 10000
ORDER BY 'Total de Pago' DESC, 'Nombre de Circuito' DESC;
