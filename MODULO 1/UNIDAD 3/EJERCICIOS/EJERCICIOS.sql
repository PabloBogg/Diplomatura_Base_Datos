-- EJERCICIOS PRACTICOS

-- 3.1
create database m1_u3;
use m1_u3;

create table conductores (
dni int primary key,
nombre varchar(100) not null,
telefono varchar(50) not null,
direccion varchar(50),
salario decimal(10,2) not null,
ciudad_residencia varchar(50)
);

create table paquetes (
id bigint identity(1,1) primary key,
descripcion varchar(100) not null,
destinatario varchar(100) not null,
direccion_destinatario varchar(100) not null,
remitente varchar(50) not null,
direccion_remitente varchar(100) not null
);

create table camiones (
patente varchar(50) primary key,
modelo varchar(100),
marca varchar(100),
potencia_motor int
);

-- 3.3
-- conductores
CREATE INDEX idx_nombre ON conductores(nombre);

-- paquetes
CREATE INDEX idx_descripcion ON paquetes(descripcion);

-- camiones
CREATE INDEX idx_modelo ON camiones(modelo);

-- 3.4
-- Se generan las tablas
create table productos (
codigo_producto bigint identity(1,1) primary key,
nombre varchar(50),
precio_unitario decimal(10,2)
);

create table clientes (
dni int primary key,
nombre varchar(50),
apellido varchar(50),
direccion varchar (100),
fecha_nacimiento varchar (100),
codigo_producto bigint,
foreign key (codigo_producto) references productos(codigo_producto)
);

create table proveedores (
cuit int primary key,
nombre varchar(50),
direccion varchar(100),
codigo_producto bigint,
foreign key (codigo_producto) references productos(codigo_producto)
);


CREATE VIEW vendedorpepe AS SELECT * FROM dbo.clientes WHERE nombre='pepe';
SELECT * FROM dbo.clientes WHERE nombre='pepe';


-- 3.5
CREATE VIEW vista AS SELECT CUIT, IdFactura, sum(SubTotal+Impuesto) AS 'Total' FROM Facturas; 

-- 3.6
SELECT * FROM vendedorpepe;

-- 3.7
SELECT CUIT FROM vista;

-- 3.8
DROP VIEW vendedorPepe, vista

-- 3.9
CREATE PROCEDURE [dbo].[fechaAlta]
AS 
BEGIN
SELECT * FROM clientes WHERE YEAR(FechaAlta)=2018
END

-- 3.10
CREATE PROCEDURE [dbo].[fechaAltaParametro]
@anio int
AS 
BEGIN
SELECT * FROM clientes WHERE YEAR(FechaAlta)=@anio
END

-- 3.11
EXEC dbo.fechaAlta
EXEC dbo.fechaAltaParametro 2018

-- 3.12
DROP PROCEDURE dbo.fechaAlta
DROP PROCEDURE dbo.fechaAltaParametro 

-- 3.13
-- A
SELECT SQRT(4);

-- B
SELECT SIN(PI()/2);

-- C
SELECT LOG(10);

-- D
SELECT ROUND(0.33333,3);

-- E
SELECT POWER(5,3);

-- F
SELECT TAN(PI()/4);

-- G
SELECT COS(PI());

-- H
SELECT POWER(32,0.2);

-- I
SELECT LOG(5)+LOG(3);
SELECT LOG(15);

-- J
SELECT LOG(25);
SELECT LOG(5);


-- 3.14
-- A
SELECT LEFT('ABCDEFGHIJ',5);

-- B
SELECT RIGHT('ABCDEFGHIJ',5);

-- C
SELECT LOWER('ABCDEFGHIJ');

-- D
SELECT UPPER(LOWER('ABCDEFGHIJ'));

-- E
SELECT SUBSTRING('ABCDEFGHIJ',3,3);

-- F
SELECT REPLICATE('A',20);

-- G
SELECT REPLACE('MAMA','M','C');

-- H
SELECT RTRIM(' ABC ');

-- I
SELECT LTRIM(' ABC ');

-- J
SELECT TRIM(' ABC ');


-- 3.15
-- A
SELECT GETDATE();

-- B
SELECT YEAR(GETDATE());

-- C
SELECT MONTH(GETDATE());

-- D
SELECT DAY(GETDATE());

-- E
SELECT DATEADD(day,7,getdate());

-- F
SELECT MONTH(DATEADD(day,30,getdate()));

-- G
SELECT DATEADD(year,1,getdate());

-- H
SELECT DATEADD(year,30,'1993-03-19');

-- I
SELECT YEAR(DATEADD(year,30,'1993-03-19'));

