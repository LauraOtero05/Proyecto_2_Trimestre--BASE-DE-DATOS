# Base de Datos - Xtart Manager

## Descripción
Este repositorio contiene la base de datos del proyecto académico **Xtart Manager**, un gestor de **ligas de fútbol**. La base de datos está compuesta por 15 tablas:

- `ligas`
- `jornadas`
- `estadios`
- `equipos`
- `entrenadores`
- `arbitros`
- `partidos`
- `jugadores`
- `tienda_fichajes`
- `jugadas_partidos`
- `entrenadores_equipos`
- `partidos_arbitros`
- `posiciones`
- `codigopostal_ciudad`
- `telefono_jugador`

La **base de datos** ha sido diseñada siguiendo un proceso completo de modelado:

1. Modelo Entidad-Relación
2. Modelo Lógico
3. Normalización
4. Modelo Físico
5. Implementación en MySQL

## Estructura del repositorio
El proyecto está organizado en las siguientes carpetas:

```bash
    xtart_manager/
    │
    ├── MODELOS DRAW IO/
    │   ├── MODELO Xtart Manager.drawio
    │   ├── MODELO LOGICO Xtart Manager.drawio
    │   └── NORMALIZACION Xtart Manager.drawio
    │
    ├── MODELO FISICO/
    │   ├── modelo fisico.dbs
    │   └── modelo fisico.dbs.bak
    │
    ├── SCRIPTS/
    │   ├── creacion_DDL_XtartManager.sql
    │   ├── datos_creacion_DML_XtartManager.sql
    │   └── errores_DDL.sql
    │
    └── README.md
```

- **MODELOS DRAW IO** → Contiene los diagramas realizados con Draw.io (modelo ER, lógico y normalización).

- **MODELO FISICO** → Contiene el diagrama del modelo físico realizado con DBSchema.

- **SCRIPTS** → Scripts SQL:

    - **DDL** (creación de base de datos y tablas)

    - **DML** (inserción de datos)

    - **Script** corrigiendo errores para el uso de todas las palabras reservadas de los anteriores sublenguajes de SQL (DDL y DML). 


## Tecnologías utilizadas

- **MySQL**: Sistema de gestión de bases de datos relacional utilizado para la implementación del modelo físico.  
- **SQL (DDL y DML)**: 
    - **DDL (Data Definition Language)** para la creación de la base de datos, tablas, claves primarias, claves foráneas y restricciones.
    - **DML (Data Manipulation Language)** para la inserción de datos iniciales.
- **Draw.io**: Herramienta utilizada para el diseño del modelo entidad-relación, modelo lógico y proceso de normalización. 
- **DBSchema**: Utilizado para generar y visualizar el modelo físico de la base de datos. normalización. 
- **Git y GitHub**: Control de versiones y gestión del repositorio.

## Requisitos del proyecto

- **MySQL Server** instalado.  
- **Cliente de MySQL** o herramienta como: 
    - MySQL Workbench.
    - DBeaver
- **Acceso a Git** para clonar el repositorio.  
- **Sistema operativo compatible**: Windows, macOS o Linux.  

## Despliegue de la base de datos

Para implementar la base de datos **Xtart Manager** en MySQL, seguir los siguientes pasos:

1. **Clonar el repositorio:**

```bash
    git clone https://github.com/LauraOtero05/Proyecto_2_Trimestre--BASE-DE-DATOS.git
```
2. **Acceder a la carpeta del proyecto:**
```bash
    cd Proyecto_2_Trimestre--BASE-DE-DATOS
```
3. **Abrir el cliente de MySQL:**

Conectarse al servidor MySQL desde:
- MySQL Workbench
- DBeaver
- Consola MySQL

## Ejecución en MySQL / DBeaver

1. **Asegurar que MySQL esté en ejecución**

Verificar que el servidor MySQL esté activo antes de comenzar.

2. **Crear conexión en DBeaver (opcional)**

    1. Abrir DBeaver
    2. Crear nueva conexión → MySQL
    3. Configurar: 
        - Host:  `localhost`
        - Puerto: `3306`
        - Usuario: `root` (o el usuario que corresponda)
        - Contraseña correspondiente

3. **Ejecutar scripts en el orden correcto**

El orden de ejecución es fundamental:
1. `Creacion_DDL_XtartManager.sql`
2. `Creacion_DML_XtartManager.sql`

4. **Verificación**

```bash
USE xtart_manager;
SHOW TABLES;
SELECT COUNT(*) FROM equipos;
```
Si los datos aparecen correctamente, la base de datos está lista.




## Autores

- Laura Otero Martín
- Noemí Cano Conesa
- Sergio Rodríguez López
