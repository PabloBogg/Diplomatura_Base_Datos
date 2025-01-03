create database caso2;
use caso2;

create table clientes (
dni int primary key,
nombre varchar(50),
apellido varchar(50),
direccion varchar (100),
fecha_nacimiento date,
codigo_producto int,
foreign key (codigo_producto) references productos(codigo_producto)
);

create table productos (
codigo_producto int auto_increment primary key,
nombre varchar(50),
precio_unitario decimal(10,2)
);

create table proveedores (
cuit int primary key,
nombre varchar(50),
direccion varchar(100),
codigo_producto int,
foreign key (codigo_producto) references productos(codigo_producto)
);