-- Comprobar el login actual

SELECT SUSER_NAME () AS LoginActual;

--Verificar privilegios sysadmin

SELECT IS_SRVROLEMEMBER('sysadmin') AS [EsSysadmin]

--1=> pertenece al rol consultado
--0=> no pertenece a ese ROLE
--Null>=> No se puede determinar el resultado


SELECT
	SUSER_NAME () AS LoginActual;
	IS_SRVROLEMEMBER('sysadmin') AS [EsSysadmin]
GO

--consultar estado de SA
SELECT
	name,
	type_desc,
	is_disabled
FROM sys.server_principals
WHERE NAME = 'sa'

--name => nombre del principal
-- type_desc=> tipo de principal, para este caso el principal en SQL_LOGIN
--is_disable=> 0 significa habilitado y 1 deshabilitado 


--Verificar base de datos actual
SELECT
	DB_NAME() AS BaseActual;
GO

--Consulta completa del contexto
SELECT
SUSER_NAME() AS LoginActual,
USER_NAME() AS UsuarioBaseActual,
DB_NAME() AS BaseActual,
IS_SRVROLEMEMBER('sysadmin') AS EsSysadmin;




--Creacion  y prueba de un administrador alternativo

--Prea hacer un login siempre debemos estan en master

USE master;
GO

--Crear el login admin_sql
CREATE LOGIN admin_sql
WITH PASSWORD = 'Admin@cloud#12',
CHECK_POLICY = ON;


--Verificar si existe y esta habilitado
SELECT
	name,
	TYPE_DESC,
	is_disabled
FROM sys.server_principals
WHERE name = 'admin_sql';
GO


--Demostrar que crear un login no lo hace administrador

SELECT IS_SRVROLEMEMBER ('sysadmin', 'admin_sql') AS EsSysAdmin


--Agregar admin_sql al rol de servidor sysadmin
ALTER SERVER ROLE sysadmin
ADD MEMBER admin_sql;
GO


--Validar la nueva membresia
SELECT IS_SRVROLEMEMBER ('sysadmin', 'admin_sql') AS EsSysAdmin


use master


SELECT
	SUSER_NAME() AS LoginActual,
	USER_NAME() AS UsuarioActual,
	DB_NAME() AS BaseActual,
	IS_SRVROLEMEMBER ('sysadmin') AS EsSysAdmin
