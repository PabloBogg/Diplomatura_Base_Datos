use modulo1_unidad2;
create table conductores (
dni int primary key,
nombre varchar(100),
telefono varchar(50),
direccion varchar(50),
salario int,
ciudad_residencia varchar(50)
);

create table paquetes (
id int auto_increment primary key,
descripcion varchar(100),
destinatario varchar(100),
direccion_destinatario varchar(100),
remitente varchar(50),
direccion_remitente varchar(100)
);

create table camiones (
patente varchar(50) primary key,
modelo varchar(100),
marca varchar(100),
potencia_motor int
);