-- J
SELECT MONTH(DATEADD(MONTH,-9,'1993-03-19'));


-- 3.16
-- C
SELECT SCHEMA_NAME();


-- Crear la función
CREATE FUNCTION dbo.b(@year INT) 
RETURNS VARCHAR(12) 
AS
BEGIN
    IF @year % 4 = 0
    BEGIN
        IF @year % 100 = 0
        BEGIN
            IF @year % 400 = 0
            BEGIN
                RETURN 'AÑO BISIESTO';
            END
            ELSE
            BEGIN
                RETURN 'AÑO NO BISIESTO';
            END;
        END
        ELSE
        BEGIN
            RETURN 'AÑO BISIESTO';
        END;
    END
    ELSE
    BEGIN
        RETURN 'AÑO NO BISIESTO';
    END;
    
    RETURN 'Error'; -- Para asegurar que siempre haya un RETURN al final
END;

-- Probar la función
DECLARE @year INT;
SET @year = 2000; -- Puedes cambiar el año aquí para probar con diferentes valores

SELECT @year AS Anio, dbo.b(@year) AS Resultado;


-- 3.18
-- CREAR LA FUNCION
DROP FUNCTION dbo.Pares;
CREATE FUNCTION dbo.Pares(@numeroFinal int)
RETURNS @Pares TABLE (Numero INT)
AS
BEGIN
    DECLARE @numero INT = 0;
    WHILE @numero < @numeroFinal
    BEGIN
        INSERT INTO @Pares (Numero) VALUES (@numero);
        SET @numero = @numero + 2;
    END
    
    RETURN;
END;



-- PROBAR LA FUNCION
DECLARE @numero int;
SET @numero=23;
SELECT * FROM dbo.Pares(@numero);

-- 3.19
-- CREAR LA FUNCION
CREATE FUNCTION dbo.ParesMenoresQue100()
RETURNS @tabla TABLE (numero int,ParoImpar varchar(5))
AS
BEGIN
	DECLARE @NUM INT SET @NUM=0;
	WHILE @NUM<100
		BEGIN
		IF @NUM%2=0
			BEGIN
				INSERT INTO @tabla (numero,ParoImpar) VALUES (@NUM, 'PAR');
			END
			ELSE
			BEGIN
				INSERT INTO @tabla (numero,ParoImpar) VALUES (@NUM, 'IMPAR');
			END
		SET @NUM=@NUM+1;
		END
		RETURN;
	END;
-- PROBAR LA FUNCION
SELECT * FROM dbo.ParesMenoresQue100();


