-- 4.1
-- 1
use m1_u4;

-- 2
create table colores
(color varchar (25));

-- 5
select * from colores;

-- 6
begin transaction;
delete from colores; 

-- 8
select * from colores;

-- 9
commit transaction;

-- 8 repeticion
select * from colores;

-- 8 repeticion x 2
select * from colores;


-- 4.2
use m1_u4;

-- 1
create table colores
(color varchar (25));
insert into colores (color) values ('rojo');
insert into colores (color) values ('amarillo');
insert into colores (color) values ('azul');
select * from colores;

-- 3
begin transaction;

-- 4
update colores set color='celeste'
where color='azul';
rollback transaction;





