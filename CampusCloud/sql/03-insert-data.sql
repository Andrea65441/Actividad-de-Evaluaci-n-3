USE CampusCloud

INSERT INTO Estudiantes (id_estudiante, matricula, nombre, correo)
VALUES (1,'2520002', 'Ana lopez', 'anauniversidad@gmail.com'),
	   (2,'2520003', 'Lana lopez', 'Lanauniversidad@gmail.com');


INSERT INTO Servicios(id_servicio, nombre, descripcion)
VALUES (1,'constancia de estudios', 'Solicitud de constancia academica'),
	   (2,'Prestamo de laboratorio', 'se reservo un papu equipo');


INSERT INTO Solicitudes(id_solicitud, id_estudiante, id_servicio, fecha, estado)
VALUES (1001, 1,1, '2026-10-21', 'pendiente'),
       (1002, 2,2, '2026-10-22', 'pendiente')

	   SELECT * FROM Estudiantes;
	   SELECT * FROM Servicios;
	   SELECT * FROM Solicitudes;