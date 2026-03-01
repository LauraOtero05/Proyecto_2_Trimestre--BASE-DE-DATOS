README - Instalación BD XtartManager (MySQL 8.4 + DBeaver)

REQUISITOS

MySQL Server 8.4 instalado (servicio: mysql84)

DBeaver instalado

3 scripts SQL:

Creacion_DDL_XtartManager.sql -> crea la estructura (tablas, claves, relaciones)

Creacion_DML_XtartManager.sql -> inserta todos los datos

Errores_Controlados_XtartManager.sql -> errores provocados a propósito para demostración

ARRANCAR MYSQL 8.4
1.1. En Windows abrir "Servicios" (services.msc)
1.2. Buscar el servicio "mysql84"
1.3. Comprobar que está en "En ejecución". Si no, iniciarlo.
1.4. Tener a mano usuario y contraseña de MySQL (normalmente root y su contraseña).

CREAR CONEXIÓN EN DBEAVER
2.1. Abrir DBeaver
2.2. Database -> New Database Connection
2.3. Elegir MySQL
2.4. Configurar:

Host: localhost

Port: 3306

User: root (o el usuario que corresponda)

Password: (la contraseña de MySQL)
2.5. Pulsar "Test Connection" y si va bien, "Finish"

CREAR LA BASE DE DATOS

EJECUTAR SCRIPT DDL (ESTRUCTURA)
Objetivo: crear tablas, claves y relaciones.

4.1. Abrir el archivo: Creacion_DDL_XtartManager.sql
4.2. Asegurarse de que la conexión seleccionada es la correcta (MySQL)
4.3. Ejecutar el script completo (Execute SQL Script / Ctrl+Enter según configuración)
4.4. Comprobar que se han creado las tablas:
En el panel izquierdo -> Schemas -> XtartManager -> Tables

EJECUTAR SCRIPT DML (DATOS)
Objetivo: insertar todos los datos en las tablas.

5.1. Abrir el archivo: Creacion_DML_XtartManager.sql
5.2. Ejecutar el script completo contra la misma base de datos
5.3. Comprobar que hay datos:
- Click derecho en una tabla -> View Data
- o ejecutar: SELECT COUNT(*) FROM nombre_tabla;

EJECUTAR SCRIPT DE ERRORES CONTROLADOS (DEMO)
Objetivo: mostrar errores realizados a propósito para el profesor.

6.1. Abrir el archivo: Errores_Controlados_XtartManager.sql
6.2. Ejecutarlo al final (después del DDL y del DML)
6.3. Es normal que salgan errores en consola: son intencionados
6.4. Si se quiere ver cada error con claridad, ejecutar sentencia a sentencia.

ORDEN RECOMENDADO

Creacion_DDL_XtartManager.sql

Creacion_DML_XtartManager.sql

Errores_Controlados_XtartManager.sql

FIN