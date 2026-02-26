-- ERRORES FORZADOS DOCUMENTADOS 

 USE  xtart_manager;

 /* ------------------------------------------------------------
    ERROR FORZADO #1 (CREATE duplicado)
    Provoca: Table 'ligas' already exists*/
 

    CREATE TABLE ligas (id INT PRIMARY KEY);


 /* ------------------------------------------------------------
    ERROR FORZADO #2 (ALTER FK a tabla inexistente)
    Provoca: Failed to open the referenced table...
    Justifica que la tabla referenciada debe existir.
 ------------------------------------------------------------ */
  ALTER TABLE equipos
  ADD CONSTRAINT fk_equipos_tabla_inexistente
  FOREIGN KEY (id_estadio) REFERENCES estadio_inexistente(id_estadio);


 /* ------------------------------------------------------------
    ERROR FORZADO #3 (TRUNCATE sobre tabla referenciada por FK)
    Si hay FKs apuntando a 'equipos', TRUNCATE puede fallar.
 ------------------------------------------------------------ */
TRUNCATE TABLE equipos;
