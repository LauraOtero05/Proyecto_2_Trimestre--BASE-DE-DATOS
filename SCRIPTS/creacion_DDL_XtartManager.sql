-- CREACION BASE DE DATOS

CREATE DATABASE  xtart_manager CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE  xtart_manager;


-- CREACION TABLAS

CREATE TABLE codigopostal_ciudad (
  codigo_postal INT NOT NULL PRIMARY KEY,
  ciudad VARCHAR(80) NOT NULL
);


CREATE TABLE ligas (
  id_liga          INT AUTO_INCREMENT PRIMARY KEY,
  nombre           VARCHAR(120) NOT NULL,
  temporada        VARCHAR(20)  NOT NULL,
  numero_equipos   INT NOT NULL,
  fecha_inicio     DATE NOT NULL,
  fecha_final      DATE NOT NULL
);

CREATE TABLE jornadas (
  id_jornada        INT AUTO_INCREMENT PRIMARY KEY,
  fecha_inicio      DATE NOT NULL,
  fecha_final       DATE NOT NULL,
  numero_jornada    INT NOT NULL,
  estado            ENUM('pendiente','iniciada','finalizada') NOT NULL DEFAULT 'pendiente',
  id_liga           INT NOT NULL
);



CREATE TABLE estadios (
  id_estadio       INT AUTO_INCREMENT PRIMARY KEY,
  nombre           VARCHAR(120) NOT NULL,
  capacidad        INT NOT NULL,
  direccion        VARCHAR(200) NOT NULL,
  ciudad           VARCHAR(80) NOT NULL,
  codigo_postal    INT NOT NULL,
  anio_inauguracion YEAR NOT NULL,
 tipo_cesped ENUM('natural','artificial') NOT NULL
);



CREATE TABLE equipos (
  id_equipos     INT AUTO_INCREMENT PRIMARY KEY,
  nombre         VARCHAR(120) NOT NULL,
  ciudad         VARCHAR(80) NOT NULL,
  codigo_postal  INT NOT NULL,
  anio_fundacion YEAR NULL,
  id_estadio     INT NOT NULL
);


CREATE TABLE entrenadores (
  id_entrenador      INT AUTO_INCREMENT PRIMARY KEY,
  nombre             VARCHAR(80) NOT NULL,
  apellidos          VARCHAR(120) NOT NULL,
  fecha_nacimiento   DATE NOT NULL,
  anios_experiencia  INT NOT NULL
);

CREATE TABLE entrenadores_equipos (
  id_equipo      INT NOT NULL,
  id_entrenador  INT NOT NULL,
  temporada      VARCHAR(20) NOT NULL,
  fecha_inicio   DATE NOT NULL,
  fecha_fin      DATE NULL,
  PRIMARY KEY (id_equipo, id_entrenador)
);



CREATE TABLE arbitros (
  id_arbitro       INT AUTO_INCREMENT PRIMARY KEY,
  nombre           VARCHAR(80) NOT NULL,
  tipo             VARCHAR(40) NOT NULL,
  nacionalidad     VARCHAR(60) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  supervisa        INT NULL
);

CREATE TABLE partidos (
  goles_locales     INT NOT NULL DEFAULT 0,
  goles_visitantes  INT NOT NULL DEFAULT 0,
  hora              TIME NOT NULL,
  fecha             DATE NOT NULL,
  numero_partido    INT NOT NULL,
  id_jornada        INT NOT NULL,
  id_estadio        INT NOT NULL,
  id_equipo_local   INT NOT NULL,
  id_equipo_visitante INT NOT NULL,
  id_equipo_ganador INT NULL,

  PRIMARY KEY (numero_partido, id_jornada)
);

CREATE TABLE partidos_arbitros (
  id_arbitros_partidos INT AUTO_INCREMENT PRIMARY KEY,
  id_arbitro           INT NOT NULL,
  numero_partido       INT NOT NULL,
  id_jornada           INT NOT NULL
);

CREATE TABLE posiciones (
  id_posicion_jugada INT AUTO_INCREMENT PRIMARY KEY,
  posicion_jugada    VARCHAR(60) NOT NULL
);

