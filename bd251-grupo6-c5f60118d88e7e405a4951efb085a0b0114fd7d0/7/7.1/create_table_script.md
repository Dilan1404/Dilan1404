```sql

DROP TABLE IF EXISTS Realiza CASCADE;
DROP TABLE IF EXISTS Historial_Cambios_Area CASCADE;
DROP TABLE IF EXISTS Movimiento_inventario CASCADE;
DROP TABLE IF EXISTS Alerta_inventario CASCADE;
DROP TABLE IF EXISTS Procesos CASCADE;
DROP TABLE IF EXISTS Tipo_empaque CASCADE;	
DROP TABLE IF EXISTS Estado_packing CASCADE;
DROP TABLE IF EXISTS Incidencias CASCADE;
DROP TABLE IF EXISTS Reporte_trazabilidad CASCADE;
DROP TABLE IF EXISTS Mantenimiento_externo_detalle CASCADE;
DROP TABLE IF EXISTS Recepcion CASCADE;
DROP TABLE IF EXISTS Control_de_calidad CASCADE;
DROP TABLE IF EXISTS Reporte_producto_observado  CASCADE;
DROP TABLE IF EXISTS Reporte_Recepcion_estadisticas   CASCADE;
DROP TABLE IF EXISTS Reporte_equipos CASCADE;
DROP TABLE IF EXISTS Reporte_inventario CASCADE;
DROP TABLE IF EXISTS Programacion_Mantenimiento_externo CASCADE;
DROP TABLE IF EXISTS Planificacion_de_asignacion CASCADE;
DROP TABLE IF EXISTS Equipo CASCADE;
DROP TABLE IF EXISTS Area CASCADE;
DROP TABLE IF EXISTS Maquina_sustituta CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;
DROP TABLE IF EXISTS Reporte_Packing CASCADE;
DROP TABLE IF EXISTS Packing CASCADE;
DROP TABLE IF EXISTS Empaque CASCADE;
DROP TABLE IF EXISTS Stock CASCADE;
DROP TABLE IF EXISTS Ubicacion_en_Almacen CASCADE;
DROP TABLE IF EXISTS Lote CASCADE;
DROP TABLE IF EXISTS Ubicacion_Almacen CASCADE;
DROP TABLE IF EXISTS Producto CASCADE;
DROP TABLE IF EXISTS Pedido CASCADE;
DROP TABLE IF EXISTS Guia_de_Remision CASCADE;
DROP TABLE IF EXISTS Orden_Transporte CASCADE;
DROP TABLE IF EXISTS Guia_X_Orden_Transporte CASCADE;
DROP TABLE IF EXISTS Seguimiento CASCADE;
DROP TABLE IF EXISTS Informe_Entrega CASCADE;
DROP TABLE IF EXISTS Reporte_Incidentes_Entrega CASCADE;
DROP TABLE IF EXISTS Cliente CASCADE;
DROP TABLE IF EXISTS Informe_de_especificaciones CASCADE;
DROP TABLE IF EXISTS Vehiculo CASCADE;
DROP TABLE IF EXISTS Estado_Empleado CASCADE;
DROP TABLE IF EXISTS Tipo_Empleado CASCADE;
DROP TABLE IF EXISTS Tipo_Producto CASCADE;
DROP TABLE IF EXISTS Estado_Lote CASCADE;
DROP TABLE IF EXISTS Estado_Recepcion CASCADE;
DROP TABLE IF EXISTS Estado_Control_Calidad CASCADE;
DROP TABLE IF EXISTS Estado_paquete_Recepcion CASCADE;
DROP TABLE IF EXISTS Tipo_Periodo CASCADE;
DROP TABLE IF EXISTS Estado_Orden_Transporte CASCADE;
DROP TABLE IF EXISTS Estado_Seguimiento CASCADE;
DROP TABLE IF EXISTS Tipo_incidente_entrega CASCADE;
DROP TABLE IF EXISTS Estado_reporte_incidentes_transporte CASCADE;
DROP TABLE IF EXISTS Estado_Mantenimiento CASCADE;
DROP TABLE IF EXISTS Tipo_Maquina CASCADE;
DROP TABLE IF EXISTS Estado_Equipo CASCADE;
DROP TABLE IF EXISTS Tipo_Vehiculo CASCADE;
DROP TABLE IF EXISTS Tipo_Movimiento CASCADE;
DROP TABLE IF EXISTS Estado_Mantenimiento_Operacion CASCADE;


-- Look Up Tables
CREATE TABLE Estado_Empleado (
    ID_Estado_Empleado CHAR(4) PRIMARY KEY,
    Descripcion VARCHAR(50)
);

CREATE TABLE Tipo_Empleado (
    ID_Tipo_Empleado CHAR(4) PRIMARY KEY,
    Descripcion VARCHAR(40)
);

CREATE TABLE Tipo_Producto (
    ID_Tipo_Producto CHAR(2) PRIMARY KEY,
    Descripcion VARCHAR(50)
);
CREATE TABLE Tipo_empaque  (
   ID_Tipo_empaque CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(50)
);

CREATE TABLE Estado_packing (
    ID_Estado_packing CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(50)  
); 
CREATE TABLE Estado_Lote (
    ID_Estado_Lote CHAR(2) PRIMARY KEY,
    Descripcion VARCHAR(20)
);

CREATE TABLE Estado_Recepcion (
    ID_Estado_Recepcion CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(20)
);

CREATE TABLE Estado_Control_Calidad (
    ID_Estado_Control_Calidad CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(20)
);

CREATE TABLE Estado_paquete_Recepcion (
    ID_Estado_paquete_Recepcion CHAR(4) PRIMARY KEY,
    Descripcion VARCHAR(50)
);

CREATE TABLE Tipo_Periodo (
    ID_Tipo_Periodo CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(20)
);

CREATE TABLE Estado_Orden_Transporte (
    ID_Estado_orden CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(128)
);

CREATE TABLE Estado_Seguimiento (
    ID_Estado_seguimiento CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(128)
);

CREATE TABLE Tipo_incidente_entrega (
    ID_Tipo_incidente CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(128)
);

CREATE TABLE Estado_reporte_incidentes_transporte (
    ID_Estado_reporte CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(128)
);
CREATE TABLE Estado_Mantenimiento_Operacion (
    ID_Estado_Mantenimiento_Operacion CHAR(4) PRIMARY KEY,
    Descripcion VARCHAR(50)
);


CREATE TABLE Estado_Mantenimiento (
    ID_Estado_mantenimiento CHAR(8) PRIMARY KEY,
    Descripcion VARCHAR(50)
);

CREATE TABLE Tipo_Maquina (
    ID_Tipo_Maquina CHAR(5) PRIMARY KEY,
    Descripcion VARCHAR(50)
);

CREATE TABLE Estado_Equipo (
    ID_Estado_equipo CHAR(3) PRIMARY KEY,
    Descripcion VARCHAR(20)
);

CREATE TABLE Tipo_Vehiculo (
    ID_Tipo_Vehiculo CHAR(4) PRIMARY KEY,
    Descripcion VARCHAR(20)
);

CREATE TABLE Tipo_Movimiento (
    ID_Tipo_Movimiento CHAR(1) PRIMARY KEY,
    Descripcion VARCHAR(13)
);

-- Tablas principales		
CREATE TABLE Empleado (
    ID_Empleado CHAR(8) PRIMARY KEY,
    Nombre_Apellido VARCHAR(150),
    Fecha_Nacimiento DATE,
    Fecha_Contratacion DATE DEFAULT CURRENT_DATE,
    ID_Tipo_Empleado CHAR(4),
    ID_Estado_Empleado CHAR(4),
    Fecha_Despido DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (ID_Tipo_Empleado) REFERENCES Tipo_Empleado(ID_Tipo_Empleado),
    FOREIGN KEY (ID_Estado_Empleado) REFERENCES Estado_Empleado(ID_Estado_Empleado)
);

CREATE TABLE Maquina_sustituta (
    ID_Maquina_sustituta CHAR(8) PRIMARY KEY,
    Nombre_de_maquina VARCHAR(100),
    ID_Estado_equipo CHAR(3),
     ID_Tipo_Maquina CHAR(5),
    FOREIGN KEY (ID_Tipo_Maquina) REFERENCES Tipo_Maquina(ID_Tipo_Maquina),
    FOREIGN KEY (ID_Estado_equipo) REFERENCES Estado_Equipo(ID_Estado_equipo)
 
);

CREATE TABLE Area (
    ID_Area CHAR(3) PRIMARY KEY,
    Nombre_del_area VARCHAR(40)
);

CREATE TABLE Equipo (
    ID_Equipo CHAR(8) PRIMARY KEY,
    Nombre_equipo VARCHAR(40),
    ID_Estado_equipo CHAR(3),
    ID_Tipo_Maquina CHAR(5),
    Fecha_registro DATE DEFAULT CURRENT_DATE,
    Fecha_salida DATE DEFAULT CURRENT_DATE,
    Detalle VARCHAR(100),
    ID_Maquina_sustituta CHAR(8),
    Antiguedad_anos INT,
    ID_Empleado CHAR(8),
    FOREIGN KEY (ID_Maquina_sustituta) REFERENCES Maquina_sustituta(ID_Maquina_sustituta) ON DELETE SET NULL,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Estado_equipo) REFERENCES Estado_Equipo(ID_Estado_equipo),
    FOREIGN KEY (ID_Tipo_Maquina) REFERENCES Tipo_Maquina(ID_Tipo_Maquina)
);

CREATE TABLE Planificacion_de_asignacion (
    ID_Planificacion_asignacion CHAR(8) PRIMARY KEY,
    Fecha_registro TIMESTAMP DEFAULT NOW(),
    Fecha_de_asignacion DATE,
    Fecha_de_vencimiento DATE,
    Responsable_de_area VARCHAR(100),
    Descripcion_de_tarea VARCHAR(100),
    ID_Area CHAR(3),
    ID_Equipo CHAR(8),
    ID_Empleado_Registra CHAR(8),
    ID_Empleado_Solicita CHAR(8),
    FOREIGN KEY (ID_Area) REFERENCES Area(ID_Area),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo),
    FOREIGN KEY (ID_Empleado_Registra) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Empleado_Solicita) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Realiza (
    ID_Empleado CHAR(8),
    ID_Planificacion_asignacion CHAR(8),
    PRIMARY KEY (ID_Empleado, ID_Planificacion_asignacion),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Planificacion_asignacion) REFERENCES Planificacion_de_asignacion(ID_Planificacion_asignacion)
);

CREATE TABLE Historial_Cambios_Area (
    ID_Cambio CHAR(8) PRIMARY KEY,
    ID_Equipo CHAR(8),
    ID_Planificacion_asignacion CHAR(8),
    ID_Area_Anterior CHAR(3),
    ID_Area_Actual CHAR(3),
    Cambio_de_area BOOLEAN,
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo),
    FOREIGN KEY (ID_Planificacion_asignacion) REFERENCES Planificacion_de_asignacion(ID_Planificacion_asignacion),
    FOREIGN KEY (ID_Area_Anterior) REFERENCES Area(ID_Area),
    FOREIGN KEY (ID_Area_Actual) REFERENCES Area(ID_Area)
);

CREATE TABLE Programacion_Mantenimiento_externo (
    ID_Mantenimiento_externo CHAR(8) PRIMARY KEY,
    Tipo_de_mantenimiento VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT NOW(),
    Fecha_de_inicio DATE,
    Fecha_de_fin DATE,
    Empresa_encargada VARCHAR(100),
    ID_Equipo CHAR(8),
    ID_Estado_mantenimiento CHAR(8),
    ID_Empleado_Registra CHAR(8),
    ID_Empleado_Solicita CHAR(8),
    ID_Maquina_sustituta CHAR(8),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo),
    FOREIGN KEY (ID_Estado_mantenimiento) REFERENCES Estado_Mantenimiento(ID_Estado_mantenimiento),
    FOREIGN KEY (ID_Empleado_Registra) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Empleado_Solicita) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Maquina_sustituta) REFERENCES Maquina_sustituta(ID_Maquina_sustituta) ON DELETE SET NULL
);

CREATE TABLE Producto (
    ID_producto CHAR(8) PRIMARY KEY,
    Nombre_producto VARCHAR(100),
    ID_Tipo_Producto CHAR(2),
    Descripcion VARCHAR(120),
    FOREIGN KEY (ID_Tipo_Producto) REFERENCES Tipo_Producto(ID_Tipo_Producto)
);

CREATE TABLE Lote (
    ID_lote CHAR(8) PRIMARY KEY,
    Descripcion VARCHAR(120),
    Cantidad_total FLOAT,
    Unidad VARCHAR(20),
    fecha_vencimiento DATE,
    ID_Estado_Lote CHAR(2),
    Fecha_produccion DATE,
    ID_producto CHAR(8),
    FOREIGN KEY (ID_producto) REFERENCES Producto(ID_producto),
    FOREIGN KEY (ID_Estado_Lote) REFERENCES Estado_Lote(ID_Estado_Lote)
);

CREATE TABLE Ubicacion_Almacen (
    ID_Ubicacion_Almacen CHAR(8) PRIMARY KEY,
    Tipo_area VARCHAR(50),
    Peso_maximo FLOAT,
    Volumen_maximo FLOAT,
    ID_Lote CHAR(8),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID_lote)
);

CREATE TABLE Stock (
    ID_Stock CHAR(8) PRIMARY KEY,
    Cantidad_disponible INT,
    Stock_minimo INT,
    Stock_maximo INT,
    ID_producto CHAR(8),
    FOREIGN KEY (ID_producto) REFERENCES Producto(ID_producto)
);


CREATE TABLE Reporte_inventario (
    ID_Reporte_inventario CHAR(8) PRIMARY KEY,
    Fecha_inventario DATE,
    ID_Planificacion_asignacion CHAR(8),
    ID_Mantenimiento_externo CHAR(8),
    FOREIGN KEY (ID_Planificacion_asignacion) REFERENCES Planificacion_de_asignacion(ID_Planificacion_asignacion),
    FOREIGN KEY (ID_Mantenimiento_externo) REFERENCES Programacion_Mantenimiento_externo(ID_Mantenimiento_externo)
);

CREATE TABLE Reporte_equipos (
    ID_Reporte_equipos CHAR(8) PRIMARY KEY,
    ID_Equipo CHAR(8),
    ID_Planificacion_asignacion CHAR(8),
    ID_Mantenimiento_externo CHAR(8),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo),
    FOREIGN KEY (ID_Planificacion_asignacion) REFERENCES Planificacion_de_asignacion(ID_Planificacion_asignacion),
    FOREIGN KEY (ID_Mantenimiento_externo) REFERENCES Programacion_Mantenimiento_externo(ID_Mantenimiento_externo)
);

CREATE TABLE Mantenimiento_externo_detalle (
    ID_Mantenimiento_externo_detalle CHAR(8) PRIMARY KEY,
    Detalle_mantenimiento_realizado VARCHAR(255),
   ID_Estado_Mantenimiento_Operacion CHAR(4),
    ID_Mantenimiento_externo CHAR(8),
    FOREIGN KEY (ID_Estado_Mantenimiento_Operacion) REFERENCES Estado_Mantenimiento_Operacion(ID_Estado_Mantenimiento_Operacion)
);

CREATE TABLE Recepcion (
    ID_recepcion CHAR(8) PRIMARY KEY,
    Fecha_registro DATE,
    Cantidad_recibida FLOAT,
    ID_Estado_Recepcion CHAR(1),
    ID_lote CHAR(8),
    FOREIGN KEY (ID_lote) REFERENCES Lote(ID_lote),
    FOREIGN KEY (ID_Estado_Recepcion) REFERENCES Estado_Recepcion(ID_Estado_Recepcion)
);

CREATE TABLE Control_de_calidad (
    ID_Control_de_calidad CHAR(8) PRIMARY KEY,
    Fecha_inspeccion DATE,
    ID_Estado_paquete_Recepcion CHAR(4),
    Temperatura_producto FLOAT,
    Observaciones_lote VARCHAR(120),
    Observaciones_empaque VARCHAR(120),
    ID_Estado_Control_Calidad CHAR(1),
    ID_Recepcion CHAR(8),
    ID_empleado CHAR(8),
    FOREIGN KEY (ID_Recepcion) REFERENCES Recepcion(ID_recepcion),
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID_empleado),
    FOREIGN KEY (ID_Estado_paquete_Recepcion) REFERENCES Estado_paquete_Recepcion(ID_Estado_paquete_Recepcion),
    FOREIGN KEY (ID_Estado_Control_Calidad) REFERENCES Estado_Control_Calidad(ID_Estado_Control_Calidad)
);

CREATE TABLE Reporte_producto_observado (
    ID_Reporte_producto_observado CHAR(8) PRIMARY KEY,
    Fecha_registro DATE,
    Especificacion_no_cumplida VARCHAR(120),
    Acciones_a_tomar VARCHAR(120),
    ID_Control_de_calidad CHAR(8),
    FOREIGN KEY (ID_Control_de_calidad) REFERENCES Control_de_calidad(ID_Control_de_calidad) ON DELETE SET NULL
);

CREATE TABLE Reporte_Recepcion_estadisticas (
    ID_Reporte_Recepcion_estadisticas CHAR(8) PRIMARY KEY,
    Fecha_emision DATE,
    Total_unidades_recibidas FLOAT,
    ID_Tipo_Periodo CHAR(1),
    ID_recepcion CHAR(8),
    FOREIGN KEY (ID_recepcion) REFERENCES Recepcion(ID_recepcion),
    FOREIGN KEY (ID_Tipo_Periodo) REFERENCES Tipo_Periodo(ID_Tipo_Periodo)
);


CREATE TABLE Movimiento_inventario (
    ID_Movimiento_Inventario CHAR(8) PRIMARY KEY,
    ID_Tipo_Movimiento CHAR(1),
    Motivo VARCHAR(500),
    Cantidad INT,
    Fecha_movimiento TIMESTAMP,
    ID_Lote CHAR(8),
    ID_Reporte_inventario CHAR(8),
    ID_Empleado CHAR(8),
    FOREIGN KEY (ID_Tipo_Movimiento) REFERENCES Tipo_Movimiento(ID_Tipo_Movimiento),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID_lote),
    FOREIGN KEY (ID_Reporte_inventario) REFERENCES Reporte_inventario(ID_Reporte_inventario),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Alerta_inventario (
    ID_Alerta_inventario CHAR(8) PRIMARY KEY,
    Estado_alerta VARCHAR(50),
    Tipo_Alerta VARCHAR(50),
    Fecha_hora_alerta TIMESTAMP,
    ID_Lote CHAR(8),
    ID_Reporte_inventario CHAR(8),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID_lote),
    FOREIGN KEY (ID_Reporte_inventario) REFERENCES Reporte_inventario(ID_Reporte_inventario)
);



-- Transporte
CREATE TABLE Vehiculo (
    ID_Vehiculo CHAR(8) PRIMARY KEY,
    Tipo_vehiculo VARCHAR(50),
    Placa_vehiculo VARCHAR(10),
    Estado_vehiculo VARCHAR(20),
    Marca VARCHAR(50),
    Modelo VARCHAR(50)
);

CREATE TABLE Informe_de_especificaciones (
    ID_informe_de_especificaciones CHAR(8) PRIMARY KEY,
    Longitud_contenedor FLOAT,
    Ancho_contenedor FLOAT,
    Altura_contenedor FLOAT,
    Temperatura_contenedor CHAR(8)
);

CREATE TABLE Cliente (
    ID_Cliente CHAR(8) PRIMARY KEY,
    Nombre_cliente VARCHAR(100),
    Direccion_cliente VARCHAR(150),
    Telefono_cliente VARCHAR(20),
    Correo_cliente VARCHAR(100)
);


CREATE TABLE Pedido (
    ID_Pedido CHAR(8) PRIMARY KEY,
    Direccion_pedido VARCHAR(200),
    Fecha_limite DATE,
    Destino VARCHAR(100),
    ID_Cliente CHAR(8),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Guia_de_Remision (
    ID_Guia_Remision CHAR(8) PRIMARY KEY,
    fecha_emision DATE,
    fecha_de_traslado DATE,
    ID_Vehiculo CHAR(8),
    ID_Informe_de_especificaciones CHAR(8),
    ID_Transportista CHAR(8),
    ID_Pedido CHAR(8),
    ID_Empleado CHAR(8),
    FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo),
    FOREIGN KEY (ID_Informe_de_especificaciones) REFERENCES Informe_de_especificaciones(ID_informe_de_especificaciones),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Transportista) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Orden_Transporte (
    ID_Orden_transporte CHAR(8) PRIMARY KEY,
    ID_Empleado CHAR(8),
    Fecha_registro DATE NOT NULL,
    Fecha_finalizado DATE,
    Ubicacion_salida VARCHAR(128),
    ID_Estado_orden CHAR(1),
    Fecha_salida DATE,
    Hora_salida TIME,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Estado_orden) REFERENCES Estado_Orden_Transporte(ID_Estado_orden)
);

CREATE TABLE Guia_X_Orden_Transporte (
     ID_Guia_X_Orden CHAR(16) PRIMARY KEY,
     ID_Orden_transporte CHAR(8),
    ID_Guia_Remision CHAR(8),
    FOREIGN KEY (ID_Orden_transporte) REFERENCES Orden_Transporte(ID_Orden_transporte), FOREIGN KEY (ID_Guia_Remision) REFERENCES Guia_de_Remision(ID_Guia_Remision)
);


CREATE TABLE Seguimiento (
    ID_Seguimiento CHAR(8) PRIMARY KEY,
    Fecha_registro DATE NOT NULL,
    Hora_registro TIME,
    Descripcion VARCHAR(128),
    ID_Estado_seguimiento CHAR(1),
    ID_Orden_transporte CHAR(8),
    FOREIGN KEY (ID_Estado_seguimiento) REFERENCES Estado_Seguimiento(ID_Estado_seguimiento),
    FOREIGN KEY (ID_Orden_transporte) REFERENCES Orden_Transporte(ID_Orden_transporte)
);

CREATE TABLE Informe_Entrega (
    ID_Informe_entrega CHAR(8) PRIMARY KEY,
    Fecha_entrega DATE NOT NULL,
    Hora_entrega TIME,
    nombre_receptor VARCHAR(128),
    dni_receptor CHAR(8),
    observacion VARCHAR(256),
    ID_Guia_Remision CHAR(8),
    FOREIGN KEY (ID_Guia_Remision) REFERENCES Guia_de_Remision(ID_Guia_Remision)
);

CREATE TABLE Reporte_Incidentes_Entrega (
    ID_Reporte_incidentes CHAR(8) PRIMARY KEY,
    ID_Estado_reporte CHAR(1),
    Descripcion VARCHAR(256),
    ID_Tipo_incidente CHAR(1),
    Fecha_registro DATE NOT NULL,
    Hora_registro TIME,
    ID_Cliente CHAR(8),
    ID_Informe_entrega CHAR(8),
    ID_Empleado CHAR(8),
    FOREIGN KEY (ID_Estado_reporte) REFERENCES Estado_reporte_incidentes_transporte(ID_Estado_reporte),
    FOREIGN KEY (ID_Tipo_incidente) REFERENCES Tipo_incidente_entrega(ID_Tipo_incidente),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Informe_entrega) REFERENCES Informe_Entrega(ID_Informe_entrega),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

-- Trazabilidad



-- Preparación de pedidos
CREATE TABLE Empaque (
    ID_empaque CHAR(8) PRIMARY KEY,
    Nombre VARCHAR(100),
    ID_Tipo_empaque CHAR(1),
    Descripcion VARCHAR(200),
    Capacidad_maxima FLOAT,
    ID_Lote CHAR(8),
    FOREIGN KEY (ID_Lote) REFERENCES Lote(ID_lote),
    FOREIGN KEY (ID_Tipo_empaque) REFERENCES Tipo_empaque(ID_Tipo_empaque)
);

CREATE TABLE Packing (
    ID_packing CHAR(8) PRIMARY KEY,
    ID_Estado_packing CHAR(1),
    Fecha_packing DATE,
    Cantidad_producto INT,
    Peso_Neto FLOAT,
    ID_Pedido CHAR(8),
    ID_Empleado CHAR(8),
    ID_empaque CHAR(8),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_empaque) REFERENCES Empaque(ID_empaque),
    FOREIGN KEY (ID_Estado_packing) REFERENCES Estado_packing(ID_Estado_packing)
);

CREATE TABLE Reporte_Packing (
    ID_Reporte_Packing CHAR(8) PRIMARY KEY,
    Observaciones VARCHAR(200),
    Fecha_reporte DATE,
    ID_Empleado CHAR(8),
    ID_packing CHAR(8),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_packing) REFERENCES Packing(ID_packing)
);


CREATE TABLE Procesos (
    ID_Procesos CHAR(8) PRIMARY KEY,
    Fecha_actualizada DATE,
    Hora_actualizada TIME,
    Tipo_proceso VARCHAR(50),
    Estado CHAR(16),
    ID_Reporte_trazabilidad CHAR(8),
    ID_Empleado CHAR(8),
    ID_Recepcion CHAR(8),
    ID_packing CHAR(8),   
    ID_Guia_Remision CHAR(8),
    ID_Movimiento_inventario CHAR(8),
   
FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
FOREIGN KEY (ID_Recepcion) REFERENCES Recepcion(ID_Recepcion),
FOREIGN KEY (ID_packing) REFERENCES Packing(ID_packing),
FOREIGN KEY (ID_Guia_Remision) REFERENCES Guia_de_Remision(ID_Guia_Remision),
FOREIGN KEY (ID_Movimiento_inventario) REFERENCES Movimiento_inventario(ID_Movimiento_inventario)

);

CREATE TABLE Reporte_trazabilidad (
    ID_Reporte_trazabilidad CHAR(8) PRIMARY KEY,
    Observaciones VARCHAR(99),
    Firmas CHAR(16),
    Fecha DATE,
    Hora TIME,
    Estado CHAR(16),
    Acciones VARCHAR(99),
    Anexos VARCHAR(99),
    ID_Empleado CHAR(8),
    ID_Procesos CHAR(8),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
FOREIGN KEY (ID_Procesos) REFERENCES Procesos(ID_Procesos)
);


CREATE TABLE Incidencias (
    ID_Incidencias CHAR(8) PRIMARY KEY,
    Causa VARCHAR(99),
    Tipo_incidencia VARCHAR(50),
    Estado CHAR(16) NOT NULL,
    Fecha_registrada DATE NOT NULL,
    Hora TIME NOT NULL,
    Observaciones TEXT NOT NULL,
    Evidencias VARCHAR(99),
    Fecha_resolucion DATE,
    ID_Empleado CHAR(8),
    ID_Procesos CHAR(8),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Procesos) REFERENCES Procesos(ID_Procesos)
);

```
