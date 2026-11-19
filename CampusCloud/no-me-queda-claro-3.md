
use empresaVentas;

SELECT
SUSER_NAME() AS LoginActual,
USER_NAME() AS UsuarioActual,
DB_NAME() AS BaseActual;

SELECT * FROM dbo.clientes;
SELECT * FROM dbo.productos;
SELECT * FROM dbo.ventas;

INSERT INTO dbo.ventas
VALUES (6,1,'2026-10-4', 25000.0);

INSERT INTO dbo.productos
VALUES (6,'Tablet', 7222.0,34);use empresaVentas;

-- Operaciones no permitidas
UPDATE dbo.ventas
SET total = 30000.0
WHERE IdVenta = 6;

-------------------------------------------------------------------------------------------------------------------------------------------------

use empresaVentas;

SELECT
SUSER_NAME() AS LoginActual,
USER_NAME() AS UsuarioActual,
DB_NAME() AS BaseActual;

SELECT * FROM dbo.clientes;
SELECT * FROM dbo.productos;
SELECT * FROM dbo.ventas;
SELECT * FROM rh.nomina;

INSERT INTO dbo.ventas
VALUES (6,1,'2026-10-4', 25000.0);

INSERT INTO dbo.productos
VALUES (6,'Tablet', 7222.0,34);use empresaVentas;

-- Operaciones no permitidas
UPDATE dbo.ventas
SET total = 30000.0
WHERE IdVenta = 6;



DELETE FROM dbo.Ventas
WHERE IdVenta = 6;


GRANT SELECTON dbo.ventas
TO vendedor1;



-- Crear un rol_vendedor y administracion de permisos mediante roles
USE empresaVentas;

--Crear Rol
CREATE ROLE rol_vendedor;

--Verificar el rol
SELECT
	name,
	type_desc
	FROM sys.databae_principals
	WHERE name = 'rol_vendedor'


--Quitar el permmiso de select a vendedor1 de la tabla productos
REVOKE SELECT
ON dbo.productos
FROM vendedor1;
GO

--Agregar Vendedor1 a rol_vendedor
ALTER ROLE rol_vendedor
ADD MEMBER vendedor1;
GO

--Verificar la membresia del usuario rol
SELECT
	r.name AS [ROL],
	u.name [USUARIO]
FROM sys.database_role_members AS drm
INNER JOIN sys.database_principals AS r
ON drm.role_principal_id = r.principal_id
JOIN sys.database_principals AS u
ON drm.member_principal_id = u.principal_id
WHERE r.name = 'rol_servidor'
GO


--Cnceder permisos de select sobre productos al rol
GRANT SELECT
ON dbo.productos
TO rol_vendedor;
GO


--ACTIVIDAD------PERMISOS EN RH-NOMINA
GRANT SELECT ON rh.nomina
TO rol_vendedor

GRANT INSERT ON rh.nomina
TO rol_vendedor

--Correcion

GRANT SELECT, INSERT, UPDATE
ON dbo.clientes
TO rol_vendedor;
GO




--ACTIVIDAD-------ASOCIAR LOGIN AL ROL
use master
GO

--crear login
CREATE LOGIN vendedor2
WITH PASSWORD = 'vendedor2',
CHECK_POLICY = ON;

--Crear usuario vendedor2
CREATE USER vendedor2
For LOGIN vendedor2;
GO


use empresaVentas;

--asociar rol
ALTER SERVER ROLE empresaVentas
ADD MEMBER vendedor2;

--Consultar permisos del rol

SELECT 
	pr.name AS Principal
	pe.permission_name AS Permiso
	pe.state_desc AS Estado,
	OBJECT_NAME(pe.major_id) AS Objeto
FROM sys.database_permissions AS pe
INNER JOIN sys.database_principals AS pr
ON pe.grantee_principal_id = pr.principal_id
WHERE pr.name = 'rol_vendedor'