CREATE TABLE jugadores (
  dni              CHAR(9) PRIMARY KEY,
  fecha_nacimiento DATE NOT NULL,
  dorsal           INT NOT NULL,
  nombre           VARCHAR(80) NOT NULL,
  apellidos        VARCHAR(120) NOT NULL,
  altura           DECIMAL(4,2) NULL,
  id_posicion_jugada INT NOT NULL,
  id_equipo        INT NOT NULL
);


CREATE TABLE telefono_jugador (
  dni_jugador CHAR(9) NOT NULL,
  telefono    VARCHAR(20) NOT NULL,
  PRIMARY KEY (dni_jugador, telefono)
) ;


CREATE TABLE tienda_fichajes (
  id_fichaje    INT AUTO_INCREMENT PRIMARY KEY,
  fecha_fichaje DATE NOT NULL,
  precio        DECIMAL(12,2) NULL,
  salario       DECIMAL(12,2) NULL,
  estado        VARCHAR(30) NOT NULL,
  dni_jugador CHAR(9) NOT NULL
);


CREATE TABLE jugadas_partidos (
  id_estadistica     INT AUTO_INCREMENT PRIMARY KEY,
  tarjetas_amarillas INT NOT NULL DEFAULT 0,
  tarjetas_rojas     INT NOT NULL DEFAULT 0,
  id_posicion_jugada INT NOT NULL,
  asistencias        INT NOT NULL DEFAULT 0,
  faltas             INT NOT NULL DEFAULT 0,
  goles              INT NOT NULL DEFAULT 0,
  dni_jugador        CHAR(9) NOT NULL,
  num_partido        INT NOT NULL,
  id_jornada         INT NOT NULL
);

-- ALTER FOREIGNS KEYS

-- (1) jornadas -> ligas
ALTER TABLE jornadas
  ADD CONSTRAINT fk_jornadas_ligas
  FOREIGN KEY (id_liga) REFERENCES ligas(id_liga)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (2) estadios -> codigopostal_ciudad
ALTER TABLE estadios
  ADD CONSTRAINT fk_estadios_cp
  FOREIGN KEY (codigo_postal) REFERENCES codigopostal_ciudad(codigo_postal)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (3) equipos -> codigopostal_ciudad
ALTER TABLE equipos
  ADD CONSTRAINT fk_equipos_cp
  FOREIGN KEY (codigo_postal) REFERENCES codigopostal_ciudad(codigo_postal)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (4) equipos -> estadios
ALTER TABLE equipos
  ADD CONSTRAINT fk_equipos_estadios
  FOREIGN KEY (id_estadio) REFERENCES estadios(id_estadio)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (5) entrenadores_equipos -> equipos
ALTER TABLE entrenadores_equipos
  ADD CONSTRAINT fk_entren_equip_equipo
  FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipos)
  ON UPDATE CASCADE ON DELETE CASCADE;

-- (6) entrenadores_equipos -> entrenadores
ALTER TABLE entrenadores_equipos
  ADD CONSTRAINT fk_entren_equip_entrenador
  FOREIGN KEY (id_entrenador) REFERENCES entrenadores(id_entrenador)
  ON UPDATE CASCADE ON DELETE CASCADE;

-- (7) arbitros supervisa -> arbitros (autorelación)
ALTER TABLE arbitros
  ADD CONSTRAINT fk_arbitros_supervisa
  FOREIGN KEY (supervisa) REFERENCES arbitros(id_arbitro)
  ON UPDATE CASCADE ON DELETE SET NULL;

-- (8) partidos -> jornadas
ALTER TABLE partidos
  ADD CONSTRAINT fk_partidos_jornadas
  FOREIGN KEY (id_jornada) REFERENCES jornadas(id_jornada)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (9) partidos -> estadios
ALTER TABLE partidos
  ADD CONSTRAINT fk_partidos_estadios
  FOREIGN KEY (id_estadio) REFERENCES estadios(id_estadio)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (10) partidos -> equipo_local
