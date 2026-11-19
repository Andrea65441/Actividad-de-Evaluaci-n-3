-- Permisos sobre tablas y vistas
-- Asigació directa a usuarios o roles sobre tablas especificas

EXECUTE AS USER = 'admin_sql3';

SELECT SUSER_NAME() AS [LOGIN],
USER_NAME() AS [USUARIO_ACTUAL]


USE CampusCloud;


CREATE VIEW v_solicitudes_2026
AS
SELECT e.nombre, s.fecha, s.estado
FROM Estudiantes AS e
INNER JOIN Solicitudes AS s
ON e.id_estudiante = s.id_estudiante
WHERE DATEPART(YEAR, s.fecha) = '2026';


SELECT * FROM v_solicitudes_2026

-- Permitir la lectura en una tabla especifica
GRANT SELECT ON dbo.Estudiantes TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT * FROM dbo.Estudiantes;
SELECT * FROM dbo.Solicitudes;
SELECT * FROM dbo.Servicios;


REVERT;
GO


-- Permitir inserción y actulizacion en una tabla (servicios)
GRANT INSERT, UPDATE ON dbo.servicios TO admin_sql3;

GRANT SELECT ON dbo.servicios TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT * FROM Estudiantes;


INSERT INTO SERVICIOS
VALUES (5, 'Becas', 'Mucho Dinero');

UPDATE SERVICIOS
SET descripcion = 'Poco Dinero'
WHERE id_servicio = 5

REVERT;
GO


-- Permiso total de codigo sql DML sobre una tabla
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Solicitudes
TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT * FROM Solicitudes;

INSERT INTO Solicitudes
VALUES (2, 1, '2026-10-23', 'Pendiente');

UPDATE Solicitudes 
SET Estado = 'Pendiente'
WHERE IdSolicitud = 1003;

-- Denegar explicitamente la eliminacion de registros (Bloqueo)

DELETE Solicitudes
WHERE IdSolicitud = 1003;

DENY DELETE ON dbo.Solicitudes
TO admin_sql3

EXECUTE AS USER = 'admin_sql3';

--Quitar los permisos
REVOKE UPDATE, DELETE, INSERT, SELECT ON dbo.Solicitudes
FROM admin_sql3;


REVERT;
GO


