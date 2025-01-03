create database caso3;
use caso3;

create table profesores (
dni int primary key,
nombre varchar(50),
apellido varchar(50),
telefono varchar (100),
codigo_modulo int,
foreign key (codigo_modulo) references modulos(codigo)
);

create table alumnos (
legajo int primary key,
nombre varchar(50),
apellido varchar(50),
fecha_nacimiento date,
codigo_modulo int,
foreign key (codigo_modulo) references modulos(codigo)
);

create table modulos (
codigo int primary key,
nombre varchar(50)
);