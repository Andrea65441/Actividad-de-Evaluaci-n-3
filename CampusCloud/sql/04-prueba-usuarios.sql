--entrar a campus cloud con admin

INSERT INTO Estudiantes
VALUES (3, '2045601', 'Maximina Buen Rostro', 'maxi@universidad.com');

UPDATE Estudiantes
SET nombre = 'Maximina Mal Rostro'
WHERE id_estudiante = 3;

-- Cambiar al contexto de usuario operador_campus

EXECUTE AS USER = 'operador_campus'
GO

SELECT 
    SYSTEM_USER AS [Login_Original],
    CURRENT_USER AS [USUARIO_BD_ACTUAL],
    USER_NAME() AS [NOMBRE_USUARIO ]

    SELECT * FROM servicios;

INSERT INTO Estudiantes
VALUES (4, '2045601', 'Maximina Buen Rostro', 'maxi@universidad.com');


UPDATE Estudiantes
SET nombre = 'Maximina Mal Rostro'
WHERE id_estudiante = 4;

DELETE Estudiantes
WHERE id_estudiante = 4

