--1 Gestion de roles fijos
--A. NIVEL SERVIDOR
USE master;

CREATE LOGIN admin_sql2
WITH PASSWORD = 'p@SSWORD';

-- AGREGAR UN INICIO DE SESION (LOGIN) AL ROL DE ADMINISTRADOR DE SERVIDOR
ALTER SERVER ROLE sysadmin
ADD MEMBER admin_sql2;



CREATE LOGIN admin_sql3
WITH PASSWORD = 'p@SSWORD';

-- AGREGAR AL ROL DE CREADOR DE BASE DE DATOS
ALTER SERVER ROLE dbcreator ADD MEMBER admin_sql3;



-- B. A nivel de base de datos
USE CampusCloud;

CREATE USER admin_sql3
FOR LOGIN admin_sql3;

DROP USER lector_campus

-- Permitir solo lectura (Select en todas las tablas y vistas)
ALTER ROLE db_datareader
ADD MEMBER admin_sql3;


EXECUTE AS USER = 'admin_sql3';


DELETE FROM servicios WHERE id_servicio = 1




ALTER ROLE db_datareader
ADD MEMBER admin_sql3;

ALTER ROLE db_datareader
DROP MEMBER admin_sql3;

ALTER ROLE db_datawriter

DROP MEMBER admin_sql3;


EXECUTE AS USER = 'admin_sql3';

DELETE FROM servicios WHERE id_servicio = 1

-- Permitir solo escritura (INSERT, UPDATE, DELETE en todas las tablas)
ALTER ROLE db_datareader
DROP MEMBER admin_sql3;

ALTER ROLE db_datawriter
DROP MEMBER admin_sql3;

ALTER ROLE db_ddladmin
DROP MEMBER admin_sql3;



EXECUTE AS USER = 'admin_sql3';

SELECT SUSER_NAME() AS [LOGIN],
USER_NAME() AS [USUARIO_ACTUAL]

SELECT * FROM servicios;

INSERT INTO Servicios
VALUES (3, 'Cafeteria', 'Pura comida buena');

UPDATE Servicios
SET nombre = 'Cafeteria10'
WHERE id_servicio = 3;

DELETE FROM Servicios


SELECT 
pr.name AS Principal,
pe.permission_name AS Permiso,
pe.state_desc AS Estado,
OBJECT_NAME(pe.major_id) AS Objecto
FROM sys.database_permissions AS pe
INNER JOIN sys.database_principals AS pr
ON pe.grantee_principal_id = pr.principal_id
WHERE pr.name = 'admin_sql3';


-- permite administraión de objetos (DDL: create, alter, drop)

ALTER ROLE db_ddladmin
ADD MEMBER admin_sql3;

CREATE TABLE prueba (
    id INT NOT NULL,
    nombre VARCHAR(100)
);

ALTER TABLE prueba
ADD edad INT NOT NULL;

DROP TABLE prueba;










REVERT;
GO
