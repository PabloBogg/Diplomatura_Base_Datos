-- EJERCICIO 2.1 Y 2.2
create database modulo1_unidad2;
use modulo1_unidad2;
create table jugadores (
id int auto_increment primary key, 
nombre varchar(50),
apellido varchar(50), 
edad int, 
posicion varchar(50), 
dni int);
insert into jugadores (nombre, apellido, edad, posicion, dni) values 
("Alberto","Perez",21,"Delantero",31222333),
("Juan","Rodriguez",23,"Defensor",30222444),
("José","Sanchez",25,"Arquero",29444333);

-- EJERCICIO 2.3
-- Escriba la sentencia de recuperación de datos que permita ver los DNI y los  nombres
select dni, nombre, apellido from jugadores;

 -- EJERCICIO 2.4 
-- Escribir una sentencia para borrar a todos los que tengan menos de 21 años de  edad.
set sql_safe_updates=0;
delete from jugadores where edad<21;
select * from jugadores;

-- EJERCICIO 2.5 
-- Escribir la sentencia necesaria para modificar la edad de Rodriguez a 38 años
UPDATE jugadores set edad=38 where apellido="Rodriguez";
select * from jugadores;