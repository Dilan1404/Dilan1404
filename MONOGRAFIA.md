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







