#  **13.2 Desarrollo Conceptual de ClickHouse en el Diseño de Bases de Datos**

## **Introducción**

En el ámbito del diseño de bases de datos modernas, además de los modelos relacionales y documentales, surge una categoría especializada para **procesamiento analítico de alto rendimiento**: las bases de datos **columnar o columnares**.

Entre estas, **ClickHouse** se destaca como una de las tecnologías más potentes para análisis en tiempo real, ejecución de consultas pesadas y procesamiento de grandes volúmenes de datos con latencias extremadamente bajas.

---

## **¿Qué es ClickHouse?**

**ClickHouse** es un sistema de gestión de bases de datos columnar, orientado a análisis (OLAP), diseñado por Yandex.

Su principal fortaleza es la velocidad: puede procesar **miles de millones de filas por segundo**, gracias a su arquitectura optimizada para almacenar y procesar datos en columnas en lugar de filas.

A diferencia de PostgreSQL o MySQL, que son bases de datos OLTP tradicionales, ClickHouse está diseñada para:

* **Analítica avanzada**
* **Consultas agregadas complejas**
* **Métricas y dashboards en tiempo real**
* **Grandes volúmenes de datos (Big Data)**

---

## **Contextualización en el Diseño de Bases de Datos**

### Comparación con Modelos Tradicionales

| Característica               | Relacional (SQL) – PostgreSQL   | Columnar (ClickHouse)                     |
| ---------------------------- | ------------------------------- | ----------------------------------------- |
| Modelo                       | Filas (row-based)               | Columnas (column-based)                   |
| Escenario ideal              | Transacciones, CRUD, integridad | Analítica, agregaciones, big data         |
| Esquema                      | Normalizado                     | Desnormalizado                            |
| Velocidad en SELECTs pesados | Media                           | Altísima                                  |
| Velocidad en INSERT/UPDATE   | Alta                            | Alta en batch, menor en unidades pequeñas |
| Compresión                   | Estándar                        | Muy alta                                  |
| Tipo de sistema              | OLTP                            | OLAP                                      |

ClickHouse está diseñado para **consultar, resumir y analizar datos**, no para usarse como backend transaccional de un sistema CRUD.

---

# **ClickHouse aplicado al caso: Tabla Evaluación**

Tu tabla **Evaluación** contiene:

* Valores numéricos pequeños (1–5)
* Muchos candidatos evaluados
* Campos NULL para quienes aún no tienen evaluación
* Un texto de observación
* Una relación a Postulación

Esta tabla, en un contexto real, suele ser usada para:

* **Análisis estadístico**
* Tendencias del desempeño
* Identificación de perfiles altos / bajos
* Dashboards internos de RRHH


---

## **Cómo se vería Evaluación en ClickHouse**

### Modelo normalizado vs. desnormalizado

ClickHouse **NO maneja claves foráneas**, así que normalmente se desnormalizaría la tabla.

### Posible estructura equivalente en ClickHouse

```sql
CREATE TABLE Evaluacion_CH (
    ID_Evaluacion String,
    Hard_skills UInt8,
    Soft_skills UInt8,
    Experiencia UInt8,
    Etica_integridad UInt8,
    Evaluacion_economica UInt8,
    Observaciones String,
    Cod_Postulacion String
)
ENGINE = MergeTree()
ORDER BY ID_Evaluacion;
```

### Notas:

* En lugar de `numeric(1)` → se usa `UInt8` (1 byte, suficiente para valores 1–5).
* Los `NULL` deben manejarse como **Nullable(UInt8)** si quieres conservarlos.
* La clave primaria lógica debe colocarse en `ORDER BY`.

---

## **Características clave de ClickHouse aplicadas a Evaluación**

---

### **1. Procesamiento ultrarrápido para analítica**

Consultas como:

* promedios de habilidades
* distribución de evaluaciones
* ranking de candidatos
* comparación entre postulaciones

Se ejecutan hasta **100 veces más rápido que en PostgreSQL**.



Aquí tienes **la misma estructura** que me pediste, pero **totalmente adaptada a ClickHouse**, sin mencionar Couchbase, y orientada a tu proyecto donde estás usando tablas como `evaluacion` y consultas desde una API.

---

# **13.3 Configuración**

## **1. Instalación del Sistema de Base de Datos Columnar (ClickHouse)**

