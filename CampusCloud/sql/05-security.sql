use master;
GO

-- Crear un login
CREATE LOGIN consulta_campus
WITH PASSWORD = 'P@sswordConsulta123!';

-- SELECCIONAMOS CampusCloud y creamos el usuario Asociado
USE CampusCloud;

CREATE USER consulta_campus
FOR LOGIN consulta_campus;

-- CREAR ROL rol_consulta
CREATE ROLE rol_consulta;

-- Permisos de Lectura
GRANT SELECT TO rol_consulta;

-- Agregamos el usuario al rol
ALTER ROLE rol_consulta
ADD MEMBER consulta_campus;

-- Login Operador
use master;
GO


CREATE LOGIN operador_campus
WITH PASSWORD = 'P@sswordOperador123!';

USE CampusCloud;

CREATE USER operador_campus
FOR LOGIN operador_campus;


CREATE ROLE rol_operador;

GRANT SELECT, INSERT, UPDATE
TO rol_operador;


ALTER ROLE rol_operador
ADD MEMBER operador_campus;



--Login Admin
USE master;
CREATE LOGIN admin_campus
WITH PASSWORD = 'P@sswordadmin123!';

USE CampusCloud;
GO

CREATE USER admin_campus
FOR LOGIN admin_campus;
GO

ALTER ROLE db_owner
ADD MEMBER admin_campus;
