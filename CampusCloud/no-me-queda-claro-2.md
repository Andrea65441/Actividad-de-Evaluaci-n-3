--usar master y crear la bd

use master

CREATE DATABASE empresaVentas;


--Verificar que la bd existe
SELECT
	name,
	state_desc
FROM sys.databases
WHERE name = 'empresaVentas'



USE empresaVentas

CREATE TABLE dbo.productos (
	idproductos INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,
	Existencia INT NOT NULL
	);
	
	
CREATE TABLE dbo.clientes(
	IdCliente INT PRIMARY KEY,
	Nombre VARCHAR (100) NOT NULL,
	Correo VARCHAR(100)
	);
	
	CREATE TABLE dbo.ventas (
	IdVenta INT PRIMARY KEY,
	IdCliente INT NOT NULL,
	Fecha DATE NOT NULL,
	Total DECIMAL(10,2) NOT NULL
	);
	
	
	