ALTER TABLE partidos
  ADD CONSTRAINT fk_partidos_equipo_local
  FOREIGN KEY (id_equipo_local) REFERENCES equipos(id_equipos)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (11) partidos -> equipo_visitante
ALTER TABLE partidos
  ADD CONSTRAINT fk_partidos_equipo_visitante
  FOREIGN KEY (id_equipo_visitante) REFERENCES equipos(id_equipos)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (12) partidos -> equipo_ganador (nullable)
ALTER TABLE partidos
  ADD CONSTRAINT fk_partidos_equipo_ganador
  FOREIGN KEY (id_equipo_ganador) REFERENCES equipos(id_equipos)
  ON UPDATE CASCADE ON DELETE SET NULL;

-- (13) partidos_arbitros -> arbitros
ALTER TABLE partidos_arbitros
  ADD CONSTRAINT fk_partidos_arbitros_arbitro
  FOREIGN KEY (id_arbitro) REFERENCES arbitros(id_arbitro)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (14) partidos_arbitros -> partidos (PK compuesta)
ALTER TABLE partidos_arbitros
  ADD CONSTRAINT fk_partidos_arbitros_partidos
  FOREIGN KEY (numero_partido, id_jornada) REFERENCES partidos(numero_partido, id_jornada)
  ON UPDATE CASCADE ON DELETE CASCADE;

-- (15) jugadores -> equipos
ALTER TABLE jugadores
  ADD CONSTRAINT fk_jugadores_equipos
  FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipos)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (16) jugadores -> posiciones
ALTER TABLE jugadores
  ADD CONSTRAINT fk_jugadores_posiciones
  FOREIGN KEY (id_posicion_jugada) REFERENCES posiciones(id_posicion_jugada)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (17) telefono_jugador -> jugadores
ALTER TABLE telefono_jugador
  ADD CONSTRAINT fk_telefono_jugador
  FOREIGN KEY (dni_jugador) REFERENCES jugadores(dni)
  ON UPDATE CASCADE ON DELETE CASCADE;

-- (18) tienda_fichajes -> jugadores
ALTER TABLE tienda_fichajes
  ADD CONSTRAINT fk_fichajes_jugador
  FOREIGN KEY (dni_jugador) REFERENCES jugadores(dni)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (19) jugadas_partidos -> posiciones
ALTER TABLE jugadas_partidos
  ADD CONSTRAINT fk_jugadas_posicion
  FOREIGN KEY (id_posicion_jugada) REFERENCES posiciones(id_posicion_jugada)
  ON UPDATE CASCADE ON DELETE RESTRICT;

-- (20) jugadas_partidos -> jugadores
ALTER TABLE jugadas_partidos
  ADD CONSTRAINT fk_jugadas_jugador
  FOREIGN KEY (dni_jugador) REFERENCES jugadores(dni)
  ON UPDATE CASCADE ON DELETE CASCADE;

-- (21) jugadas_partidos -> partidos (PK compuesta)
ALTER TABLE jugadas_partidos
  ADD CONSTRAINT fk_jugadas_partido
  FOREIGN KEY (num_partido, id_jornada) REFERENCES partidos(numero_partido, id_jornada)
  ON UPDATE CASCADE ON DELETE CASCADE;

-- ALTER (22): asegurar dorsales no negativos 
ALTER TABLE jugadores
  ADD CONSTRAINT chk_dorsal_positivo CHECK (dorsal > 0);




-- 4) RENAME 
RENAME TABLE tienda_fichajes TO fichajes;


-- 4) DROP borrar la tabla y despues crearla de nuevo
DROP TABLE telefono_jugador;

 SHOW TABLES;
 
CREATE TABLE telefono_jugador (
  dni_jugador CHAR(9) NOT NULL,
  telefono    VARCHAR(20) NOT NULL,
  PRIMARY KEY (dni_jugador, telefono)
) ;

ALTER TABLE telefono_jugador
  ADD CONSTRAINT fk_telefono_jugador
  FOREIGN KEY (dni_jugador) REFERENCES jugadores(dni)
  ON UPDATE CASCADE ON DELETE CASCADE;


 SHOW TABLES;