Para nuestro sistema de análisis de evaluaciones y métricas, utilizaremos **ClickHouse**, una base de datos columnar de alto rendimiento. Este motor será clave para almacenar:

* Evaluaciones de desempeño.
* Métricas de proyectos.
* Datos consolidados para análisis masivo.
* Registros históricos para reportes.

---

## **1.1. Instalación de ClickHouse**

Sigue la guía oficial de ClickHouse según tu sistema operativo:

📄 **Guía oficial de instalación**
[https://clickhouse.com/docs/en/install](https://clickhouse.com/docs/en/install)

### Instalación rápida en Windows (WSL o Docker recomendado)

**Usando Docker:**

```bash
docker run -d --name clickhouse-server -p 8123:8123 -p 9000:9000 clickhouse/clickhouse-server
```

---

## **1.2. Inicio del servicio ClickHouse**
## Pantalla de entrada de ClickHouse
[img1](st1.png)

---
## Pantalla de Inicio de ClickHouse
[img2](st2.png)

## Creacion de Tablas en ClickHouse
[img3](st3.png)

## Coneccion si se quiere trabajar en un proyecto con Python
[img4](st4.png)

Verificar estado:

```bash
sudo service clickhouse-server status
```

O si usas Docker:

```bash
docker ps
```

---

## **1.3. Acceso a ClickHouse Client**

Puedes conectarte vía CLI:

```bash
clickhouse-client
```

O usar el cliente HTTP:

```
http://localhost:8123
```

Desde aquí podrás ejecutar consultas SQL directamente en ClickHouse.

---

# **2. Integración con el Backend en Python / Django / FastAPI**

### 2.1. Instalación de dependencias

```bash
pip install clickhouse-connect
```

Esta librería permite conectarse a ClickHouse desde tu API.

---

## **2.2. Configuración en backend (ejemplo en Python)**

```python
from clickhouse_connect import get_client

client = get_client(
    host='localhost',
    port=8123,
    username='default',
    password=''
)
```

---

## **2.3. Ejecutar consultas desde el backend**

Ejemplo de consulta a tu tabla `evaluacion`:

```python
rows = client.query("""
    SELECT *
    FROM proyecto7.evaluacion
    ORDER BY Experiencia DESC
    LIMIT 10
""").result_rows

print(rows)
```

---

# **3. Ejecución de Scripts SQL del Proyecto**

Tus scripts deben ejecutarse con `clickhouse-client`.

---

## **3.1 Crear la Base de Datos**

```bash
clickhouse-client --query="CREATE DATABASE proyecto7"
```

O ejecutando tu archivo:

```bash
clickhouse-client < 01_create_db.sql
```

---

## **3.2 Crear la Tabla de Evaluaciones**

```bash
clickhouse-client < 02_create_table_evaluacion.sql
```

---

## **3.3 Insertar Datos de Prueba**

```bash
clickhouse-client < 03_insert_evaluacion.sql
```

Después de esto la tabla está lista para consultas.

---

# **4. Verificación de la Conexión Backend – ClickHouse**

Ejemplo de inserción:

```python
client.command("""
INSERT INTO proyecto7.evaluacion (Nombre, Experiencia, Puntaje, Proyecto)
VALUES ('Luis Pérez', 5, 87, 'Sistema WMS')
""")
```

Ejemplo de lectura:

```python
rows = client.query("""
SELECT Nombre, Puntaje
FROM proyecto7.evaluacion
WHERE Puntaje > 80
""").result_rows

print(rows)
```

Si ves los resultados en tu consola, la conexión está funcionando.

---

# **5. Extensiones Recomendadas**

Puedes ampliar tu BD con más tablas:

| Módulo                | Tabla sugerida     | Contenido típicamente almacenado                |
| --------------------- | ------------------ | ----------------------------------------------- |
| Evaluaciones          | `evaluacion`       | Evaluaciones de personal, puntajes, experiencia |
| Proyectos             | `proyectos`        | Lista de proyectos, responsables, fechas        |
| Métricas de desempeño | `metricas`         | KPIs, tiempos, indicadores                      |
| Logs de operaciones   | `logs_operaciones` | Actividades, solicitudes, auditoría             |

---

Si quieres también te genero los scripts SQL para crear esas tablas.






