
USE xtart_manager;

-- INSERT

INSERT INTO codigopostal_ciudad (codigo_postal, ciudad) VALUES
(28001,'Madrid'),
(8001,'Barcelona'),
(41001,'Sevilla'),
(46001,'Valencia'),
(29001,'Málaga'),
(50001,'Zaragoza'),
(48001,'Bilbao'),
(15001,'A Coruña'),
(33001,'Oviedo'),
(7001,'Palma');


INSERT INTO ligas (id_liga, nombre, temporada, numero_equipos, fecha_inicio, fecha_final) VALUES
(1,'Copa del rey','2025/2026',126,'2025-10-15','2026-04-25'),
(2,'liga española','2025/2026',20,'2025-08-15','2026-05-24'),
(3,'supercopa','2025/2026',4,'2026-01-10','2026-01-15');


INSERT INTO jornadas (id_jornada, fecha_inicio, fecha_final, numero_jornada, estado, id_liga) VALUES
(1,'2025-08-15','2025-08-18',1,'finalizada',2),
(2,'2025-08-22','2025-08-25',2,'finalizada',2),
(3,'2025-08-29','2025-09-01',3,'finalizada',2),
(4,'2025-09-05','2025-09-08',4,'iniciada',2),
(5,'2025-09-12','2025-09-15',5,'pendiente',2),
(6,'2025-10-15','2025-10-18',1,'pendiente',1),
(7,'2025-10-22','2025-10-25',2,'pendiente',1),
(8,'2025-10-29','2025-11-01',3,'pendiente',1),
(9,'2026-01-10','2026-01-12',1,'pendiente',3),
(10,'2026-01-13','2026-01-15',2,'pendiente',3);


INSERT INTO estadios (id_estadio, nombre, capacidad, direccion, ciudad, codigo_postal, anio_inauguracion, tipo_cesped) VALUES
(1,'Estadio Central',60000,'Av. Principal 1','Madrid',28001,1947,'natural'),
(2,'Arena Mediterránea',55000,'C/ Mar 12','Barcelona',8001,1957,'natural'),
(3,'Campo del Sur',42000,'Paseo Río 3','Sevilla',41001,1958,'natural'),
(4,'Nuevo Levante',48000,'Av. Naranja 20','Valencia',46001,1923,'natural'),
(5,'Costa Stadium',30000,'C/ Sol 8','Málaga',29001,1941,'natural'),
(6,'Ebro Park',35000,'Av. Pilar 2','Zaragoza',50001,1957,'artificial'),
(7,'San Mamés 2',53000,'C/ Arenal 5','Bilbao',48001,2013,'natural'),
(8,'Riazor XXI',34000,'Av. Orzán 10','A Coruña',15001,1944,'natural'),
(9,'Astur Field',28000,'C/ Sidra 6','Oviedo',33001,2000,'artificial'),
(10,'Isla Arena',26000,'Av. Palma 9','Palma',7001,1999,'natural');

-- Para permitir datos mas antiguos en el tipo de dato YEAR
ALTER TABLE equipos
  MODIFY anio_fundacion SMALLINT NULL;

INSERT INTO equipos (id_equipos, nombre, ciudad, codigo_postal, anio_fundacion, id_estadio) VALUES
(1,'Madrid FC','Madrid',28001,1902,1),
(2,'Barcelona SC','Barcelona',8001,1899,2),
(3,'Sevilla Unión','Sevilla',41001,1905,3),
(4,'Valencia Club','Valencia',46001,1919,4),
(5,'Málaga Deportivo','Málaga',29001,1904,5),
(6,'Zaragoza Real','Zaragoza',50001,1932,6),
(7,'Bilbao Athletic','Bilbao',48001,1898,7),
(8,'Coruña CF','A Coruña',15001,1906,8),
(9,'Oviedo Sport','Oviedo',33001,1926,9),
(10,'Palma United','Palma',7001,1916,10);