-- 3.20
create table productos (
codigo_producto bigint identity(1,1) primary key,
nombre varchar(50),
precio_unitario decimal(10,2)
);
 -- 3.20
 CREATE TABLE sueldos(id bigint identity(1,1) primary key, nombre varchar(50), sueldo decimal(10,2));
 INSERT INTO sueldos (nombre, sueldo) VALUES ('juan', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('maría', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('carlos', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('ana', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('luis', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('elena', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('miguel', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('sofía', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('pedro', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('laura', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('jorge', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('lucía', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('andrés', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('valeria', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('fernando', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('natalia', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('diego', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('isabel', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('roberto', FLOOR(RAND() * 50000) + 20000);
INSERT INTO sueldos (nombre, sueldo) VALUES ('patricia', FLOOR(RAND() * 50000) + 20000);

select * from sueldos;
-- A
SELECT  MAX(sueldo) FROM sueldos;
SELECT nombre,sueldo FROM sueldos WHERE sueldo=(SELECT  MAX(sueldo) FROM sueldos);

-- B
SELECT  MIN(sueldo) FROM sueldos;
SELECT nombre,sueldo FROM sueldos WHERE sueldo=(SELECT MIN(sueldo) FROM sueldos);

-- C
SELECT  AVG(sueldo) FROM sueldos;
SELECT nombre,sueldo FROM sueldos WHERE sueldo=(SELECT AVG(sueldo) FROM sueldos);

-- D
SELECT COUNT(*) FROM sueldos;


-- 3.21
 drop table liquidaciones;
 CREATE TABLE liquidaciones(
 id_empleado bigint identity(1,1) primary key,
 nombre varchar(50), 
 mes varchar(20),
 liquidacion decimal(10,2));

 INSERT INTO liquidaciones (nombre, mes,liquidacion) VALUES ('juan', 'enero',FLOOR(RAND() * 50000) + 20000);
 INSERT INTO liquidaciones (nombre, mes,liquidacion) VALUES ('maría', 'enero',FLOOR(RAND() * 50000) + 20000);
 INSERT INTO liquidaciones (nombre, mes,liquidacion) VALUES ('carlos', 'enero',FLOOR(RAND() * 50000) + 20000);
 INSERT INTO liquidaciones (nombre, mes,liquidacion) VALUES ('ana', 'enero',FLOOR(RAND() * 50000) + 20000);
 INSERT INTO liquidaciones (nombre, mes,liquidacion) VALUES ('luis', 'enero',FLOOR(RAND() * 50000) + 20000);
 select * from liquidaciones;

 -- A
 -- CREACION DEL TRIGGER
 CREATE TRIGGER borrarEmpleado
 ON sueldos
 AFTER delete
 AS
 BEGIN
 DELETE FROM liquidaciones WHERE id_empleado in (SELECT id FROM DELETED);
 END;

 -- CONSULTA DE REGISTROS
 SELECT * FROM sueldos;
 SELECT * FROM liquidaciones;

 -- PRUEBA DEL TRIGGER
 DELETE FROM sueldos WHERE id=1;

 -- B
  -- CREACION DEL TRIGGER
 CREATE TRIGGER insertarEmpleado
 ON liquidaciones
 AFTER INSERT 
 AS
 BEGIN
 INSERT INTO sueldos (nombre,sueldo) SELECT nombre,liquidacion from inserted;
 END;

 -- CONSULTA DE REGISTROS
 SELECT * FROM sueldos;
 SELECT * FROM liquidaciones;

 -- PRUEBA DEL TRIGGER
INSERT INTO liquidaciones (nombre, mes,liquidacion) VALUES ('juan','febrero',35.25);


-- C
-- CREACION DEL TRIGGER
DROP TRIGGER modificarNombre;
CREATE TRIGGER modificarNombre
ON sueldos
AFTER UPDATE
AS
BEGIN
UPDATE liquidaciones  SET nombre=(SELECT nombre FROM inserted) WHERE nombre =(SELECT nombre FROM deleted)
END;

-- CONSULTA DE REGISTROS
 SELECT * FROM sueldos;
 SELECT * FROM liquidaciones;

-- PRUEBA DEL TRIGGER
UPDATE sueldos SET nombre='ana maria de los angeles' WHERE id=2;



-- 3.22
DROP TABLE personal;
CREATE TABLE personal(
id int identity(1,1) primary key,
 nombre varchar(50), 
 fechaIngreso date);

 INSERT INTO personal (nombre, fechaIngreso) VALUES ('juan', '02-10-2017');
 INSERT INTO personal (nombre, fechaIngreso) VALUES ('ana', '05-12-2019');
 INSERT INTO personal (nombre, fechaIngreso) VALUES ('sofia', '10-01-2024');
 INSERT INTO personal (nombre, fechaIngreso) VALUES ('pedro', '10-12-1999');
 INSERT INTO personal (nombre, fechaIngreso) VALUES ('nicolas', '11-04-2020');
 
 select * from personal;
 
 ALTER TABLE personal ADD  legajo int;


  -- A
  DECLARE c CURSOR FOR SELECT id FROM personal ORDER BY fechaIngreso ASC;
  OPEN c
  DECLARE @variable INT
  FETCH NEXT FROM c INTO @variable
  DECLARE @CONTADOR INT
  SET @CONTADOR=1
  WHILE @@FETCH_STATUS=0
  BEGIN
  UPDATE personal SET legajo=@CONTADOR WHERE id=@variable 
  SET @CONTADOR=@CONTADOR+1
  FETCH NEXT FROM c INTO @variable
  END
  CLOSE c
  DEALLOCATE c


  -- B
 INSERT INTO personal (nombre, fechaIngreso) VALUES ('ariel', '10-12-1986');
 INSERT INTO personal (nombre, fechaIngreso) VALUES ('eliana', '05-12-2021');
 INSERT INTO personal (nombre, fechaIngreso) VALUES ('maria', '10-01-1995');

 DECLARE c CURSOR FOR SELECT id FROM personal WHERE legajo IS NULL ORDER BY fechaIngreso ASC;
  OPEN c
  DECLARE @variable2 INT
  FETCH NEXT FROM c INTO @variable2
  DECLARE @CONTADOR2 INT
  SET @CONTADOR2=(select max(legajo)from personal)+1
  WHILE @@FETCH_STATUS=0
  BEGIN
  UPDATE personal SET legajo=@CONTADOR2 WHERE id=@variable2 
  SET @CONTADOR2=@CONTADOR2+1
  FETCH NEXT FROM c INTO @variable2
  END
  CLOSE c
  DEALLOCATE c

  



 



