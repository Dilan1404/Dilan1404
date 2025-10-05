> [6. Diseño Físico](6.md)

# 6. Diseño Físico

## Índice
- [6.1. Módulo / Integrante 1](6.1/6.1.md)
- [6.2. Módulo / Integrante 2](6.2/6.2.md)
- [6.3. Módulo / Integrante 3](6.3/6.3.md)
- [6.4. Módulo / Integrante 4](6.4/6.4.md)
- [6.5. Módulo / Integrante 5](6.5/6.5.md)
- [6.6. Diseño Consolidado](6.6/6.6.md)

## Instrucciones

Deben realizar lo siguiente para cada módulo (integrante) y documentar el diseño consolidado en la última sección de este capítulo. Para cada una de ellas debemos:

- **Seleccionar tablas para análisis físico:**
  - Escoger al menos dos tablas por módulo.
  - Justificar la elección (por volumen de datos, criticidad o relevancia en el proceso).
  - No deben seleccionar catálogos o tablas que no tendrán un movimiento significativo a lo largo de la vida de su sistema. Demos preferencia a tablas que representan transacciones.

- **Estimación de cantidad de registros:**
  - Estimar el número de registros esperados en cada tabla seleccionada.
  - Proyectar el crecimiento de registros para los próximos tres años.
  - Elaborar un cuadro que muestre los valores esperados de cantidad de registros por año.
  - Fundamentar la estimación con datos reales (cuando sea posible) o supuestos explícitos.
    - Datos reales: Si tenemos información del volumen real de ventas podemos obtener cantidad de registros, y con las proyecciones de la organización para los próximos años podría calcular el crecimiento.
    - Supuestos: Aproximamos el universo de clientes a 100,000 en la actualidad y asumimos un crecimiento de 7% para el primer año y de 8% para el segundo.

- **Parámetros físicos por tabla:**
    - Varios de estos cálculos dependerán de la cantidad de registros, por lo que deben considerar la información de la sección anterior.
    - Muestre el detalle de los cálculos.
    - Considere los siguientes parámetros físicos.
        - Tamaño de bloque.
        - Tamaño de extent.
        - Estructura del registro (campos que lo componen).
        - Tamaño del registro lógico (en bytes).
        - Espacio libre reservado (para actualizaciones).
        - Tamaño total estimado considerando la proyección de registros.

## Qué incluir en esta sección

- Tablas seleccionadas, estimación de registros y parámetros físicos documentados por cada módulo / integrante en su sección correspondiente.
- Consolidado de parámetros físicos y estimaciones de las tablas seleccionadas en la última sección del capítulo.  
---