INSERT INTO entrenadores (id_entrenador, nombre, apellidos, fecha_nacimiento, anios_experiencia) VALUES
(1,'Luis','García','1979-02-10',12),
(2,'Carlos','Pérez','1981-06-21',10),
(3,'Miguel','Santos','1975-11-03',18),
(4,'Javier','Ruiz','1984-09-14',9),
(5,'Sergio','Martín','1978-01-30',15),
(6,'Alberto','Navarro','1980-05-12',11),
(7,'Diego','Romero','1976-08-08',17),
(8,'Rubén','Molina','1983-12-25',8),
(9,'Iván','Ortega','1977-04-17',16),
(10,'Pablo','Vega','1982-07-05',10);


INSERT INTO entrenadores_equipos (id_equipo, id_entrenador, temporada, fecha_inicio, fecha_fin) VALUES
(1,1,'2025/2026','2025-07-01',NULL),
(2,2,'2025/2026','2025-07-01',NULL),
(3,3,'2025/2026','2025-07-01',NULL),
(4,4,'2025/2026','2025-07-01',NULL),
(5,5,'2025/2026','2025-07-01',NULL),
(6,6,'2025/2026','2025-07-01',NULL),
(7,7,'2025/2026','2025-07-01',NULL),
(8,8,'2025/2026','2025-07-01',NULL),
(9,9,'2025/2026','2025-07-01',NULL),
(10,10,'2025/2026','2025-07-01',NULL);


INSERT INTO arbitros (id_arbitro, nombre, tipo, nacionalidad, fecha_nacimiento, supervisa) VALUES
(1,'Álvaro','principal','España','1985-03-10',NULL),
(2,'Jorge','asistente','España','1989-06-18',1),
(3,'Raúl','asistente','España','1990-02-22',1),
(4,'Hugo','VAR','España','1987-01-12',1),
(5,'Mario','principal','Portugal','1984-09-09',NULL),
(6,'Tiago','asistente','Portugal','1991-12-01',5),
(7,'Nuno','VAR','Portugal','1988-07-07',5),
(8,'Said','principal','Marruecos','1986-10-20',NULL),
(9,'Youssef','asistente','Marruecos','1992-05-30',8),
(10,'Karim','VAR','Marruecos','1989-11-11',8);


INSERT INTO posiciones (id_posicion_jugada, posicion_jugada) VALUES
(1,'Portero'),
(2,'Lateral derecho'),
(3,'Central'),
(4,'Lateral izquierdo'),
(5,'Pivote'),
(6,'Mediocentro'),
(7,'Interior'),
(8,'Extremo'),
(9,'Mediapunta'),
(10,'Delantero');


INSERT INTO jugadores (dni, fecha_nacimiento, dorsal, nombre, apellidos, altura, id_posicion_jugada, id_equipo) VALUES
('12345678A','2000-01-15',1,'Adrián','López',1.86,1,1),
('23456789B','1999-03-22',2,'Bruno','Gómez',1.78,2,2),
('34567890C','2001-07-09',3,'Carlos','Díaz',1.82,3,3),
('45678901D','1998-11-30',4,'David','Serrano',1.80,4,4),
('56789012E','2002-05-18',5,'Edu','Martínez',1.75,5,5),
('67890123F','1997-09-12',6,'Fran','Ruiz',1.83,6,6),
('78901234G','2000-02-02',7,'Gonzalo','Navarro',1.77,7,7),
('89012345H','1999-12-19',8,'Héctor','Romero',1.79,8,8),
('90123456J','2001-04-25',9,'Iván','Molina',1.81,9,9),
('01234567K','1998-08-08',10,'Jorge','Vega',1.84,10,10);


INSERT INTO telefono_jugador (dni_jugador, telefono) VALUES
('12345678A','600000001'),
('23456789B','600000002'),
('34567890C','600000003'),
('45678901D','600000004'),
('56789012E','600000005'),
('67890123F','600000006'),
('78901234G','600000007'),
('89012345H','600000008'),
('90123456J','600000009'),
('01234567K','600000010');


INSERT INTO fichajes (id_fichaje, fecha_fichaje, precio, salario, estado, dni_jugador) VALUES
(1,'2025-07-05',12000000.00,2500000.00,'cerrado','12345678A'),
(2,'2025-07-06',8000000.00,1800000.00,'cerrado','23456789B'),
(3,'2025-07-07',5000000.00,1200000.00,'cerrado','34567890C'),
(4,'2025-07-08',3000000.00,900000.00,'cerrado','45678901D'),
(5,'2025-07-09',1500000.00,700000.00,'cerrado','56789012E'),
(6,'2025-07-10',2000000.00,850000.00,'cerrado','67890123F'),
(7,'2025-07-11',4000000.00,1100000.00,'cerrado','78901234G'),
(8,'2025-07-12',2500000.00,950000.00,'cerrado','89012345H'),
(9,'2025-07-13',1000000.00,600000.00,'cerrado','90123456J'),
(10,'2025-07-14',2200000.00,800000.00,'cerrado','01234567K');


