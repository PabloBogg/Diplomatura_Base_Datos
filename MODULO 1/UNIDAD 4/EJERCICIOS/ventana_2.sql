-- 4.1
-- 1
create database m1_u4;
use m1_u4;

-- 3
select * from colores;

-- 4
insert into colores (color) values ('rojo');
insert into colores (color) values ('marron');
insert into colores (color) values ('regro');

-- 7
select * from colores;

-- 7 repeticion
select * from colores;

-- 10
begin transaction;

-- 11
insert into colores (color) values ('verde');
insert into colores (color) values ('blanco');
insert into colores (color) values ('violeta');

-- 7 repeticion x 2
select * from colores;

-- 13
rollback transaction;


-- 4.2
use m1_u4;

-- 5
select * from colores;

-- 6
update colores set color='violeta'
where color='azul';