INSERT INTO partidos (goles_locales, goles_visitantes, hora, fecha, numero_partido, id_jornada, id_estadio, id_equipo_local, id_equipo_visitante, id_equipo_ganador) VALUES
(2,1,'18:30:00','2025-08-16',1,1,1,1,2,1),
(0,0,'20:00:00','2025-08-17',2,1,3,3,4,NULL),
(1,3,'21:00:00','2025-08-23',1,2,2,2,5,5),
(2,2,'19:00:00','2025-08-24',2,2,4,4,6,NULL),
(3,0,'18:00:00','2025-08-30',1,3,5,5,7,5),
(1,0,'20:30:00','2025-08-31',2,3,6,6,8,6),
(0,2,'18:45:00','2025-09-06',1,4,7,7,9,9),
(2,1,'21:15:00','2025-09-07',2,4,8,8,10,8),
(0,1,'19:30:00','2025-09-13',1,5,9,9,1,1),
(1,1,'22:00:00','2025-09-14',2,5,10,10,2,NULL);


INSERT INTO partidos_arbitros (id_arbitros_partidos, id_arbitro, numero_partido, id_jornada) VALUES
(1,1,1,1),
(2,2,2,1),
(3,3,1,2),
(4,4,2,2),
(5,5,1,3),
(6,6,2,3),
(7,7,1,4),
(8,8,2,4),
(9,9,1,5),
(10,10,2,5);


INSERT INTO jugadas_partidos (id_estadistica, tarjetas_amarillas, tarjetas_rojas, id_posicion_jugada, asistencias, faltas, goles, dni_jugador, num_partido, id_jornada) VALUES
(1,1,0,10,0,2,1,'01234567K',1,1),
(2,0,0,9,1,1,0,'90123456J',1,1),
(3,1,0,8,0,3,0,'89012345H',2,1),
(4,0,0,7,1,0,0,'78901234G',2,1),
(5,0,0,6,0,1,0,'67890123F',1,2),
(6,1,0,5,0,2,0,'56789012E',1,2),
(7,0,0,4,0,1,0,'45678901D',2,2),
(8,0,0,3,0,0,1,'34567890C',2,2),
(9,1,0,2,0,2,0,'23456789B',1,3),
(10,0,0,1,0,0,0,'12345678A',1,3);


-- TRUNCATE

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE fichajes;

SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO fichajes (id_fichaje, fecha_fichaje, precio, salario, estado, dni_jugador) VALUES
(1,'2025-07-05',12000000.00,2500000.00,'cerrado','12345678A'),
(2,'2025-07-06',8000000.00,1800000.00,'cerrado','23456789B'),
(3,'2025-07-07',5000000.00,1200000.00,'cerrado','34567890C'),
(4,'2025-07-08',3000000.00,900000.00,'cerrado','45678901D'),
(5,'2025-07-09',1500000.00,700000.00,'cerrado','56789012E'),
(6,'2025-07-10',2000000.00,850000.00,'cerrado','67890123F'),
(7,'2025-07-11',4000000.00,1100000.00,'cerrado','78901234G'),
(8,'2025-07-12',2500000.00,950000.00,'cerrado','89012345H'),
(9,'2025-07-13',1000000.00,600000.00,'cerrado','90123456J'),
(10,'2025-07-14',2200000.00,800000.00,'cerrado','01234567K');

-- UPDATE 
UPDATE jornadas
SET estado = 'finalizada'
WHERE id_jornada = 4;

UPDATE estadios
SET capacidad = capacidad + 1000
WHERE id_estadio = 6;


-- DELETE 
DELETE FROM telefono_jugador
WHERE dni_jugador = '12345678A' AND telefono = '600000001';

DELETE FROM fichajes
WHERE id_fichaje = 10;





