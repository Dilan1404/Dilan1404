
DROP TABLE IF EXISTS Realiza CASCADE;
DROP TABLE IF EXISTS Historial_Cambios_Area CASCADE;
DROP TABLE IF EXISTS Movimiento_inventario CASCADE;
DROP TABLE IF EXISTS Alerta_inventario CASCADE;
DROP TABLE IF EXISTS PROCESOS CASCADE;
DROP TABLE IF EXISTS Tipo_empaque CASCADE;	
DROP TABLE IF EXISTS Estado_packing CASCADE;
DROP TABLE IF EXISTS INCIDENCIAS CASCADE;
DROP TABLE IF EXISTS REPORTE_TRAZABILIDAD CASCADE;
DROP TABLE IF EXISTS Mantenimiento_detalle CASCADE;
DROP TABLE IF EXISTS Recepcion CASCADE;
DROP TABLE IF EXISTS Control_de_calidad CASCADE;
DROP TABLE IF EXISTS Reporte_producto_observado  CASCADE;
DROP TABLE IF EXISTS Reporte_Recepcion_estadisticas   CASCADE;
DROP TABLE IF EXISTS REPORTE_EQUIPOS CASCADE;
DROP TABLE IF EXISTS Reporte_inventario_detalle CASCADE;
DROP TABLE IF EXISTS Reporte_inventario CASCADE;
DROP TABLE IF EXISTS PROG_MANTENIMIENTOS CASCADE;
DROP TABLE IF EXISTS PLANIFICACIONES_ASIGNACION CASCADE;
DROP TABLE IF EXISTS EQUIPOS CASCADE;
DROP TABLE IF EXISTS Area CASCADE;
DROP TABLE IF EXISTS MAQUINAS_SUSTITUTAS CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;
DROP TABLE IF EXISTS Reporte_Packing CASCADE;
DROP TABLE IF EXISTS Packing CASCADE;
DROP TABLE IF EXISTS Empaque CASCADE;
DROP TABLE IF EXISTS Stock CASCADE;
DROP TABLE IF EXISTS Ubicacion_Lote CASCADE;
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
DROP TABLE IF EXISTS Tipo_Lote CASCADE;
DROP TABLE IF EXISTS Estado_Mantenimiento_Operacion CASCADE;
DROP TABLE IF EXISTS Historial_Estado_Equipo CASCADE;

-- Look Up Tables
CREATE TABLE Estado_Empleado (
    id_estado_empleado CHAR(4) PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Tipo_Empleado (
    id_tipo_empleado CHAR(4) PRIMARY KEY,
    descripcion VARCHAR(40)
);

CREATE TABLE Tipo_Producto (
    id_tipo_producto CHAR(2) PRIMARY KEY,
    descripcion VARCHAR(50)
);
CREATE TABLE Tipo_empaque  (
   id_tipo_empaque CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Estado_packing (
    id_estado_packing CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(50)  
); 
CREATE TABLE Estado_Lote (
    id_estado_lote CHAR(2) PRIMARY KEY,
    descripcion VARCHAR(20)
);

CREATE TABLE Estado_Recepcion (
    id_estado_recepcion CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(20)
);

CREATE TABLE Estado_Control_Calidad (
    id_estado_control_calidad CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(20)
);

CREATE TABLE Estado_paquete_Recepcion (
    id_estado_paquete_recepcion CHAR(4) PRIMARY KEY,
    descripcion VARCHAR(50)
);


CREATE TABLE Estado_Orden_Transporte (
    id_estado_orden CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(128)
);

CREATE TABLE Estado_Seguimiento (
    id_estado_seguimiento CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(128)
);

CREATE TABLE Tipo_incidente_entrega (
    id_tipo_incidente CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(128)
);

CREATE TABLE Estado_reporte_incidentes_transporte (
    id_estado_reporte CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(128)
);
CREATE TABLE Estado_Mantenimiento_Operacion (
    id_estado_mantenimiento_operacion CHAR(4) PRIMARY KEY,
    descripcion VARCHAR(50)
);


CREATE TABLE Estado_Mantenimiento (
    id_estado_mantenimiento CHAR(8) PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Tipo_Maquina (
    id_tipo_maquina CHAR(5) PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Estado_Equipo (
    id_estado_equipo CHAR(3) PRIMARY KEY,
    descripcion VARCHAR(20)
);

CREATE TABLE Tipo_Vehiculo (
    id_tipo_vehiculo CHAR(4) PRIMARY KEY,
    descripcion VARCHAR(20)
);

CREATE TABLE Tipo_Movimiento (
    id_tipo_movimiento CHAR(1) PRIMARY KEY,
    descripcion VARCHAR(13)
);

CREATE TABLE Tipo_Lote (
    id_tipo_lote SERIAL PRIMARY KEY,
    descripcion VARCHAR(120)
);
-- Tablas principales		
CREATE TABLE Empleado (
    id_empleado SERIAL PRIMARY KEY,
    cod_empleado CHAR(8) UNIQUE NOT NULL,
    nombre_apellido VARCHAR(150),
    fecha_nacimiento DATE,
    fecha_contratacion DATE DEFAULT CURRENT_DATE,
    id_tipo_empleado CHAR(4),
    id_estado_empleado CHAR(4),
    fecha_despido DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_tipo_empleado) REFERENCES Tipo_Empleado(id_tipo_empleado),
    FOREIGN KEY (id_estado_empleado) REFERENCES Estado_Empleado(id_estado_empleado)
);


CREATE TABLE MAQUINAS_SUSTITUTAS (
ID_MAQUINAS_SUSTITUTAS SERIAL PRIMARY KEY,
COD_MAQUINAS_SUSTITUTAS CHAR(8) UNIQUE NOT NULL,
    Nombre_de_maquina VARCHAR(100),
    ID_Estado_equipo CHAR(3),
     ID_Tipo_Maquina CHAR(5),
	 ID_Empleado INT,
	 fecha_registro DATE,
 FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Tipo_Maquina) REFERENCES Tipo_Maquina(ID_Tipo_Maquina),
    FOREIGN KEY (ID_Estado_equipo) REFERENCES Estado_Equipo(ID_Estado_equipo)

);


CREATE TABLE Area (
    id_area CHAR(3) PRIMARY KEY,
    nombre_del_area VARCHAR(40)
);
CREATE TABLE EQUIPOS (  
    ID_EQUIPOS SERIAL PRIMARY KEY,
COD_EQUIPOS CHAR(8) UNIQUE NOT NULL,
    Nombre_equipo VARCHAR(40),
    ID_Estado_equipo CHAR(3),
    ID_Tipo_Maquina CHAR(5),
    Fecha_registro DATE DEFAULT CURRENT_DATE,
    Fecha_salida DATE DEFAULT CURRENT_DATE,
    Detalle VARCHAR(100),
    ID_MAQUINAS_SUSTITUTAS INT NULL,
    ID_Empleado INT,
    FOREIGN KEY (ID_MAQUINAS_SUSTITUTAS) REFERENCES MAQUINAS_SUSTITUTAS(ID_MAQUINAS_SUSTITUTAS) ON DELETE SET NULL,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Estado_equipo) REFERENCES Estado_Equipo(ID_Estado_equipo),
    FOREIGN KEY (ID_Tipo_Maquina) REFERENCES Tipo_Maquina(ID_Tipo_Maquina)
);


CREATE TABLE Historial_Estado_Equipo (
    ID_HISTO_EST SERIAL PRIMARY KEY,
    ID_EQUIPOS INT,
    Fecha DATE,
    ID_Estado_equipo CHAR(3),
    Detalle VARCHAR(55),
    FOREIGN KEY (ID_EQUIPOS) REFERENCES EQUIPOS(ID_EQUIPOS),
	FOREIGN KEY (ID_Estado_equipo) REFERENCES Estado_Equipo(ID_Estado_equipo)
);



CREATE TABLE PLANIFICACIONES_ASIGNACION (
       ID_PLANIFICACIONES_ASIGNACION SERIAL PRIMARY KEY,
COD_PLANIFICACIONES_ASIGNACION CHAR(8) UNIQUE NOT NULL,
    Fecha_registro TIMESTAMP DEFAULT NOW(),
    Fecha_de_asignacion TIMESTAMP ,
    Fecha_de_vencimiento TIMESTAMP ,
    Descripcion_de_tarea VARCHAR(100),
    ID_Area CHAR(3),
    ID_EQUIPOS INT,
    ID_Empleado_Registra INT,
    ID_Empleado_Solicita INT,
    FOREIGN KEY (ID_Area) REFERENCES Area(ID_Area),
    FOREIGN KEY (ID_EQUIPOS) REFERENCES EQUIPOS(ID_EQUIPOS),
    FOREIGN KEY (ID_Empleado_Registra) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Empleado_Solicita) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Realiza (
    ID_Empleado INT,
    ID_PLANIFICACIONES_ASIGNACION INT,
    PRIMARY KEY (ID_Empleado, ID_PLANIFICACIONES_ASIGNACION),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_PLANIFICACIONES_ASIGNACION) REFERENCES PLANIFICACIONES_ASIGNACION(ID_PLANIFICACIONES_ASIGNACION)
);

CREATE TABLE Historial_Cambios_Area (
    ID_Cambio SERIAL PRIMARY KEY,
    COD_Cambio CHAR(8) UNIQUE NOT NULL,
    ID_EQUIPOS INT,
    ID_PLANIFICACIONES_ASIGNACION INT,
    ID_Area_Anterior CHAR(3),
    ID_Area_Actual CHAR(3),
    FOREIGN KEY (ID_EQUIPOS) REFERENCES EQUIPOS(ID_EQUIPOS),
    FOREIGN KEY (ID_PLANIFICACIONES_ASIGNACION) REFERENCES PLANIFICACIONES_ASIGNACION(ID_PLANIFICACIONES_ASIGNACION),
    FOREIGN KEY (ID_Area_Anterior) REFERENCES Area(ID_Area),
    FOREIGN KEY (ID_Area_Actual) REFERENCES Area(ID_Area)
);

CREATE TABLE PROG_MANTENIMIENTOS (
ID_PROG_MANTENIMIENTOS SERIAL PRIMARY KEY,
    COD_PROG_MANTENIMIENTOS CHAR(8) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT NOW(),
    Fecha_de_inicio DATE,
    Fecha_de_fin DATE,
    Empresa_encargada VARCHAR(100),
    ID_EQUIPOS INT,
    ID_Estado_mantenimiento CHAR(8),
    ID_Empleado_Registra INT,
    ID_Empleado_Solicita INT,
    ID_MAQUINAS_SUSTITUTAS INT,
    FOREIGN KEY (ID_EQUIPOS) REFERENCES EQUIPOS(ID_EQUIPOS),
    FOREIGN KEY (ID_Estado_mantenimiento) REFERENCES Estado_Mantenimiento(ID_Estado_mantenimiento),
    FOREIGN KEY (ID_Empleado_Registra) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Empleado_Solicita) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_MAQUINAS_SUSTITUTAS) REFERENCES MAQUINAS_SUSTITUTAS(ID_MAQUINAS_SUSTITUTAS) ON DELETE SET NULL
);


CREATE TABLE Producto (
    id_producto CHAR(8) PRIMARY KEY,
    nombre_producto VARCHAR(100),
    id_tipo_producto CHAR(2),
    descripcion VARCHAR(120),
    FOREIGN KEY (id_tipo_producto) REFERENCES Tipo_Producto(id_tipo_producto)
);


CREATE TABLE Lote (
    id_lote SERIAL PRIMARY KEY,
    cod_lote CHAR (8) UNIQUE NOT NULL,
    id_tipo_lote INT,
    cantidad_total FLOAT,
    unidad VARCHAR(20),
    fecha_vencimiento DATE,
    id_estado_lote CHAR(2),
    fecha_produccion DATE,
    id_producto CHAR(8),
    FOREIGN KEY (id_tipo_lote) REFERENCES Tipo_Lote(id_tipo_lote),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_estado_lote) REFERENCES Estado_Lote(id_estado_lote)
);



CREATE TABLE Ubicacion_Almacen (
id_ubicacion_almacen SERIAL PRIMARY KEY,
    cod_ubicacion_almacen CHAR(8) UNIQUE NOT NULL,
    tipo_area VARCHAR(50),
    peso_maximo FLOAT,
    volumen_maximo FLOAT
);

CREATE TABLE Ubicacion_Lote (
	id_ubicacion_lote SERIAL PRIMARY KEY,
	id_ubicacion_almacen INT NOT NULL,
	id_lote INT NOT NULL,
	fecha_asignacion TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (id_ubicacion_almacen) REFERENCES Ubicacion_Almacen(id_ubicacion_almacen),
	FOREIGN KEY (id_lote) REFERENCES Lote(id_lote),
	UNIQUE (id_lote) -- Un lote pertenece solo a una ubicación
);


CREATE TABLE Stock (
    id_stock SERIAL PRIMARY KEY,
    cod_stock CHAR(8) UNIQUE NOT NULL,
    stock_minimo INT,
    stock_maximo INT,
    id_producto CHAR (8),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);


CREATE TABLE Reporte_inventario (
    id_reporte_inventario SERIAL PRIMARY KEY,
    cod_reporte_inventario CHAR(8) UNIQUE NOT NULL,
    fecha_inventario DATE,
    id_planificaciones_asignacion INT,
    ID_PROG_MANTENIMIENTOS INT,
    FOREIGN KEY (ID_PLANIFICACIONES_ASIGNACION) REFERENCES PLANIFICACIONES_ASIGNACION(ID_PLANIFICACIONES_ASIGNACION),
    FOREIGN KEY (ID_PROG_MANTENIMIENTOS) REFERENCES PROG_MANTENIMIENTOS(ID_PROG_MANTENIMIENTOS)
);

CREATE TABLE Reporte_inventario_detalle (
	id_detalle SERIAL PRIMARY KEY,
	id_reporte_inventario INT NOT NULL,
	id_lote INT NOT NULL,
	cantidad_esperada FLOAT,
    cantidad_real FLOAT,
    diferencia FLOAT GENERATED ALWAYS AS (cantidad_real - cantidad_esperada) STORED,
    observacion VARCHAR(300),
    FOREIGN KEY (id_reporte_inventario) REFERENCES Reporte_inventario(id_reporte_inventario),
	FOREIGN KEY (id_lote) REFERENCES Lote(id_lote)
);


CREATE TABLE REPORTE_EQUIPOS (
    ID_REPORTE_EQUIPOS SERIAL PRIMARY KEY,
    COD_REPORTE_EQUIPOS CHAR(8) UNIQUE NOT NULL,
    ID_EQUIPOS INT,
    ID_PLANIFICACIONES_ASIGNACION INT,
    ID_PROG_MANTENIMIENTOS INT,
    FOREIGN KEY (ID_EQUIPOS) REFERENCES EQUIPOS(ID_EQUIPOS),
    FOREIGN KEY (ID_PLANIFICACIONES_ASIGNACION) REFERENCES PLANIFICACIONES_ASIGNACION(ID_PLANIFICACIONES_ASIGNACION),
    FOREIGN KEY (ID_PROG_MANTENIMIENTOS) REFERENCES PROG_MANTENIMIENTOS(ID_PROG_MANTENIMIENTOS)
);

CREATE TABLE Mantenimiento_detalle (
ID_Mantenimiento_detalle SERIAL PRIMARY KEY,
    COD_Mantenimiento_detalle CHAR(8) UNIQUE NOT NULL,
    Detalle_mantenimiento_realizado VARCHAR(100),
   ID_Estado_Mantenimiento_Operacion CHAR(4),
    ID_PROG_MANTENIMIENTOS INT,
    FOREIGN KEY (ID_Estado_Mantenimiento_Operacion) REFERENCES Estado_Mantenimiento_Operacion(ID_Estado_Mantenimiento_Operacion),
	FOREIGN KEY (ID_PROG_MANTENIMIENTOS) REFERENCES PROG_MANTENIMIENTOS(ID_PROG_MANTENIMIENTOS)
);  


CREATE TABLE Recepcion (
    ID_recepcion SERIAL PRIMARY KEY,
    cod_recepcion CHAR(8) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT NOW(),
    cantidad_recibida FLOAT,
	observaciones CHAR (100),
    id_estado_recepcion CHAR(1),
    id_lote INT,
    FOREIGN KEY (id_lote) REFERENCES Lote(id_lote),
    FOREIGN KEY (id_estado_recepcion) REFERENCES Estado_Recepcion(id_estado_recepcion)
);

CREATE TABLE Control_de_calidad (
    id_control_de_calidad SERIAL PRIMARY KEY,
    cod_control_calidad CHAR(8) UNIQUE NOT NULL,
    fecha_inspeccion TIMESTAMP DEFAULT NOW(),
    id_estado_paquete_recepcion CHAR(4),
    temperatura_producto FLOAT,
    observaciones_lote VARCHAR(120),
    observaciones_empaque VARCHAR(120),
    id_estado_control_calidad CHAR(1),
    id_recepcion INT,
    id_empleado INT,
    FOREIGN KEY (id_recepcion) REFERENCES Recepcion(ID_recepcion),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_estado_paquete_recepcion) REFERENCES Estado_paquete_Recepcion(id_estado_paquete_recepcion),
    FOREIGN KEY (id_estado_control_calidad) REFERENCES Estado_Control_Calidad(id_estado_control_calidad)
);

CREATE TABLE Reporte_producto_observado (
    id_reporte_producto_observado SERIAL PRIMARY KEY,
    fecha_registro TIMESTAMP DEFAULT NOW(),
    especificacion_no_cumplida VARCHAR(120),
    acciones_a_tomar VARCHAR(120),
    id_control_de_calidad INT,
    FOREIGN KEY (id_control_de_calidad) REFERENCES Control_de_calidad(id_control_de_calidad) ON DELETE SET NULL
);



CREATE TABLE Movimiento_inventario (
    id_movimiento_inventario SERIAL PRIMARY KEY,
    cod_movimiento_inventario CHAR(8) UNIQUE NOT NULL,
    id_tipo_movimiento CHAR(1) NOT NULL, -- 'E': Entrada, 'S': Salida
    motivo VARCHAR(500),
    cantidad INT NOT NULL, -- Siempre necesario para movimientos parciales
    fecha_movimiento TIMESTAMP DEFAULT NOW(),
	id_lote INT NOT NULL,
	id_producto CHAR(8) NOT NULL,
	id_reporte_inventario INT,
	id_empleado INT NOT NULL,
	origen VARCHAR(100),
    destino VARCHAR(100),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES Tipo_Movimiento(id_tipo_movimiento),
    FOREIGN KEY (id_lote) REFERENCES Lote(id_lote),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_reporte_inventario) REFERENCES Reporte_inventario(id_reporte_inventario),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);


CREATE TABLE Alerta_inventario (
	id_alerta_inventario SERIAL PRIMARY KEY,
	cod_alerta_inventario CHAR(8) UNIQUE NOT NULL,
    estado_alerta VARCHAR(50), -- Ej: 'Pendiente', 'Solucionada'
    tipo_alerta VARCHAR(50), -- Ej: 'Vencimiento', 'Stock bajo'
    severidad VARCHAR(20), -- Ej: 'Alta', 'Media', 'Baja'
    descripcion VARCHAR(500),
    fecha_hora_alerta TIMESTAMP DEFAULT NOW(),
    fecha_hora_solucion TIMESTAMP,
    id_lote INT,
    id_reporte_inventario INT,
    id_empleado_responsable INT, -- Responsable que atiende la alerta
	FOREIGN KEY (id_lote) REFERENCES Lote(id_lote),
	FOREIGN KEY (id_reporte_inventario) REFERENCES Reporte_inventario(id_reporte_inventario),
	FOREIGN KEY (id_empleado_responsable) REFERENCES Empleado(id_empleado)
);




-- Transporte
CREATE TABLE Vehiculo (
    id_vehiculo SERIAL PRIMARY KEY,
    tipo_vehiculo VARCHAR(50),
    placa_vehiculo CHAR(10) UNIQUE NOT NULL,
    estado_vehiculo VARCHAR(20),
    marca VARCHAR(50),
    modelo VARCHAR(50)
);

CREATE TABLE Informe_de_especificaciones (
    ID_informe_de_especificaciones CHAR(8) PRIMARY KEY,
    Longitud_contenedor FLOAT,
    Ancho_contenedor FLOAT,
    Altura_contenedor FLOAT,
    Temperatura_contenedor CHAR(8)
);

CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    cod_cliente CHAR(8) UNIQUE NOT NULL,
    nombre_cliente VARCHAR(100),
    direccion_cliente VARCHAR(150),
    telefono_cliente VARCHAR(20),
    correo_cliente VARCHAR(100)
);


CREATE TABLE Pedido (
    id_pedido SERIAL PRIMARY KEY,
    cod_pedido CHAR (8) UNIQUE NOT NULL,
    direccion_pedido VARCHAR(200),
    fecha_limite DATE,
    destino VARCHAR(100),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Guia_de_Remision (
    id_guia_remision SERIAL PRIMARY KEY,
    cod_guia_remision CHAR(8) UNIQUE NOT NULL,
    fecha_emision DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_de_traslado DATE,
    id_vehiculo INT,
    ID_Informe_de_especificaciones CHAR(8),
    id_transportista int,
    id_pedido INT,
    id_empleado INT,
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
    FOREIGN KEY (ID_Informe_de_especificaciones) REFERENCES Informe_de_especificaciones(ID_informe_de_especificaciones),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_transportista) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Orden_Transporte (
    id_orden_transporte SERIAL PRIMARY KEY,
    cod_orden_transporte CHAR(8) UNIQUE NOT NULL,
    id_empleado INT,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_finalizado DATE,
    id_estado_orden CHAR(1) NOT NULL DEFAULT 'P',
    fecha_salida DATE,
    hora_salida TIME,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_estado_orden) REFERENCES Estado_Orden_Transporte(id_estado_orden)
);

CREATE TABLE Guia_X_Orden_Transporte (
     
     id_orden_transporte INT,
    id_guia_remision INT,
    PRIMARY KEY (id_orden_transporte, id_guia_remision),
    FOREIGN KEY (id_orden_transporte) REFERENCES Orden_Transporte(id_orden_transporte), FOREIGN KEY (id_guia_remision) REFERENCES Guia_de_Remision(id_guia_remision)
);


CREATE TABLE Seguimiento (
    id_seguimiento SERIAL PRIMARY KEY,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_registro TIME NOT NULL DEFAULT CURRENT_TIME,
    descripcion VARCHAR(128),
    id_estado_seguimiento CHAR(1),
    id_orden_transporte INT,
    FOREIGN KEY (id_estado_seguimiento) REFERENCES Estado_Seguimiento(id_estado_seguimiento),
    FOREIGN KEY (id_orden_transporte) REFERENCES Orden_Transporte(id_orden_transporte)
);

CREATE TABLE Informe_Entrega (
    id_informe_entrega SERIAL PRIMARY KEY,
    fecha_entrega DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_entrega TIME NOT NULL DEFAULT CURRENT_TIME,
    nombre_receptor VARCHAR(128),
    dni_receptor CHAR(8),
    observacion VARCHAR(256),
    id_guia_remision INT,
    FOREIGN KEY (id_guia_remision) REFERENCES Guia_de_Remision(id_guia_remision)
);

CREATE TABLE Reporte_Incidentes_Entrega (
    id_reporte_incidentes SERIAL PRIMARY KEY,
    id_estado_reporte CHAR(1),
    descripcion VARCHAR(256),
    id_tipo_incidente CHAR(1),
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_registro TIME NOT NULL DEFAULT CURRENT_TIME,
    id_cliente INT,
    nombre_realiza VARCHAR(128),
    dni_realiza CHAR(8),
    id_informe_entrega INT,
    id_empleado INT,
    FOREIGN KEY (id_estado_reporte) REFERENCES Estado_reporte_incidentes_transporte(id_estado_reporte),
    FOREIGN KEY (id_tipo_incidente) REFERENCES Tipo_incidente_entrega(id_tipo_incidente),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_informe_entrega) REFERENCES Informe_Entrega(id_informe_entrega),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Trazabilidad



-- Preparación de pedidos
CREATE TABLE Empaque (
    id_empaque SERIAL PRIMARY KEY,
    cod_empaque CHAR(8) UNIQUE NOT NULL,
    nombre VARCHAR(100),
    id_tipo_empaque CHAR(1),
    descripcion VARCHAR(200),
    capacidad_maxima FLOAT,
    id_lote INT,
    FOREIGN KEY (ID_Lote) REFERENCES Lote(id_lote),
    FOREIGN KEY (id_tipo_empaque) REFERENCES Tipo_empaque(id_tipo_empaque)
);

CREATE TABLE Packing (
    id_packing SERIAL PRIMARY KEY,
    cod_packing CHAR(8) UNIQUE NOT NULL,
    id_estado_packing CHAR(1),
    fecha_packing DATE,
    cantidad_producto INT,
    peso_neto FLOAT,
    id_pedido INT,
    id_empleado INT,
    id_empaque INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_empaque) REFERENCES Empaque(id_empaque),
    FOREIGN KEY (id_estado_packing) REFERENCES Estado_packing(id_estado_packing)
);

CREATE TABLE Reporte_Packing (
    id_reporte_packing SERIAL PRIMARY KEY,
    cod_reporte_packing CHAR(8) UNIQUE NOT NULL,
    observaciones VARCHAR(200),
    fecha_reporte DATE,
    id_empleado INT,
    id_packing INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_packing) REFERENCES Packing(id_packing)
);


CREATE TABLE PROCESOS(
    id_procesos SERIAL PRIMARY KEY,
    cod_procesos CHAR(8) UNIQUE NOT NULL,     	
    fecha_actualizada DATE,
    hora_actualizada TIME,
    tipo_proceso VARCHAR(50),
    estado CHAR(16),
    id_empleado INT,
    id_recepcion INT,
    id_packing INT,   
    id_guia_remision INT,
    id_movimiento_inventario INT,
   
FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado),
FOREIGN KEY (id_recepcion) REFERENCES RECEPCION(id_recepcion),
FOREIGN KEY (id_packing) REFERENCES PACKING(id_packing),
FOREIGN KEY (id_guia_remision) REFERENCES GUIA_DE_REMISION(id_guia_remision),
FOREIGN KEY (id_movimiento_inventario) REFERENCES MOVIMIENTO_INVENTARIO(id_movimiento_inventario)

);

CREATE TABLE REPORTE_TRAZABILIDAD (
    id_reporte_trazabilidad SERIAL PRIMARY KEY,
    cod_reporte_trazabilidad CHAR(8) UNIQUE NOT NULL,     
    observaciones VARCHAR(99),
    firmas CHAR(16),
    fecha DATE,
    hora TIME,
    estado CHAR(16),
    acciones VARCHAR(99),
    anexos VARCHAR(99),
    id_empleado INT,
    id_procesos INT,
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado),
FOREIGN KEY (id_procesos) REFERENCES PROCESOS(id_procesos)
);


CREATE TABLE INCIDENCIAS (
    id_Incidencias SERIAL PRIMARY KEY,
    cod_incidencias CHAR(8) UNIQUE NOT NULL,     
    causa VARCHAR(99),
    tipo_incidencia VARCHAR(50),
    estado CHAR(16) NOT NULL,
    fecha_registrada DATE NOT NULL,
    hora TIME NOT NULL,
    observaciones TEXT NOT NULL,
    evidencias VARCHAR(99),
    fecha_resolucion DATE,
    id_empleado INT,
    id_procesos INT,
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado),
    FOREIGN KEY (id_procesos) REFERENCES PROCESOS(id_procesos)
);



INSERT INTO Estado_Empleado (id_estado_empleado, descripcion)
VALUES
('ACTV', 'Activo'),
('DESP', 'Despedido'),
('BAJA', 'Baja Temporal'),
('SERV', 'En servicio');

INSERT INTO Tipo_Empleado (id_tipo_empleado, descripcion) VALUES
('OPER', 'Operario'),
('SUPV', 'Supervisor'),
('ADMN', 'Administrador'),
('TECN', 'Técnico'),
('TRAN', 'Transportista');


INSERT INTO Tipo_Producto (id_tipo_producto, descripcion) VALUES
('FT', 'Fruta de Clima Templado'),
('FM', 'Fruta de Clima Mediterráneo'),
('TR', 'Fruta de Clima Tropical'),
('HT', 'Hortaliza');

INSERT INTO Estado_packing (id_estado_packing, descripcion) VALUES
('F', 'Finalizado'),
('E', 'En proceso'),
('S', 'Suspendido');

INSERT INTO Tipo_empaque (id_tipo_empaque, descripcion) VALUES
('P', 'Parihuela'),
('S', 'Saco'),
('C', 'Caja'),
('B', 'Bolsa plástica'),
('M', 'Malla');


-- Estado_Lote
INSERT INTO Estado_Lote (id_estado_lote, descripcion) VALUES
('OK', 'Aprobado'),
('PT', 'Pendiente'),
('CC', 'Control de calidad'),
('OB', 'Observado');

-- Estado_Recepcion
INSERT INTO Estado_Recepcion (id_estado_recepcion, descripcion) VALUES
('A', 'Aprobado'),
('O', 'Observado');

-- Estado_Control_Calidad
INSERT INTO Estado_Control_Calidad (id_estado_control_calidad, descripcion) VALUES
('A', 'Aprobado'),
('O', 'Observado');

-- Estado_paquete_Recepcion
INSERT INTO Estado_paquete_Recepcion (id_estado_paquete_recepcion, descripcion) VALUES
('OKPR', 'Paquete OK'),
('OBS', 'Paquete Observado');




INSERT INTO Estado_Mantenimiento_Operacion (id_estado_mantenimiento_operacion, descripcion)
VALUES
('COM', 'Completado'),
('PEN', 'Pendiente'),
('ENP', 'En Proceso');

INSERT INTO Estado_Mantenimiento (id_estado_mantenimiento, descripcion)
VALUES
('EM000001', 'Mantenimiento preventivo'),
('EM000002', 'Mantenimiento correctivo'),
('EM000003', 'En espera de repuestos'),
('EM000004', 'Mantenimiento completo');


INSERT INTO Tipo_Maquina (id_tipo_maquina, descripcion)
VALUES
('TM001', 'Clasificadora'),
('TM002', 'Máquinas de encerado manual'),
('TM003', 'Termógrafo'),
('TM004', 'Cámara frigorífica'),
('TM005', 'Montacargas'),
('TM006', 'Transpaletas eléctricos'),
('TM007', 'Carritos de mano'),
('TM008', 'Gasificado');

INSERT INTO Estado_Equipo (id_estado_equipo, descripcion)
VALUES
('OPE', 'Operativo'),
('MNT', 'Mantenimiento'),
('FSE', 'Fuera de servicio');



INSERT INTO Estado_Orden_Transporte (id_estado_orden, descripcion) VALUES
('P', 'Pendiente o en curso'),
('F', 'Finalizado');

INSERT INTO Estado_Seguimiento (id_estado_seguimiento, descripcion) VALUES
('T', 'En tránsito'),
('P', 'Realización de una parada'),
('E', 'Realización de una entrega'),
('A', 'Accidente de tránsito');

INSERT INTO Tipo_incidente_entrega (id_tipo_incidente, descripcion) VALUES
('1', 'Producto dañado'),
('2', 'Retraso del producto'),
('3', 'Productos incompletos'),
('4', 'Otros');

INSERT INTO Estado_reporte_incidentes_transporte (id_estado_reporte, descripcion) VALUES
('P', 'Pendiente'),
('R', 'Resuelto');

INSERT INTO Tipo_Movimiento (id_tipo_movimiento, descripcion) VALUES
('E', 'Entrada'),
('S', 'Salida'),
('T', 'Transferencia');

INSERT INTO Tipo_Lote (descripcion) VALUES
('Lote para exportación'),
('Lote para mercado local'),
('Lote orgánico'),
('Lote para procesamiento industrial'),
('Lote de ensayo');

-- Empleado
INSERT INTO Empleado (cod_empleado , nombre_apellido, fecha_nacimiento, fecha_contratacion, id_tipo_empleado, id_estado_empleado, fecha_despido) VALUES
('EMP00001', 'Carlos Ramirez', '1985-06-15', '2020-01-10', 'OPER', 'ACTV', NULL),
('EMP00002', 'Lucia Gomez', '1990-09-22', '2019-05-20', 'SUPV', 'ACTV', NULL),
('EMP00003', 'Miguel Torres', '1988-11-03', '2018-04-12', 'ADMN', 'ACTV', NULL),
('EMP00004', 'Andrea Salazar', '1992-01-25', '2021-03-15', 'OPER', 'ACTV', NULL),
('EMP00005', 'Jorge Medina', '1987-08-19', '2017-06-01', 'SUPV', 'ACTV', NULL),
('EMP00006', 'Ana Castillo', '1995-12-10', '2022-01-25', 'OPER', 'ACTV', NULL),
('EMP00007', 'Ricardo Díaz', '1984-05-05', '2016-11-30', 'ADMN', 'ACTV', NULL),
('EMP00008', 'María Paredes', '1993-07-18', '2019-08-05', 'SUPV', 'ACTV', NULL),
('EMP00009', 'Sofía Rojas', '1991-10-30', '2021-09-12', 'OPER', 'ACTV', NULL),
('EMP00010', 'Luis Caballero', '1986-03-11', '2020-05-23', 'OPER', 'ACTV', NULL),
('EMP00011', 'Tulio Triviño', '1991-10-30', '2021-09-12', 'TRAN', 'ACTV', NULL),
('EMP00012', 'Bar Sinso', '1991-10-11', '2021-09-12', 'TRAN', 'ACTV', NULL),
('EMP00013', 'Mordecai Rosales', '1991-10-12', '2021-09-12', 'TRAN', 'ACTV', NULL),
('EMP00014', 'Finn Human', '1991-10-13', '2021-09-12', 'TRAN', 'ACTV', NULL),
('EMP00015', 'Roger Loayza', '1991-10-13', '2021-09-12', 'TRAN', 'ACTV', NULL),
('EMP00016', 'Pipo Hernandez', '1991-10-13', '2021-09-12', 'TRAN', 'ACTV', NULL),
('EMP00017', 'Elena Chávez', '1994-02-17', '2022-07-01', 'OPER', 'ACTV', NULL),
('EMP00018', 'Martín Valverde', '1989-04-25', '2020-10-15', 'SUPV', 'ACTV', NULL),
('EMP00019', 'Daniela Quispe', '1996-06-09', '2023-02-20', 'ADMN', 'ACTV', NULL),
('EMP00020', 'Hugo Fernandez', '1983-12-03', '2015-09-10', 'TRAN', 'ACTV', NULL),
('EMP00021', 'Luis Gutiérrez', '1980-05-14', '2012-03-01', 'TRAN', 'ACTV', NULL),
('EMP00022', 'Carlos Rivas', '1978-08-20', '2010-11-15', 'TRAN', 'ACTV', NULL),
('EMP00023', 'Jorge Salinas', '1985-01-09', '2014-06-23', 'TRAN', 'ACTV', NULL),
('EMP00024', 'Pedro Cáceres', '1982-04-30', '2013-10-10', 'TRAN', 'ACTV', NULL),
('EMP00025', 'Marco Villanueva', '1990-07-12', '2017-01-05', 'TRAN', 'ACTV', NULL),
('EMP00026', 'Raúl Mendoza', '1988-03-18', '2016-08-20', 'TRAN', 'ACTV', NULL),
('EMP00027', 'Oscar Herrera', '1986-09-25', '2014-12-11', 'TRAN', 'ACTV', NULL),
('EMP00028', 'Fernando Núñez', '1981-11-07', '2011-07-30', 'TRAN', 'ACTV', NULL),
('EMP00029', 'Ricardo Paredes', '1979-02-22', '2009-04-17', 'TRAN', 'ACTV', NULL),
('EMP00030', 'Daniel Alvarado', '1984-06-16', '2013-09-03', 'TRAN', 'ACTV', NULL);



INSERT INTO maquinas_sustitutas (id_maquinas_sustitutas, cod_maquinas_sustitutas, nombre_de_maquina, id_estado_equipo, id_tipo_maquina, id_empleado, fecha_registro) VALUES
(1, 'M0000001', 'Cosechadora', 'OPE', 'TM001', 11, '2023-01-15'),
(2, 'M0000002', 'Máquina de Encerado Manual', 'FSE', 'TM002', 2, '2023-02-10'),
(3, 'M0000003', 'Termógrafo', 'OPE', 'TM003', 3, '2023-03-05'),
(4, 'M0000004', 'Cámara Frigorífica', 'MNT', 'TM004', 4, '2023-04-12'),
(5, 'M0000005', 'Montacargas', 'OPE', 'TM005', 1, '2023-05-20'),
(6, 'M0000006', 'Transpaleta Eléctrica', 'FSE', 'TM006', 3, '2023-06-15'),
(7, 'M0000007', 'Carrito de Mano', 'OPE', 'TM007', 2, '2023-07-10'),
(8, 'M0000008', 'Gasificadora', 'MNT', 'TM008', 4, '2023-08-01'),
(9, 'M0000009', 'Cosechadora', 'FSE', 'TM001', 4, '2023-09-10'),
(10, 'M0000010', 'Máquina de Encerado Manual', 'OPE', 'TM002', 5, '2023-10-05'),
(11, 'M0000011', 'Termógrafo', 'MNT', 'TM003', 1, '2023-11-15'),
(12, 'M0000012', 'Cámara Frigorífica', 'OPE', 'TM004', 6, '2023-12-01'),
(13, 'M0000013', 'Montacargas', 'FSE', 'TM005', 2, '2024-01-10'),
(14, 'M0000014', 'Transpaleta Eléctrica', 'OPE', 'TM006', 2, '2024-02-20'),
(15, 'M0000015', 'Carrito de Mano', 'MNT', 'TM007', 2, '2024-03-15'),
(16, 'M0000016', 'Gasificadora', 'OPE', 'TM008', 3, '2024-04-10'),
(17, 'M0000017', 'Cosechadora', 'OPE', 'TM001', 3, '2024-05-01'),
(18, 'M0000018', 'Máquina de Encerado Manual', 'FSE', 'TM002', 12, '2024-06-05'),
(19, 'M0000019', 'Termógrafo', 'OPE', 'TM003', 6, '2024-07-20'),
(20, 'M0000020', 'Cámara Frigorífica', 'MNT', 'TM004', 9, '2024-08-10'),
(21, 'M0000021', 'Montacargas', 'OPE', 'TM005', 8, '2024-09-15'),
(22, 'M0000022', 'Transpaleta Eléctrica', 'FSE', 'TM006', 3, '2024-10-10'),
(23, 'M0000023', 'Carrito de Mano', 'OPE', 'TM007', 11, '2024-11-05'),
(24, 'M0000024', 'Gasificadora', 'MNT', 'TM008', 3, '2024-12-01'),
(25, 'M0000025', 'Cosechadora', 'FSE', 'TM001', 2, '2024-12-15'),
(26, 'M0000026', 'Máquina de Encerado Manual', 'OPE', 'TM002', 2, '2024-12-20'),
(27, 'M0000027', 'Termógrafo', 'MNT', 'TM003', 4, '2024-12-25'),
(28, 'M0000028', 'Cámara Frigorífica', 'OPE', 'TM004', 3, '2024-12-28'),
(29, 'M0000029', 'Montacargas', 'FSE', 'TM005', 5, '2024-12-30'),
(30, 'M0000030', 'Transpaleta Eléctrica', 'OPE', 'TM006', 3, '2024-12-31'),
(31, 'M0000031', 'Carrito de Mano', 'MNT', 'TM007', 3, '2024-11-25'),
(32, 'M0000032', 'Gasificadora', 'OPE', 'TM008', 5, '2024-10-15'),
(33, 'M0000033', 'Cosechadora', 'OPE', 'TM001', 6, '2024-09-05'),
(34, 'M0000034', 'Máquina de Encerado Manual', 'FSE', 'TM002', 7, '2024-08-20'),
(35, 'M0000035', 'Termógrafo', 'OPE', 'TM003', 3, '2024-07-15'),
(36, 'M0000036', 'Cámara Frigorífica', 'MNT', 'TM004', 2, '2024-06-10'),
(37, 'M0000037', 'Montacargas', 'OPE', 'TM005', 2, '2024-05-05'),
(38, 'M0000038', 'Transpaleta Eléctrica', 'FSE', 'TM006', 2, '2024-04-01'),
(39, 'M0000039', 'Carrito de Mano', 'OPE', 'TM007', 3, '2024-03-01'),
(40, 'M0000040', 'Gasificadora', 'MNT', 'TM008', 2, '2024-02-01');
INSERT INTO Area (id_area, nombre_del_area)
VALUES
('A01', 'Recepción'),
('A02', 'Pretratamiento'),
('A03', 'Preparación y Paletizado'),
('A04', 'Prefeminamiento'),
('A05', 'Selección y Clasificación'),
('A06', 'Empaquetado y Etiquetado'),
('A07', 'Almacenamiento'),
('A08', 'Despacho');

INSERT INTO EQUIPOS (
  COD_EQUIPOS, Nombre_equipo, ID_Estado_equipo, ID_Tipo_Maquina,
  Fecha_registro, Fecha_salida, Detalle, ID_MAQUINAS_SUSTITUTAS,
  ID_Empleado
) VALUES
('EQ000001', 'Cosechadora ZX', 'OPE', 'TM001', '2023-01-15', NULL, 'Capacidad 2000 u/h, motor 150HP', 7, 3),
('EQ000002', 'Máquina Encerado X5', 'FSE', 'TM002', '2023-02-10', '2023-03-01', 'Potencia 5 HP, ancho 1200mm', 29, 12),
('EQ000003', 'Termógrafo T9', 'OPE', 'TM003', '2023-03-05', NULL, 'Termómetro digital -50°C a 150°C', 5, 9),
('EQ000004', 'Cámara Frigorífica CF100', 'MNT', 'TM004', '2023-04-12', NULL, 'Capacidad 10,000 litros, control digital', 32, 1),
('EQ000005', 'Montacargas MC500', 'OPE', 'TM005', '2023-05-20', NULL, 'Capacidad carga 5000 kg, motor eléctrico', 15, 14),
('EQ000006', 'Transpaleta TE200', 'FSE', 'TM006', '2023-06-15', NULL, 'Capacidad 2000 kg, batería 24V', 12, 6),
('EQ000007', 'Carrito de Mano CM300', 'OPE', 'TM007', '2023-07-10', '2023-07-20', 'Capacidad 300 kg, ruedas acero inoxidable', 2, 4),
('EQ000008', 'Gasificadora G3000', 'MNT', 'TM008', '2023-08-01', NULL, 'Capacidad 300 litros, control automático', 38, 13),
('EQ000009', 'Cosechadora ZX2', 'OPE', 'TM001', '2023-09-10', NULL, 'Capacidad 2500 u/h, motor 180HP', 25, 15),
('EQ000010', 'Máquina Encerado EN300', 'FSE', 'TM002', '2023-10-05', '2023-10-20', 'Potencia 6 HP, ancho 1500 mm', 4, 7),
('EQ000011', 'Termógrafo T10', 'OPE', 'TM003', '2023-11-15', NULL, 'Termómetro digital -60°C a 160°C', 11, 8),
('EQ000012', 'Cámara Frigorífica CF200', 'MNT', 'TM004', '2023-12-01', NULL, 'Capacidad 12,000 litros, control avanzado', 37, 16),
('EQ000013', 'Montacargas MC600', 'OPE', 'TM005', '2024-01-10', NULL, 'Capacidad 6000 kg, motor potente', 19, 10),
('EQ000014', 'Transpaleta TE300', 'FSE', 'TM006', '2024-02-20', NULL, 'Capacidad 3000 kg, batería 36V', 1, 11),
('EQ000015', 'Carrito de Mano CM350', 'OPE', 'TM007', '2024-03-15', NULL, 'Capacidad 350 kg, ruedas reforzadas', 28, 5),
('EQ000016', 'Gasificadora G3500', 'MNT', 'TM008', '2024-04-10', NULL, 'Capacidad 350 litros, control inteligente', 33, 2),
('EQ000017', 'Cosechadora ZX3', 'OPE', 'TM001', '2024-05-01', NULL, 'Capacidad 2700 u/h, motor 190HP', 21, 14),
('EQ000018', 'Máquina Encerado EN350', 'FSE', 'TM002', '2024-06-05', NULL, 'Potencia 7 HP, ancho 1600 mm', 8, 3),
('EQ000019', 'Termógrafo T15', 'OPE', 'TM003', '2024-07-20', NULL, 'Termómetro digital -70°C a 170°C', 30, 13),
('EQ000020', 'Cámara Frigorífica CF300', 'MNT', 'TM004', '2024-08-10', NULL, 'Capacidad 15,000 litros, sistema digital', 18, 7),
('EQ000021', 'Montacargas MC700', 'OPE', 'TM005', '2024-09-15', NULL, 'Capacidad 7000 kg, motor eléctrico potente', 7, 6),
('EQ000022', 'Transpaleta TE400', 'FSE', 'TM006', '2024-10-10', NULL, 'Capacidad 4000 kg, batería 48V', 13, 1),
('EQ000023', 'Carrito de Mano CM400', 'OPE', 'TM007', '2024-11-05', NULL, 'Capacidad 400 kg, ruedas reforzadas', 36, 9),
('EQ000024', 'Gasificadora G4000', 'MNT', 'TM008', '2024-12-01', NULL, 'Capacidad 400 litros, control automático avanzado', 22, 4),
('EQ000025', 'Cosechadora ZX4', 'OPE', 'TM001', '2024-12-15', NULL, 'Capacidad 3000 u/h, motor 200HP', 14, 10),
('EQ000026', 'Máquina Encerado EN400', 'FSE', 'TM002', '2024-12-20', NULL, 'Potencia 8 HP, ancho 1700 mm', 26, 15),
('EQ000027', 'Termógrafo T20', 'OPE', 'TM003', '2024-12-25', NULL, 'Termómetro digital -80°C a 180°C', 24, 1),
('EQ000028', 'Cámara Frigorífica CF400', 'MNT', 'TM004', '2024-12-28', NULL, 'Capacidad 20,000 litros, control avanzado', 35, 11),
('EQ000029', 'Montacargas MC800', 'OPE', 'TM005', '2024-12-30', NULL, 'Capacidad 8000 kg, motor eléctrico de alta potencia', 9, 12),
('EQ000030', 'Transpaleta TE500', 'FSE', 'TM006', '2024-12-31', NULL, 'Capacidad 5000 kg, batería 60V', 20, 14),
('EQ000031', 'Carrito de Mano CM450', 'OPE', 'TM007', '2024-11-25', NULL, 'Capacidad 450 kg, ruedas reforzadas y amortiguadores', 4, 2),
('EQ000032', 'Gasificadora G4500', 'MNT', 'TM008', '2024-10-15', NULL, 'Capacidad 450 litros, sistema de control inteligente', 16, 5),
('EQ000033', 'Cosechadora ZX5', 'OPE', 'TM001', '2024-09-05', NULL, 'Capacidad 3200 u/h, motor 210HP', 31, 6),
('EQ000034', 'Máquina Encerado EN450', 'FSE', 'TM002', '2024-08-20', NULL, 'Potencia 9 HP, ancho 1800 mm', 27, 10),
('EQ000035', 'Termógrafo T25', 'OPE', 'TM003', '2024-07-15', NULL, 'Termómetro digital -90°C a 190°C', 23, 3),
('EQ000036', 'Cámara Frigorífica CF500', 'MNT', 'TM004', '2024-06-10', NULL, 'Capacidad 25,000 litros, sistema avanzado', 10, 4),
('EQ000037', 'Montacargas MC900', 'OPE', 'TM005', '2024-05-05', NULL, 'Capacidad 9000 kg, motor eléctrico potente', 34, 7),
('EQ000038', 'Transpaleta TE600', 'FSE', 'TM006', '2024-04-01', NULL, 'Capacidad 6000 kg, batería 72V', 17, 13),
('EQ000039', 'Carrito de Mano CM500', 'OPE', 'TM007', '2024-03-01', NULL, 'Capacidad 500 kg, ruedas reforzadas y amortiguadores', 3, 15),
('EQ000040', 'Gasificadora G5000', 'MNT', 'TM008', '2024-02-01', NULL, 'Capacidad 500 litros, control automático avanzado', 6, 8);



INSERT INTO Historial_Estado_Equipo (ID_EQUIPOS, Fecha, ID_Estado_equipo, Detalle) VALUES
(1, '2024-01-05', 'OPE', 'Equipo en operación normal'),
(1, '2024-02-15', 'MNT', 'Mantenimiento preventivo realizado'),
(2, '2024-01-10', 'FSE', 'Fallo eléctrico detectado'),
(2, '2024-03-01', 'OPE', 'Reparación completada, equipo operativo'),
(3, '2024-02-20', 'OPE', 'Operación estable sin incidencias'),
(3, '2024-04-05', 'FSE', 'Parada por revisión técnica'),
(4, '2024-01-25', 'MNT', 'Mantenimiento correctivo en proceso'),
(4, '2024-05-15', 'OPE', 'Equipo operando con normalidad'),
(5, '2024-03-10', 'OPE', 'Operativo sin problemas'),
(5, '2024-06-20', 'FSE', 'Fallo en motor principal'),
(6, '2024-04-01', 'MNT', 'Cambio de piezas internas'),
(6, '2024-07-05', 'OPE', 'Mantenimiento terminado, operativo'),
(7, '2024-02-15', 'OPE', 'Operativo y en buenas condiciones'),
(7, '2024-08-01', 'FSE', 'Problema en sistema hidráulico'),
(8, '2024-03-20', 'MNT', 'Revisión y ajuste de calibración'),
(8, '2024-09-10', 'OPE', 'Operando correctamente'),
(9, '2024-01-30', 'OPE', 'Sin incidencias reportadas'),
(9, '2024-10-15', 'FSE', 'Fallo eléctrico severo'),
(10, '2024-05-05', 'MNT', 'Mantenimiento preventivo programado'),
(10, '2024-11-20', 'OPE', 'Operativo luego de mantenimiento'),
(11, '2024-06-15', 'OPE', 'Funcionamiento estable'),
(11, '2024-12-01', 'FSE', 'Detenido por reparación'),
(12, '2024-07-10', 'MNT', 'Cambio de filtros y aceites'),
(12, '2025-01-10', 'OPE', 'Mantenimiento completado'),
(13, '2024-08-05', 'OPE', 'Operativo sin problemas'),
(13, '2025-02-01', 'FSE', 'Fallo en sistema de enfriamiento'),
(14, '2024-09-12', 'MNT', 'Revisión técnica general'),
(14, '2025-03-05', 'OPE', 'Equipos funcionando bien'),
(15, '2024-10-10', 'OPE', 'Operación normal'),
(15, '2025-04-01', 'FSE', 'Fallo mecánico detectado'),
(16, '2024-11-20', 'MNT', 'Mantenimiento en proceso'),
(16, '2025-05-15', 'OPE', 'Reparación finalizada'),
(17, '2024-12-05', 'OPE', 'Equipo operativo'),
(17, '2025-06-01', 'FSE', 'Problemas eléctricos'),
(18, '2025-01-15', 'MNT', 'Mantenimiento preventivo'),
(18, '2025-07-10', 'OPE', 'Funcionando correctamente'),
(19, '2025-02-20', 'OPE', 'Operación estable'),
(19, '2025-08-05', 'FSE', 'Parada por mantenimiento'),
(20, '2025-03-25', 'MNT', 'Revisión de sistema hidráulico'),
(20, '2025-09-20', 'OPE', 'Equipos en funcionamiento');



INSERT INTO PLANIFICACIONES_ASIGNACION (
  COD_PLANIFICACIONES_ASIGNACION, Fecha_registro, Fecha_de_asignacion, Fecha_de_vencimiento,
  Descripcion_de_tarea, ID_Area, ID_EQUIPOS, ID_Empleado_Registra, ID_Empleado_Solicita
) VALUES
('PA000001', '2025-05-01 08:30:00', '2025-05-10', '2025-05-15', 'Recepción y clasificación con Cosechadora', 'A01', 1, 3, 5),
('PA000002', '2025-05-02 09:00:00', '2025-05-12', '2025-05-17', 'Encerado manual en área de Pretratamiento', 'A02', 2, 4, 6),
('PA000003', '2025-05-03 10:15:00', '2025-05-14', '2025-05-20', 'Control térmico con Termógrafo en Preparación y Paletizado', 'A03', 3, 2, 7),
('PA000004', '2025-05-04 11:00:00', '2025-05-15', '2025-05-21', 'Mantenimiento de Cámara Frigorífica en Prefeminamiento', 'A04', 4, 1, 8),
('PA000005', '2025-05-05 13:30:00', '2025-05-16', '2025-05-22', 'Movimiento de materiales con Montacargas en Selección y Clasificación', 'A05', 5, 3, 9),
('PA000006', '2025-05-06 14:45:00', '2025-05-18', '2025-05-23', 'Transporte de palets con Transpaleta Eléctrica en Empaquetado', 'A06', 6, 4, 10),
('PA000007', '2025-05-07 08:00:00', '2025-05-19', '2025-05-24', 'Transporte manual con Carrito de Mano en Almacenamiento', 'A07', 7, 2, 11),
('PA000008', '2025-05-08 09:20:00', '2025-05-20', '2025-05-25', 'Producción de gas con Gasificadora en Despacho', 'A08', 8, 1, 12),
('PA000009', '2025-05-09 10:30:00', '2025-05-21', '2025-05-26', 'Recepción y clasificación con Cosechadora', 'A01', 9, 3, 13),
('PA000010', '2025-05-10 11:15:00', '2025-05-22', '2025-05-27', 'Encerado manual en área de Pretratamiento', 'A02', 10, 4, 14),
('PA000011', '2025-05-11 12:45:00', '2025-05-23', '2025-05-28', 'Control térmico con Termógrafo en Preparación y Paletizado', 'A03', 11, 2, 15),
('PA000012', '2025-05-12 14:00:00', '2025-05-24', '2025-05-29', 'Mantenimiento de Cámara Frigorífica en Prefeminamiento', 'A04', 12, 1, 16),
('PA000013', '2025-05-13 15:30:00', '2025-05-25', '2025-05-30', 'Movimiento de materiales con Montacargas en Selección y Clasificación', 'A05', 13, 3, 1),
('PA000014', '2025-05-14 08:40:00', '2025-05-26', '2025-05-31', 'Transporte de palets con Transpaleta Eléctrica en Empaquetado', 'A06', 14, 4, 2),
('PA000015', '2025-05-15 09:50:00', '2025-05-27', '2025-06-01', 'Transporte manual con Carrito de Mano en Almacenamiento', 'A07', 15, 2, 3),
('PA000016', '2025-05-16 10:10:00', '2025-05-28', '2025-06-02', 'Producción de gas con Gasificadora en Despacho', 'A08', 16, 1, 4),
('PA000017', '2025-05-17 11:30:00', '2025-05-29', '2025-06-03', 'Recepción y clasificación con Cosechadora', 'A01', 17, 3, 5),
('PA000018', '2025-05-18 13:00:00', '2025-05-30', '2025-06-04', 'Encerado manual en área de Pretratamiento', 'A02', 18, 4, 6),
('PA000019', '2025-05-19 14:20:00', '2025-05-31', '2025-06-05', 'Control térmico con Termógrafo en Preparación y Paletizado', 'A03', 19, 2, 7),
('PA000020', '2025-05-20 15:30:00', '2025-06-01', '2025-06-06', 'Mantenimiento de Cámara Frigorífica en Prefeminamiento', 'A04', 20, 1, 8),
('PA000021', '2025-05-21 08:10:00', '2025-06-02', '2025-06-07', 'Movimiento de materiales con Montacargas en Selección y Clasificación', 'A05', 21, 3, 9),
('PA000022', '2025-05-22 09:40:00', '2025-06-03', '2025-06-08', 'Transporte de palets con Transpaleta Eléctrica en Empaquetado', 'A06', 22, 4, 10),
('PA000023', '2025-05-23 10:50:00', '2025-06-04', '2025-06-09', 'Transporte manual con Carrito de Mano en Almacenamiento', 'A07', 23, 2, 11),
('PA000024', '2025-05-24 12:00:00', '2025-06-05', '2025-06-10', 'Producción de gas con Gasificadora en Despacho', 'A08', 24, 1, 12),
('PA000025', '2025-05-25 13:30:00', '2025-06-06', '2025-06-11', 'Recepción y clasificación con Cosechadora', 'A01', 25, 3, 13),
('PA000026', '2025-05-26 14:40:00', '2025-06-07', '2025-06-12', 'Encerado manual en área de Pretratamiento', 'A02', 26, 4, 14),
('PA000027', '2025-05-27 15:50:00', '2025-06-08', '2025-06-13', 'Control térmico con Termógrafo en Preparación y Paletizado', 'A03', 27, 2, 15),
('PA000028', '2025-05-28 08:20:00', '2025-06-09', '2025-06-14', 'Mantenimiento de Cámara Frigorífica en Prefeminamiento', 'A04', 28, 1, 16),
('PA000029', '2025-05-29 09:30:00', '2025-06-10', '2025-06-15', 'Movimiento de materiales con Montacargas en Selección y Clasificación', 'A05', 29, 3, 1),
('PA000030', '2025-05-30 10:40:00', '2025-06-11', '2025-06-16', 'Transporte de palets con Transpaleta Eléctrica en Empaquetado', 'A06', 30, 4, 2),
('PA000031', '2025-05-31 11:50:00', '2025-06-12', '2025-06-17', 'Transporte manual con Carrito de Mano en Almacenamiento', 'A07', 31, 2, 3),
('PA000032', '2025-06-01 13:00:00', '2025-06-13', '2025-06-18', 'Producción de gas con Gasificadora en Despacho', 'A08', 32, 1, 4),
('PA000033', '2025-06-02 14:10:00', '2025-06-14', '2025-06-19', 'Recepción y clasificación con Cosechadora', 'A01', 33, 3, 5),
('PA000034', '2025-06-03 15:20:00', '2025-06-15', '2025-06-20', 'Encerado manual en área de Pretratamiento', 'A02', 34, 4, 6),
('PA000035', '2025-06-04 08:30:00', '2025-06-16', '2025-06-21', 'Control térmico con Termógrafo en Preparación y Paletizado', 'A03', 35, 2, 7),
('PA000036', '2025-06-05 09:40:00', '2025-06-17', '2025-06-22', 'Mantenimiento de Cámara Frigorífica en Prefeminamiento', 'A04', 36, 1, 8),
('PA000037', '2025-06-06 10:50:00', '2025-06-18', '2025-06-23', 'Movimiento de materiales con Montacargas en Selección y Clasificación', 'A05', 37, 3, 9),
('PA000038', '2025-06-07 12:00:00', '2025-06-19', '2025-06-24', 'Transporte de palets con Transpaleta Eléctrica en Empaquetado', 'A06', 38, 4, 10),
('PA000039', '2025-06-08 13:10:00', '2025-06-20', '2025-06-25', 'Transporte manual con Carrito de Mano en Almacenamiento', 'A07', 39, 2, 11),
('PA000040', '2025-06-09 14:20:00', '2025-06-21', '2025-06-26', 'Producción de gas con Gasificadora en Despacho', 'A08', 40, 1, 12);




INSERT INTO Realiza (ID_Empleado, ID_PLANIFICACIONES_ASIGNACION) VALUES
(3, 1),
(4, 2),
(2, 3),
(1, 4),
(3, 5),
(4, 6),
(2, 7),
(1, 8),
(3, 9),
(4, 10),
(2, 11),
(1, 12),
(3, 13),
(4, 14),
(2, 15),
(1, 16),
(3, 17),
(4, 18),
(2, 19),
(1, 20),
(3, 21),
(4, 22),
(2, 23),
(1, 24),
(3, 25),
(4, 26),
(2, 27),
(1, 28),
(3, 29),
(4, 30),
(2, 31),
(1, 32),
(3, 33),
(4, 34),
(2, 35),
(1, 36),
(3, 37),
(4, 38),
(2, 39),
(1, 40);


INSERT INTO Historial_Cambios_Area (
  COD_Cambio, ID_EQUIPOS, ID_PLANIFICACIONES_ASIGNACION,
  ID_Area_Anterior, ID_Area_Actual
) VALUES
('H0000001', 1, 1, 'A01', 'A02'),
('H0000002', 2, 2, 'A02', 'A03'),
('H0000003', 3, 3, 'A03', 'A04'),
('H0000004', 4, 4, 'A04', 'A05'),
('H0000005', 5, 5, 'A05', 'A06'),
('H0000006', 6, 6, 'A06', 'A07'),
('H0000007', 7, 7, 'A07', 'A08'),
('H0000008', 8, 8, 'A08', 'A01'),
('H0000009', 9, 9, 'A01', 'A02'),
('H0000010', 10, 10, 'A02', 'A03'),
('H0000011', 11, 11, 'A03', 'A04'),
('H0000012', 12, 12, 'A04', 'A05'),
('H0000013', 13, 13, 'A05', 'A06'),
('H0000014', 14, 14, 'A06', 'A07'),
('H0000015', 15, 15, 'A07', 'A08'),
('H0000016', 16, 16, 'A08', 'A01'),
('H0000017', 17, 17, 'A01', 'A02'),
('H0000018', 18, 18, 'A02', 'A03'),
('H0000019', 19, 19, 'A03', 'A04'),
('H0000020', 20, 20, 'A04', 'A05'),
('H0000021', 21, 21, 'A05', 'A06'),
('H0000022', 22, 22, 'A06', 'A07'),
('H0000023', 23, 23, 'A07', 'A08'),
('H0000024', 24, 24, 'A08', 'A01'),
('H0000025', 25, 25, 'A01', 'A02'),
('H0000026', 26, 26, 'A02', 'A03'),
('H0000027', 27, 27, 'A03', 'A04'),
('H0000028', 28, 28, 'A04', 'A05'),
('H0000029', 29, 29, 'A05', 'A06'),
('H0000030', 30, 30, 'A06', 'A07'),
('H0000031', 31, 31, 'A07', 'A08'),
('H0000032', 32, 32, 'A08', 'A01'),
('H0000033', 33, 33, 'A01', 'A02'),
('H0000034', 34, 34, 'A02', 'A03'),
('H0000035', 35, 35, 'A03', 'A04'),
('H0000036', 36, 36, 'A04', 'A05'),
('H0000037', 37, 37, 'A05', 'A06'),
('H0000038', 38, 38, 'A06', 'A07'),
('H0000039', 39, 39, 'A07', 'A08'),
('H0000040', 40, 40, 'A08', 'A01');


INSERT INTO PROG_MANTENIMIENTOS (
  COD_PROG_MANTENIMIENTOS, fecha_registro, Fecha_de_inicio, Fecha_de_fin,
  Empresa_encargada, ID_EQUIPOS, ID_Estado_mantenimiento,
  ID_Empleado_Registra, ID_Empleado_Solicita, ID_MAQUINAS_SUSTITUTAS
) VALUES
('PM000001', '2025-05-01 08:00:00', '2025-06-01', '2025-06-05', 'Mantenimiento S.A.', 1, 'EM000001', 3, 5, 7),
('PM000002', '2025-05-02 09:30:00', '2025-06-02', '2025-06-06', 'Reparaciones XYZ', 2, 'EM000002', 4, 6, 12),
('PM000003', '2025-05-03 10:45:00', '2025-06-03', '2025-06-07', 'Servicios Técnicos SAC', 3, 'EM000003', 2, 7, 19),
('PM000004', '2025-05-04 11:15:00', '2025-06-04', '2025-06-08', 'Mantenimiento Integral', 4, 'EM000004', 1, 8, 32),
('PM000005', '2025-05-05 12:00:00', '2025-06-05', '2025-06-09', 'Talleres Unidos', 5, 'EM000001', 3, 9, 15),
('PM000006', '2025-05-06 13:30:00', '2025-06-06', '2025-06-10', 'Servicios Técnicos SAC', 6, 'EM000002', 4, 10, 22),
('PM000007', '2025-05-07 14:45:00', '2025-06-07', '2025-06-11', 'Mantenimiento S.A.', 7, 'EM000003', 2, 11, 28),
('PM000008', '2025-05-08 15:00:00', '2025-06-08', '2025-06-12', 'Reparaciones XYZ', 8, 'EM000004', 1, 12, 33),
('PM000009', '2025-05-09 08:30:00', '2025-06-09', '2025-06-13', 'Talleres Unidos', 9, 'EM000001', 3, 13, 4),
('PM000010', '2025-05-10 09:45:00', '2025-06-10', '2025-06-14', 'Servicios Técnicos SAC', 10, 'EM000002', 4, 14, 7),
('PM000011', '2025-05-11 10:15:00', '2025-06-11', '2025-06-15', 'Mantenimiento Integral', 11, 'EM000003', 2, 15, 11),
('PM000012', '2025-05-12 11:00:00', '2025-06-12', '2025-06-16', 'Mantenimiento S.A.', 12, 'EM000004', 1, 16, 18),
('PM000013', '2025-05-13 12:30:00', '2025-06-13', '2025-06-17', 'Reparaciones XYZ', 13, 'EM000001', 3, 1, 21),
('PM000014', '2025-05-14 13:45:00', '2025-06-14', '2025-06-18', 'Servicios Técnicos SAC', 14, 'EM000002', 4, 2, 26),
('PM000015', '2025-05-15 14:00:00', '2025-06-15', '2025-06-19', 'Mantenimiento Integral', 15, 'EM000003', 2, 3, 30),
('PM000016', '2025-05-16 15:15:00', '2025-06-16', '2025-06-20', 'Mantenimiento S.A.', 16, 'EM000004', 1, 4, 36),
('PM000017', '2025-05-17 08:00:00', '2025-06-17', '2025-06-21', 'Reparaciones XYZ', 17, 'EM000001', 3, 5, 39),
('PM000018', '2025-05-18 09:30:00', '2025-06-18', '2025-06-22', 'Servicios Técnicos SAC', 18, 'EM000002', 4, 6, 1),
('PM000019', '2025-05-19 10:45:00', '2025-06-19', '2025-06-23', 'Mantenimiento Integral', 19, 'EM000003', 2, 7, 5),
('PM000020', '2025-05-20 11:15:00', '2025-06-20', '2025-06-24', 'Mantenimiento S.A.', 20, 'EM000004', 1, 8, 9),
('PM000021', '2025-05-21 12:00:00', '2025-06-21', '2025-06-25', 'Reparaciones XYZ', 21, 'EM000001', 3, 9, 14),
('PM000022', '2025-05-22 13:30:00', '2025-06-22', '2025-06-26', 'Servicios Técnicos SAC', 22, 'EM000002', 4, 10, 18),
('PM000023', '2025-05-23 14:45:00', '2025-06-23', '2025-06-27', 'Mantenimiento Integral', 23, 'EM000003', 2, 11, 23),
('PM000024', '2025-05-24 15:00:00', '2025-06-24', '2025-06-28', 'Mantenimiento S.A.', 24, 'EM000004', 1, 12, 27),
('PM000025', '2025-05-25 08:30:00', '2025-06-25', '2025-06-29', 'Reparaciones XYZ', 25, 'EM000001', 3, 13, 31),
('PM000026', '2025-05-26 09:45:00', '2025-06-26', '2025-06-30', 'Servicios Técnicos SAC', 26, 'EM000002', 4, 14, 35),
('PM000027', '2025-05-27 10:15:00', '2025-06-27', '2025-07-01', 'Mantenimiento Integral', 27, 'EM000003', 2, 15, 38),
('PM000028', '2025-05-28 11:00:00', '2025-06-28', '2025-07-02', 'Mantenimiento S.A.', 28, 'EM000004', 1, 16, 40),
('PM000029', '2025-05-29 12:30:00', '2025-06-29', '2025-07-03', 'Reparaciones XYZ', 29, 'EM000001', 3, 1, 3),
('PM000030', '2025-05-30 13:45:00', '2025-06-30', '2025-07-04', 'Servicios Técnicos SAC', 30, 'EM000002', 4, 2, 6),
('PM000031', '2025-05-31 14:00:00', '2025-07-01', '2025-07-05', 'Mantenimiento Integral', 31, 'EM000003', 2, 3, 10),
('PM000032', '2025-06-01 15:15:00', '2025-07-02', '2025-07-06', 'Mantenimiento S.A.', 32, 'EM000004', 1, 4, 14),
('PM000033', '2025-06-02 08:00:00', '2025-07-03', '2025-07-07', 'Reparaciones XYZ', 33, 'EM000001', 3, 5, 17),
('PM000034', '2025-06-03 09:30:00', '2025-07-04', '2025-07-08', 'Servicios Técnicos SAC', 34, 'EM000002', 4, 6, 20),
('PM000035', '2025-06-04 10:45:00', '2025-07-05', '2025-07-09', 'Mantenimiento Integral', 35, 'EM000003', 2, 7, 23),
('PM000036', '2025-06-05 11:15:00', '2025-07-06', '2025-07-10', 'Mantenimiento S.A.', 36, 'EM000004', 1, 8, 26),
('PM000037', '2025-06-06 12:00:00', '2025-07-07', '2025-07-11', 'Reparaciones XYZ', 37, 'EM000001', 3, 9, 29),
('PM000038', '2025-06-07 13:30:00', '2025-07-08', '2025-07-12', 'Servicios Técnicos SAC', 38, 'EM000002', 4, 10, 32),
('PM000039', '2025-06-08 14:45:00', '2025-07-09', '2025-07-13', 'Mantenimiento Integral', 39, 'EM000003', 2, 11, 35),
('PM000040', '2025-06-09 15:00:00', '2025-07-10', '2025-07-14', 'Mantenimiento S.A.', 40, 'EM000004', 1, 12, 38);


-- Productos
INSERT INTO Producto (id_producto, nombre_producto, id_tipo_producto, descripcion) VALUES
('PRD00001', 'Arándano', 'FT', 'Fruta fresca de clima templado, rica en antioxidantes'),
('PRD00002', 'Uva de mesa', 'FT', 'Fruta fresca de clima templado, usada en mesas y consumo directo'),
('PRD00003', 'Espárrago', 'HT', 'Hortaliza fresca exportada, utilizada principalmente en la gastronomía'),
('PRD00004', 'Palto', 'FM', 'Fruta fresca de clima mediterráneo, conocida por su sabor cremoso'),
('PRD00005', 'Limón', 'TR', 'Fruta fresca de clima tropical, usada para jugos y aderezos'),
('PRD00006', 'Mandarina', 'FT', 'Fruta fresca de clima templado, fácil de pelar y consumir'),
('PRD00007', 'Fresa', 'FT', 'Fruta fresca de clima templado, muy popular en postres y jugos'),
('PRD00008', 'Mango', 'TR', 'Fruta fresca de clima tropical, dulce y jugosa'),
('PRD00009', 'Granada', 'FT', 'Fruta fresca de clima templado, rica en antioxidantes'),
('PRD00010', 'Kiwi', 'FT', 'Fruta fresca de clima templado, con un sabor ácido y dulce'),
('PRD00011', 'Cereza', 'FT', 'Fruta fresca de clima templado, dulce y pequeña'),
('PRD00012', 'Tomate', 'HT', 'Hortaliza fresca utilizada en ensaladas y salsas'),
('PRD00013', 'Palta Hass', 'FM', 'Variedad de palto con sabor más intenso y textura cremosa'),
('PRD00014', 'Piña', 'TR', 'Fruta fresca de clima tropical, dulce y jugosa'),
('PRD00015', 'Naranja', 'FT', 'Fruta fresca de clima templado, usada para jugos y consumo directo'),
('PRD00016', 'Espinaca', 'HT', 'Hortaliza fresca, rica en hierro y usada en ensaladas'),
('PRD00017', 'Limón Sutil', 'TR', 'Variedad de limón de sabor más suave, usado en gastronomía'),
('PRD00018', 'Frambuesa', 'FT', 'Fruta fresca de clima templado, utilizada en postres y mermeladas'),
('PRD00019', 'Zapallo italiano', 'HT', 'Hortaliza fresca, común en guisos y sopas'),
('PRD00020', 'Mandarina Clementina', 'FT', 'Variedad de mandarina fácil de pelar y con sabor dulce');



INSERT INTO Lote (cod_lote, id_tipo_lote, cantidad_total, unidad, fecha_vencimiento, id_estado_lote, fecha_produccion, id_producto) VALUES
('LOT00001', 1, 500.0, 'kg', '2025-12-31', 'OK', '2024-01-15', 'PRD00001'),
('LOT00002', 1, 10000.0, 'unidades', '2026-06-30', 'OK', '2024-02-20', 'PRD00002'),
('LOT00003', 5, 700.0, 'kg', '2025-10-15', 'OK', '2024-03-05', 'PRD00003'),
('LOT00004', 1, 8000.0, 'unidades', '2025-08-20', 'OK', '2024-03-12', 'PRD00004'),
('LOT00005', 2, 600.0, 'kg', '2026-01-30', 'OK', '2024-04-01', 'PRD00005'),
('LOT00006', 3, 9000.0, 'unidades', '2025-11-22', 'OK', '2024-04-10', 'PRD00006'),
('LOT00007', 2, 450.0, 'kg', '2025-07-05', 'OK', '2024-04-20', 'PRD00007'),
('LOT00008', 5, 300.0, 'unidades', '2026-03-10', 'OK', '2024-04-28', 'PRD00008'),
('LOT00009', 2, 250.0, 'kg', '2025-09-25', 'OK', '2024-05-04', 'PRD00009'),
('LOT00010', 4, 5000.0, 'unidades', '2026-02-14', 'OK', '2024-05-12', 'PRD00010'),
('LOT00011', 5, 300.0, 'kg', '2025-10-21', 'OK', '2024-03-15', 'PRD00001'),
('LOT00012', 4, 700.0, 'unidades', '2026-08-30', 'OK', '2024-04-21', 'PRD00002'),
('LOT00013', 1, 500.0, 'kg', '2025-11-25', 'OK', '2024-04-15', 'PRD00003'),
('LOT00014', 4, 5000.0, 'unidades', '2025-09-23', 'OK', '2024-05-12', 'PRD00004'),
('LOT00015', 4, 700.0, 'kg', '2024-05-25', 'OK', '2024-04-02', 'PRD00005'),
('LOT00016', 5, 4000.0, 'unidades', '2025-09-22', 'OK', '2024-03-14', 'PRD00006'),
('LOT00017', 1, 350.0, 'kg', '2025-06-15', 'OK', '2024-03-22', 'PRD00007'),
('LOT00018', 5, 600.0, 'unidades', '2026-05-12', 'OK', '2024-05-28', 'PRD00008'),
('LOT00019', 1, 750.0, 'kg', '2025-09-25', 'OK', '2024-05-04', 'PRD00009'),
('LOT00020', 1, 3000.0, 'unidades', '2026-01-24', 'OK', '2024-04-13', 'PRD00010');




INSERT INTO Ubicacion_Almacen (cod_ubicacion_almacen, tipo_area, peso_maximo, volumen_maximo) VALUES
('UBC00001', 'Fruta clima templado', 20000, 150),
('UBC00002', 'Fruta clima templado', 20000, 150),
('UBC00003', 'Fruta clima templado', 20000, 150),
('UBC00004', 'Fruta clima mediterraneo', 20000, 150),
('UBC00005', 'Fruta clima mediterraneo', 20000, 150),
('UBC00006', 'Fruta clima mediterraneo', 20000, 150),
('UBC00007', 'Fruta clima mediterraneo', 20000, 150),
('UBC00008', 'Fruta clima tropical', 20000, 150),
('UBC00009', 'Fruta clima tropical', 20000, 150),
('UBC00010', 'Fruta clima tropical', 20000, 150),
('UBC00011', 'Fruta clima tropical', 20000, 150),
('UBC00012', 'Hortaliza', 20000, 150),
('UBC00013', 'Hortaliza', 20000, 150),
('UBC00014', 'Hortaliza', 20000, 150),
('UBC00015', 'Hortaliza', 20000, 150),
('UBC00016', 'Hortaliza', 20000, 150),
('UBC00017', 'Fruta clima templado', 20000, 150),
('UBC00018', 'Fruta clima templado', 20000, 150),
('UBC00019', 'Fruta clima mediterraneo', 20000, 150),
('UBC00020', 'Fruta clima tropical', 20000, 150);

INSERT INTO Ubicacion_Lote (id_ubicacion_almacen, id_lote) VALUES
-- Arándanos (Fruta clima templado)
(1, 1),
(2, 11),
-- Uvas (Fruta clima mediterráneo)
(4, 2),
(5, 12),
-- Espárragos (Hortaliza)
(12, 3),
(13, 13),
-- Paltos (Fruta clima mediterráneo)
(6, 4),
(7, 14),
-- Limones (Fruta clima tropical)
(8, 5),
(9, 15),
-- Clementinas (Fruta clima tropical)
(10, 6),
(11, 16),
-- Fresas (Fruta clima templado)
(3, 7),
(17, 17),
-- Frambuesas (Fruta clima templado)
(18, 8),
(18, 18),
-- Mangos (Fruta clima tropical)
(9, 9),
(20, 19),
-- Peras (Fruta clima mediterráneo)
(19, 10),
(19, 20);



INSERT INTO Stock (cod_stock, stock_minimo, stock_maximo, id_producto) VALUES
('STK00001', 100, 100000, 'PRD00001'),  -- Arándano (FT)
('STK00002', 200, 150000, 'PRD00002'),  -- Uva de mesa (FT)
('STK00003', 150, 120000, 'PRD00003'),  -- Espárrago (HT)
('STK00004', 250, 180000, 'PRD00004'),  -- Palto (FM)
('STK00005', 300, 200000, 'PRD00005'),  -- Limón (TR)
('STK00006', 180, 130000, 'PRD00006'),  -- Mandarina (FT)
('STK00007', 160, 110000, 'PRD00007'),  -- Fresa (FT)
('STK00008', 280, 210000, 'PRD00008'),  -- Mango (TR)
('STK00009', 140, 125000, 'PRD00009'),  -- Granada (FT)
('STK00010', 120, 115000, 'PRD00010'),  -- Kiwi (FT)
('STK00011', 130, 105000, 'PRD00011'),  -- Cereza (FT)
('STK00012', 150, 100000, 'PRD00012'),  -- Tomate (HT)
('STK00013', 220, 190000, 'PRD00013'),  -- Palta Hass (FM)
('STK00014', 260, 200000, 'PRD00014'),  -- Piña (TR)
('STK00015', 170, 110000, 'PRD00015'),  -- Naranja (FT)
('STK00016', 140, 95000,  'PRD00016'),  -- Espinaca (HT)
('STK00017', 300, 220000, 'PRD00017'),  -- Limón Sutil (TR)
('STK00018', 125, 98000,  'PRD00018'),  -- Frambuesa (FT)
('STK00019', 130, 90000,  'PRD00019'),  -- Zapallo italiano (HT)
('STK00020', 160, 110000, 'PRD00020');  -- Mandarina Clementina (FT)




INSERT INTO Reporte_inventario (cod_reporte_inventario, fecha_inventario, ID_PLANIFICACIONES_ASIGNACION, ID_PROG_MANTENIMIENTOS)
VALUES
('RI000001', '2023-06-01', 1, 1),
('RI000002', '2023-06-10', 2, 2),
('RI000003', '2023-07-20', 3, 3),
('RI000004', '2023-08-12', 4, 3),
('RI000005', '2023-09-05', 5, 3),
('RI000006', '2023-09-10', 6, 1),
('RI000007', '2023-08-25', 6, 1),
('RI000008', '2023-09-12', 7, 4),
('RI000009', '2023-08-30', 7, 4),
('RI000010', '2023-09-15', 8, 4),
('RI000011', '2023-09-18', 9, 2),
('RI000012', '2023-09-20', 10, 2),
('RI000013', '2023-09-22', 11, 2),
('RI000014', '2023-09-24', 12, 3),
('RI000015', '2023-09-26', 13, 3),
('RI000016', '2023-09-28', 14, 3),
('RI000017', '2023-09-30', 15, 4),
('RI000018', '2023-10-02', 16, 4),
('RI000019', '2023-10-04', 17, 1),
('RI000020', '2023-10-06', 18, 1);


INSERT INTO Reporte_inventario_detalle (id_reporte_inventario, id_lote, cantidad_esperada, cantidad_real, observacion) VALUES
(1, 1, 500.0, 495.0, 'Diferencia mínima por manipulación'),
(1, 2, 10000.0, 10000.0, NULL),
(2, 3, 700.0, 700.0, NULL),
(2, 4, 8000.0, 7990.0, 'Faltaron 10 unidades'),
(3, 5, 600.0, 600.0, NULL),
(3, 6, 9000.0, 9005.0, 'Stock extra detectado'),
(4, 7, 450.0, 450.0, NULL),
(4, 8, 300.0, 295.0, 'Diferencia mínima'),
(5, 9, 250.0, 260.0, 'Exceso de stock'),
(5, 10, 5000.0, 5000.0, NULL),
(6, 11, 300.0, 300.0, NULL),
(6, 12, 700.0, 695.0, 'Pequeña diferencia detectada'),
(7, 13, 500.0, 500.0, NULL),
(7, 14, 5000.0, 4990.0, 'Faltaron 10 unidades'),
(8, 15, 700.0, 705.0, 'Stock adicional encontrado'),
(8, 16, 4000.0, 3995.0, 'Diferencia mínima'),
(9, 17, 350.0, 350.0, NULL),
(9, 18, 600.0, 610.0, 'Exceso de stock'),
(10, 19, 750.0, 745.0, 'Diferencia mínima'),
(10, 20, 3000.0, 3000.0, NULL);



INSERT INTO REPORTE_EQUIPOS (
  COD_REPORTE_EQUIPOS, ID_EQUIPOS, ID_PLANIFICACIONES_ASIGNACION, ID_PROG_MANTENIMIENTOS
) VALUES
('RE00001', 1, 1, 1),
('RE00002', 2, 2, 2),
('RE00003', 3, 3, 3),
('RE00004', 4, 4, 4),
('RE00005', 5, 5, 5),
('RE00006', 6, 6, 6),
('RE00007', 7, 7, 7),
('RE00008', 8, 8, 8),
('RE00009', 9, 9, 9),
('RE00010', 10, 10, 10),
('RE00011', 11, 11, 11),
('RE00012', 12, 12, 12),
('RE00013', 13, 13, 13),
('RE00014', 14, 14, 14),
('RE00015', 15, 15, 15),
('RE00016', 16, 16, 16),
('RE00017', 17, 17, 17),
('RE00018', 18, 18, 18),
('RE00019', 19, 19, 19),
('RE00020', 20, 20, 20),
('RE00021', 21, 21, 21),
('RE00022', 22, 22, 22),
('RE00023', 23, 23, 23),
('RE00024', 24, 24, 24),
('RE00025', 25, 25, 25),
('RE00026', 26, 26, 26),
('RE00027', 27, 27, 27),
('RE00028', 28, 28, 28),
('RE00029', 29, 29, 29),
('RE00030', 30, 30, 30),
('RE00031', 31, 31, 31),
('RE00032', 32, 32, 32),
('RE00033', 33, 33, 33),
('RE00034', 34, 34, 34),
('RE00035', 35, 35, 35),
('RE00036', 36, 36, 36),
('RE00037', 37, 37, 37),
('RE00038', 38, 38, 38),
('RE00039', 39, 39, 39),
('RE00040', 40, 40, 40);


INSERT INTO Mantenimiento_detalle (
  COD_Mantenimiento_detalle, Detalle_mantenimiento_realizado,
  ID_Estado_Mantenimiento_Operacion, ID_PROG_MANTENIMIENTOS
) VALUES
('MD00001', 'Cambio de filtro de aire', 'COM', 1),
('MD00002', 'Revisión y ajuste de motor', 'PEN', 2),
('MD00003', 'Lubricación de piezas móviles', 'COM', 3),
('MD00004', 'Inspección de sistema eléctrico', 'ENP', 4),
('MD00005', 'Reemplazo de correas', 'COM', 5),
('MD00006', 'Calibración de sensores', 'PEN', 6),
('MD00007', 'Limpieza de cámara frigorífica', 'COM', 7),
('MD00008', 'Prueba de funcionamiento', 'COM', 8),
('MD00009', 'Cambio de aceite hidráulico', 'ENP', 9),
('MD00010', 'Revisión de sistema de enfriamiento', 'COM', 10),
('MD00011', 'Ajuste de válvulas', 'PEN', 11),
('MD00012', 'Sustitución de piezas desgastadas', 'COM', 12),
('MD00013', 'Verificación de seguridad', 'COM', 13),
('MD00014', 'Reparación de fugas', 'ENP', 14),
('MD00015', 'Actualización de software', 'COM', 15),
('MD00016', 'Revisión general de equipo', 'PEN', 16),
('MD00017', 'Cambio de filtros de aire', 'COM', 17),
('MD00018', 'Lubricación y limpieza', 'COM', 18),
('MD00019', 'Ajuste de motores', 'ENP', 19),
('MD00020', 'Prueba de calibración', 'COM', 20),
('MD00021', 'Reemplazo de componentes eléctricos', 'PEN', 21),
('MD00022', 'Verificación de presión hidráulica', 'COM', 22),
('MD00023', 'Limpieza profunda', 'COM', 23),
('MD00024', 'Revisión de sistema de control', 'ENP', 24),
('MD00025', 'Cambio de piezas mecánicas', 'COM', 25),
('MD00026', 'Ajuste y calibración', 'PEN', 26),
('MD00027', 'Inspección técnica', 'COM', 27),
('MD00028', 'Reparación de sistemas', 'COM', 28),
('MD00029', 'Revisión de seguridad eléctrica', 'ENP', 29),
('MD00030', 'Limpieza y lubricación', 'COM', 30),
('MD00031', 'Cambio de aceite', 'PEN', 31),
('MD00032', 'Prueba de rendimiento', 'COM', 32),
('MD00033', 'Revisión de sensores', 'COM', 33),
('MD00034', 'Reparación de componentes', 'ENP', 34),
('MD00035', 'Calibración final', 'COM', 35),
('MD00036', 'Sustitución de piezas', 'PEN', 36),
('MD00037', 'Inspección de motor', 'COM', 37),
('MD00038', 'Prueba de funcionamiento general', 'COM', 38),
('MD00039', 'Limpieza de sistema hidráulico', 'ENP', 39),
('MD00040', 'Revisión y ajuste final', 'COM', 40);


-- Recepcion
INSERT INTO Recepcion (cod_recepcion, fecha_registro, cantidad_recibida, observaciones, id_estado_recepcion, id_lote) VALUES
('REC00001', '2024-01-20', 500.0, NULL, 'A', 1),
('REC00002', '2024-02-25', 10000.0, 'Frutas con daños visibles en algunas cajas', 'O', 2),
('REC00003', '2024-03-08', 700.0, NULL, 'A', 3),
('REC00004', '2024-03-15', 8000.0, NULL, 'A', 4),
('REC00005', '2024-04-05', 600.0, 'Se detectó madurez avanzada en parte del lote', 'O', 5),
('REC00006', '2024-04-12', 9000.0, NULL, 'A', 6),
('REC00007', '2024-04-22', 450.0, NULL, 'A', 7),
('REC00008', '2024-04-30', 300.0, 'Faltan 50 kg respecto al parte de producción', 'O', 8),
('REC00009', '2024-05-06', 250.0, NULL, 'A', 9),
('REC00010', '2024-05-14', 5000.0, NULL, 'A', 10),
('REC00011', '2024-05-16', 1200.0, NULL, 'A', 11),
('REC00012', '2024-05-18', 330.0, NULL, 'A', 12),
('REC00013', '2024-05-20', 750.0, NULL, 'A', 13),
('REC00014', '2024-05-22', 6400.0, NULL, 'A', 14),
('REC00015', '2024-05-23', 410.0, 'Envase inadecuado para transporte de fruta', 'O', 15),
('REC00016', '2024-05-24', 520.0, NULL, 'A', 16),
('REC00017', '2024-05-25', 9700.0, NULL, 'A', 17),
('REC00018', '2024-05-26', 860.0, NULL, 'A', 18),
('REC00019', '2024-05-27', 340.0, NULL, 'A', 19),
('REC00020', '2024-05-27', 10500.0, NULL, 'A', 20);

-- Control_de_calidad
INSERT INTO Control_de_calidad (cod_control_calidad, fecha_inspeccion, id_estado_paquete_recepcion, temperatura_producto, observaciones_lote, observaciones_empaque, id_estado_control_calidad, id_recepcion, id_empleado) VALUES
('QC000001', '2024-01-21', 'OKPR', 22.5, 'Sin observaciones', 'Empaque intacto', 'A', 1, 1),
('QC000002', '2024-02-26', 'OBS', 23.0, 'Defecto menor', 'Empaque rasgado', 'O', 2, 2),
('QC000003', '2024-03-09', 'OKPR', 21.8, 'Sin observaciones', 'Empaque correcto', 'A', 3, 3),
('QC000004', '2024-03-16', 'OKPR', 22.0, 'Sin observaciones', 'Empaque correcto', 'A', 4, 4),
('QC000005', '2024-04-06', 'OBS', 24.5, 'Ligera oxidación', 'Caja dañada', 'O', 5, 5),
('QC000006', '2024-04-13', 'OKPR', 22.3, 'Sin observaciones', 'Empaque correcto', 'A', 6, 6),
('QC000007', '2024-04-23', 'OKPR', 21.5, 'Sin observaciones', 'Empaque correcto', 'A', 7, 7),
('QC000008', '2024-05-01', 'OBS', 23.7, 'Golpes leves', 'Caja sucia', 'O', 8, 8),
('QC000009', '2024-05-07', 'OKPR', 22.1, 'Sin observaciones', 'Empaque correcto', 'A', 9, 9),
('QC000010', '2024-05-15', 'OKPR', 22.0, 'Sin observaciones', 'Empaque correcto', 'A', 10, 10),
('QC000011', '2024-05-17', 'OKPR', 22.4, 'Sin observaciones', 'Empaque correcto', 'A', 11, 11),
('QC000012', '2024-05-18', 'OKPR', 22.1, 'Sin observaciones', 'Empaque correcto', 'A', 12, 12),
('QC000013', '2024-05-20', 'OKPR', 21.9, 'Sin observaciones', 'Empaque correcto', 'A', 13, 13),
('QC000014', '2024-05-22', 'OKPR', 22.6, 'Sin observaciones', 'Empaque correcto', 'A', 14, 14),
('QC000015', '2024-05-23', 'OBS', 23.3, 'Partículas extrañas', 'Empaque dañado', 'O', 15, 15),
('QC000016', '2024-05-24', 'OKPR', 21.7, 'Sin observaciones', 'Empaque correcto', 'A', 16, 16),
('QC000017', '2024-05-25', 'OKPR', 22.2, 'Sin observaciones', 'Empaque correcto', 'A', 17, 17),
('QC000018', '2024-05-26', 'OKPR', 21.9, 'Sin observaciones', 'Empaque correcto', 'A', 18, 18),
('QC000019', '2024-05-27', 'OKPR', 21.6, 'Sin observaciones', 'Empaque correcto', 'A', 19, 19),
('QC000020', '2024-05-27', 'OKPR', 22.0, 'Sin observaciones', 'Empaque correcto', 'A', 20, 20);



-- Reporte_producto_observado
INSERT INTO Reporte_producto_observado ( fecha_registro, especificacion_no_cumplida, acciones_a_tomar, id_control_de_calidad) VALUES
( '2024-02-27', 'Temperatura fuera de rango', 'Rechazar producto', 2),
( '2024-04-07', 'No llego la mismoa cantidad', 'Rechazar producto', 5),
( '2024-05-02', 'Golpes en fruta', 'Rechazar producto dañado', 8),
( '2024-05-02', 'Fruta en mal estado', 'Rechazar producto dañado', 15);

INSERT INTO Movimiento_inventario
(cod_movimiento_inventario, id_tipo_movimiento, motivo, cantidad, fecha_movimiento, id_lote, id_producto, id_reporte_inventario, id_empleado, origen, destino)
VALUES
('MOV00001', 'E', 'Recepción de lote desde campo', 500, '2023-06-01 08:00:00', 1, 'PRD00001', 1, 1, 'Campo', 'Almacén Fruta templada'),
('MOV00002', 'S', 'Despacho a cliente mayorista', 200, '2023-06-02 10:30:00', 1, 'PRD00001', 1, 2, 'Almacén Fruta templada', 'Cliente A'),
('MOV00003', 'E', 'Ingreso lote de uvas', 10000, '2023-06-05 09:15:00', 2, 'PRD00002', 2, 3, 'Campo', 'Almacén Fruta templada'),
('MOV00004', 'S', 'Salida lote para procesamiento', 3000, '2023-06-07 14:00:00', 2, 'PRD00002', 2, 4, 'Almacén Fruta templada', 'Planta de procesado'),
('MOV00005', 'E', 'Recepción espárragos frescos', 700, '2023-06-10 07:45:00', 3, 'PRD00003', 3, 5, 'Campo', 'Almacén Hortalizas'),
('MOV00006', 'S', 'Despacho a supermercado', 400, '2023-06-11 11:00:00', 3, 'PRD00003', 3, 1, 'Almacén Hortalizas', 'Supermercado X'),
('MOV00007', 'E', 'Ingreso palto variedad Hass', 8000, '2023-06-12 08:30:00', 4, 'PRD00004', 4, 2, 'Campo', 'Almacén Fruta mediterránea'),
('MOV00008', 'S', 'Salida para exportación', 5000, '2023-06-15 16:00:00', 4, 'PRD00004', 4, 3, 'Almacén Fruta mediterránea', 'Puerto'),
('MOV00009', 'E', 'Recepción limones para jugo', 600, '2023-06-17 09:00:00', 5, 'PRD00005', 5, 4, 'Campo', 'Almacén Fruta tropical'),
('MOV00010', 'S', 'Envío a planta de jugos', 550, '2023-06-18 10:30:00', 5, 'PRD00005', 5, 5, 'Almacén Fruta tropical', 'Planta de jugos'),
('MOV00011', 'E', 'Recepción de mandarina', 9000, '2023-06-20 08:00:00', 6, 'PRD00006', 6, 1, 'Campo', 'Almacén Fruta templada'),
('MOV00012', 'E', 'Recepción de fresas', 450, '2023-06-21 08:30:00', 7, 'PRD00007', 7, 2, 'Campo', 'Almacén Fruta templada'),
('MOV00013', 'E', 'Recepción de frambuesas', 300, '2023-06-22 09:00:00', 8, 'PRD00008', 8, 3, 'Campo', 'Almacén Fruta templada'),
('MOV00014', 'E', 'Recepción de mangos', 250, '2023-06-23 09:30:00', 9, 'PRD00009', 9, 4, 'Campo', 'Almacén Fruta tropical'),
('MOV00015', 'E', 'Recepción de peras', 5000, '2023-06-24 10:00:00', 10, 'PRD00010', 10, 5, 'Campo', 'Almacén Fruta mediterránea'),
('MOV00016', 'E', 'Recepción de arándanos', 300, '2023-06-25 10:30:00', 11, 'PRD00001', 11, 1, 'Campo', 'Almacén Fruta templada'),
('MOV00017', 'E', 'Recepción de uvas', 700, '2023-06-26 11:00:00', 12, 'PRD00002', 12, 2, 'Campo', 'Almacén Fruta templada'),
('MOV00018', 'E', 'Recepción de espárragos', 500, '2023-06-27 11:30:00', 13, 'PRD00003', 13, 3, 'Campo', 'Almacén Hortalizas'),
('MOV00019', 'E', 'Recepción de paltos', 5000, '2023-06-28 12:00:00', 14, 'PRD00004', 14, 4, 'Campo', 'Almacén Fruta mediterránea'),
('MOV00020', 'E', 'Recepción de limones', 700, '2023-06-29 12:30:00', 15, 'PRD00005', 15, 5, 'Campo', 'Almacén Fruta tropical'),
('MOV00021', 'E', 'Recepción de clementinas', 4000, '2023-06-30 13:00:00', 16, 'PRD00006', 16, 1, 'Campo', 'Almacén Fruta templada'),
('MOV00022', 'E', 'Recepción de fresas', 350, '2023-07-01 13:30:00', 17, 'PRD00007', 17, 2, 'Campo', 'Almacén Fruta templada'),
('MOV00023', 'E', 'Recepción de frambuesas', 600, '2023-07-02 14:00:00', 18, 'PRD00008', 18, 3, 'Campo', 'Almacén Fruta templada'),
('MOV00024', 'E', 'Recepción de mangos', 750, '2023-07-03 14:30:00', 19, 'PRD00009', 19, 4, 'Campo', 'Almacén Fruta tropical'),
('MOV00025', 'E', 'Recepción de peras', 3000, '2023-07-04 15:00:00', 20, 'PRD00010', 20, 5, 'Campo', 'Almacén Fruta mediterránea');

INSERT INTO Alerta_inventario
(cod_alerta_inventario, estado_alerta, tipo_alerta, severidad, descripcion, fecha_hora_alerta, fecha_hora_solucion, id_lote, id_reporte_inventario, id_empleado_responsable)
VALUES
('ALRT0001', 'Pendiente', 'Vencimiento', 'Alta', 'Lote LOT00005 próximo a vencer en menos de 15 días', '2025-05-10 09:00:00', NULL, 5, 5, 2),
('ALRT0002', 'Solucionada', 'Stock bajo', 'Media', 'Stock por debajo del mínimo en lote LOT00011', '2025-04-20 14:30:00', '2025-04-22 10:00:00', 11, 11, 3),
('ALRT0003', 'Pendiente', 'Vencimiento', 'Alta', 'Lote LOT00019 con fecha de vencimiento cercana', '2025-05-15 08:15:00', NULL, 19, 19, 1),
('ALRT0004', 'Pendiente', 'Stock bajo', 'Alta', 'Cantidad disponible menor al stock mínimo en lote LOT00007', '2025-05-08 16:45:00', NULL, 7, 7, 4),
('ALRT0005', 'Solucionada', 'Vencimiento', 'Baja', 'Alerta de vencimiento solucionada para lote LOT00003', '2025-04-10 11:00:00', '2025-04-12 09:30:00', 3, 3, 5),
('ALRT0006', 'Pendiente', 'Stock bajo', 'Media', 'Reducción de stock detectada en lote LOT00014', '2025-05-12 10:30:00', NULL, 14, 14, 2),
('ALRT0007', 'Pendiente', 'Vencimiento', 'Alta', 'Fecha de vencimiento próxima para lote LOT00001', '2025-05-20 13:00:00', NULL, 1, 1, 3),
('ALRT0008', 'Solucionada', 'Stock bajo', 'Media', 'Stock bajo reportado y corregido en lote LOT00009', '2025-04-25 15:20:00', '2025-04-26 12:00:00', 9, 9, 4),
('ALRT0009', 'Pendiente', 'Vencimiento', 'Alta', 'Alerta de vencimiento para lote LOT00017', '2025-05-18 07:45:00', NULL, 17, 17, 1),
('ALRT0010', 'Pendiente', 'Stock bajo', 'Baja', 'Alerta leve de stock bajo en lote LOT00020', '2025-05-22 09:15:00', NULL, 20, 20, 5);





INSERT INTO Vehiculo ( tipo_vehiculo, placa_vehiculo, estado_vehiculo, marca, modelo) VALUES
( 'Camión', 'ABC123', 'Activo', 'Volvo', 'FH16'),
( 'Camioneta', 'XYZ987', 'Mantenimiento', 'Toyota', 'Hilux'),
( 'Furgón', 'JKL456', 'Activo', 'Mercedes-Benz', 'Sprinter'),
( 'Tráiler', 'LMN321', 'Inactivo', 'Scania', 'R500'),
( 'Camión', 'DGH654', 'Activo', 'MAN', 'TGX'),
( 'Camioneta', 'ZXC741', 'Activo', 'Nissan', 'Frontier'),
( 'Camión', 'TRK852', 'Activo', 'Iveco', 'Stralis'),
( 'Camioneta', 'PLM369', 'Mantenimiento', 'Ford', 'Ranger'),
( 'Furgón', 'BNM753', 'Activo', 'Peugeot', 'Boxer'),
( 'Tráiler', 'HJK258', 'Inactivo', 'DAF', 'XF'),
( 'Camión', 'CVB147', 'Activo', 'Freightliner', 'Cascadia'),
( 'Camioneta', 'RTY951', 'Activo', 'Chevrolet', 'D-Max'),
( 'Furgón', 'MKO632', 'Mantenimiento', 'Citroën', 'Jumper'),
( 'Tráiler', 'WQE741', 'Activo', 'Kenworth', 'T680'),
( 'Camión', 'ASD159', 'Inactivo', 'Hino', '700'),
( 'Camioneta', 'GHJ753', 'Activo', 'Mitsubishi', 'L200');



INSERT INTO Informe_de_especificaciones (ID_informe_de_especificaciones, Longitud_contenedor, Ancho_contenedor, Altura_contenedor, Temperatura_contenedor) VALUES
('IE000001', 12.0, 2.4, 2.6, '-5°C'),
('IE000002', 6.0, 2.4, 2.5, '4°C'),
('IE000003', 13.5, 2.5, 2.7, '-10°C'),
('IE000004', 10.0,2.3, 2.4, '0°C'),
('IE000005', 8.0, 2.4, 2.5, '5°C'),
('IE000006', 14.0, 2.6, 2.8, '-15°C'),
('IE000007', 11.5, 2.4, 2.6, '2°C'),
('IE000008', 7.0, 2.2, 2.3, '3°C'),
('IE000009', 9.5, 2.3, 2.4, '-2°C'),
('IE000010', 12.5, 2.5, 2.6, '1°C');



-- Insertar datos en Cliente
INSERT INTO Cliente (cod_cliente, nombre_cliente, direccion_cliente, telefono_cliente, correo_cliente) VALUES
('CLI00001', 'Juan Pérez', 'Av. Las Américas 123, Lima', '987654321', 'juanperez@email.com'),
('CLI00002', 'María Gómez', 'Calle Los Olivos 456, Arequipa', '987654322', 'mariagomez@email.com'),
('CLI00003', 'Carlos Rodríguez', 'Av. Pardo 789, Cusco', '987654323', 'carlosrodriguez@email.com'),
('CLI00004', 'Ana Martínez', 'Calle 8 de Octubre 101, Piura', '987654324', 'anamartinez@email.com'),
('CLI00005', 'Luis Sánchez', 'Av. San Martín 200, Trujillo', '987654325', 'luissanchez@email.com'),
('CLI00006', 'Patricia Torres', 'Calle Los Cedros 303, Puno', '987654326', 'patriciatorres@email.com'),
('CLI00007', 'José Díaz', 'Calle Bolívar 404, Arequipa', '987654327', 'josediaz@email.com'),
('CLI00008', 'Laura Fernández', 'Av. Universitaria 505, Lima', '987654328', 'laurafernandez@email.com'),
('CLI00009', 'Pedro López', 'Calle Las Flores 606, Cusco', '987654329', 'pedrolopez@email.com'),
('CLI00010', 'Mariana Silva', 'Calle Los Jazmines 707, Lima', '987654330', 'marianasilva@email.com'),
('CLI00011', 'Carlos Ríos', 'Calle Los Cedros 123, Tarapoto', '987654311', 'carlos.rios@example.com'),
('CLI00012', 'Lucía Herrera', 'Av. Salaverry 456, Cajamarca', '987654312', 'lucia.herrera@example.com'),
('CLI00013', 'Fernando Meza', 'Jr. Lima 789, Tumbes', '987654313', 'fernando.meza@example.com'),
('CLI00014', 'Rosa Aguilar', 'Calle San Martín 321, Huaraz', '987654314', 'rosa.aguilar@example.com'),
('CLI00015', 'Jorge Paredes', 'Av. Arequipa 654, Moquegua', '987654315', 'jorge.paredes@example.com'),
('CLI00016', 'Mónica Torres', 'Jr. Grau 987, Tacna', '987654316', 'monica.torres@example.com'),
('CLI00017', 'Daniel Castañeda', 'Calle Bolívar 741, Iquitos', '987654317', 'daniel.castaneda@example.com'),
('CLI00018', 'Verónica Vargas', 'Av. Bolognesi 852, Ayacucho', '987654318', 'veronica.vargas@example.com'),
('CLI00019', 'Pedro Suárez', 'Jr. Huánuco 963, Chimbote', '987654319', 'pedro.suarez@example.com'),
('CLI00020', 'Ana Medina', 'Av. La Marina 159, Juliaca', '987654320', 'ana.medina@example.com');




INSERT INTO Pedido (cod_pedido, direccion_pedido, fecha_limite, destino, id_cliente) VALUES
('PED00001', 'Av. Los Frutales 123, Lima', '2025-05-10', 'Lima', 1),
('PED00002', 'Calle Primavera 456, Arequipa', '2025-05-12', 'Arequipa', 2),
('PED00003', 'Jr. Los Sauces 789, Trujillo', '2025-05-15', 'Trujillo', 3),
('PED00004', 'Av. Las Flores 321, Cusco', '2025-05-18', 'Cusco', 4),
('PED00005', 'Calle Las Gardenias 654, Chiclayo', '2025-05-20', 'Chiclayo', 5),
('PED00006', 'Av. El Sol 987, Piura', '2025-05-22', 'Piura', 6),
('PED00007', 'Calle Palma Real 741, Ica', '2025-05-25', 'Ica', 7),
('PED00008', 'Av. América Sur 852, Huancayo', '2025-05-28', 'Huancayo', 8),
('PED00009', 'Jr. Amazonas 963, Puno', '2025-05-30', 'Puno', 9),
('PED00010', 'Calle Palma Real 741, Ica', '2025-05-30', 'Ica', 7),
('PED00011', 'Calle Los Cedros 123, Tarapoto', '2025-06-01', 'Tarapoto', 11),
('PED00012', 'Av. Salaverry 456, Cajamarca', '2025-06-03', 'Cajamarca', 12),
('PED00013', 'Jr. Lima 789, Tumbes', '2025-06-05', 'Tumbes', 13),
('PED00014', 'Calle San Martín 321, Huaraz', '2025-06-07', 'Huaraz', 14),
('PED00015', 'Av. Arequipa 654, Moquegua', '2025-06-09', 'Moquegua', 15),
('PED00016', 'Jr. Grau 987, Tacna', '2025-06-11', 'Tacna', 16),
('PED00017', 'Calle Bolívar 741, Iquitos', '2025-06-13', 'Iquitos', 17),
('PED00018', 'Av. Bolognesi 852, Ayacucho', '2025-06-15', 'Ayacucho', 18),
('PED00019', 'Jr. Huánuco 963, Chimbote', '2025-06-17', 'Chimbote', 19),
('PED00020', 'Av. La Marina 159, Juliaca', '2025-06-19', 'Juliaca', 20);



INSERT INTO Guia_de_Remision (
    cod_guia_remision, fecha_emision, fecha_de_traslado, 
    id_vehiculo, ID_Informe_de_especificaciones, id_transportista, 
    id_pedido, id_empleado
) VALUES 
('GR000001', '2025-05-01', '2025-05-02', 1, 'IE000001', 11, 1, 1),
('GR000002', '2025-05-03', '2025-05-04', 1, 'IE000002',11, 2, 1),
('GR000003', '2025-05-05', '2025-05-05', 1, 'IE000003', 11, 3, 1),
('GR000004', '2025-05-06', '2025-05-07', 2, 'IE000004', 12, 4, 4),
('GR000005', '2025-05-07', '2025-05-08', 3, 'IE000005', 13, 5, 5),
('GR000006', '2025-05-08', '2025-05-09', 3, 'IE000006', 13, 6, 6),
('GR000007', '2025-05-09', '2025-05-10', 4, 'IE000007', 14, 7, 7),
('GR000008', '2025-05-10', '2025-05-11', 5, 'IE000008', 15, 8, 8),
('GR000009', '2025-05-11', '2025-05-12', 5, 'IE000009', 15, 9, 9),
('GR000010', '2025-05-12', '2025-05-13', 6, 'IE000010', 16, 10, 10), 
('GR000011', '2025-05-27', '2025-05-28', 7, 'IE000001', 20, 11, 10),
('GR000012', '2025-05-30', '2025-05-31', 7, 'IE000002', 20, 12, 10),
('GR000013', '2025-06-01', '2025-06-02', 8, 'IE000003', 21, 13, 5),
('GR000014', '2025-06-02', '2025-06-03', 8, 'IE000004', 21, 14, 6),
('GR000015', '2025-06-04', '2025-06-05', 9, 'IE000005', 22, 15, 4),
('GR000016', '2025-06-06', '2025-06-07', 10, 'IE000006', 23, 16, 8),
('GR000017', '2025-06-08', '2025-06-09', 10, 'IE000007', 23, 17, 9),
('GR000018', '2025-06-10', '2025-06-11', 11, 'IE000008', 24, 18, 10),
('GR000019', '2025-06-12', '2025-06-13', 11, 'IE000009', 24, 19, 4),
('GR000020', '2025-06-12', '2025-06-13', 11, 'IE000009', 24, 20, 4);



INSERT INTO Orden_Transporte (
     cod_orden_transporte,
    id_empleado,
    fecha_registro,
    fecha_finalizado,
    id_estado_orden,
    fecha_salida,
    hora_salida
) VALUES 
('OT000001', 2, '2025-05-05', NULL , 'P',  '2025-05-05', '12:30'),
('OT000002', 2, '2025-05-07', NULL, 'P',  '2025-05-07', '12:30'),
('OT000003', 3, '2025-05-09', NULL, 'P',  '2025-05-09', '12:30'),
('OT000004',4, '2025-05-10', NULL, 'P',  '2025-05-10', '12:30'),
('OT000005', 5, '2025-05-12', NULL, 'P', '2025-05-12', '12:30'),
('OT000006', 6, '2025-05-13', NULL, 'P',  '2025-05-13', '12:30'),
('OT000007', 4, '2025-05-28', NULL, 'P', '2025-05-28', '12:30'),
('OT000008', 3, '2025-06-02', NULL, 'P', '2025-06-02', '12:30'),
('OT000009', 4, '2025-06-05', NULL, 'P', '2025-06-05', '12:30'),
('OT000010', 8, '2025-06-07', NULL, 'P', '2025-06-07', '12:30'),
('OT000011', 8, '2025-06-11', NULL, 'P', '2025-06-11', '12:30');


INSERT INTO Guia_X_Orden_Transporte (
     id_orden_transporte,
    id_guia_remision
) VALUES 
( 1, 1),
( 1, 2),
( 1, 3),
( 2, 4),
( 3, 5),
( 3, 6),
(4, 7),
( 5,8),
( 5,9),
( 6, 10),
(7,11),
(7,12),
(8,13),
(8,14),
(9,15),
(10,16),
(10,17),
(11,18),
(11,19),
(11,20);

INSERT INTO Seguimiento (
    fecha_registro,
    hora_registro,
    descripcion, 
    id_estado_seguimiento,
    id_orden_transporte
) VALUES 
('2025-05-05', '13:00', 'Base Lima', 'P', 1),
('2025-05-06', '09:00', 'Ica', 'T', 1),
('2025-05-07', '11:00', 'Trujillo', 'E', 1),
('2025-05-07', '13:00', 'Base Lima', 'P', 2),
('2025-05-08', '08:30', 'Ayacucho', 'T', 2),
('2025-05-09', '10:00', 'Cusco', 'E', 2),
('2025-05-09', '13:00', 'Base Lima', 'P', 3),
('2025-05-10', '10:00', 'Chiclayo', 'T', 3),
('2025-05-11', '15:00', 'Piura', 'E', 3),
('2025-05-10', '13:00', 'Base Lima', 'P', 4),
('2025-05-10', '18:00', 'Chincha', 'T', 4),
('2025-05-11', '09:00', 'Ica', 'E', 4),
('2025-05-12', '13:00', 'Base Lima', 'P', 5),
('2025-05-13', '09:00', 'Huancayo', 'T', 5),
('2025-05-14', '15:00', 'Puno', 'E', 5),
('2025-05-13', '13:00', 'Base Lima', 'P', 6),
('2025-05-13', '18:00', 'Pisco', 'T', 6),
('2025-05-14', '09:30', 'Ica', 'E', 6),
('2025-05-28', '13:00', 'Base Lima', 'P', 7),
('2025-05-29', '09:00', 'La Oroya', 'T', 7),
('2025-05-30', '17:00', 'Cajamarca', 'P', 7),
('2025-06-02', '13:00', 'Base Lima', 'P', 8),
('2025-06-03', '10:00', 'Chiclayo', 'T', 8),
('2025-06-04', '12:00', 'Tumbes', 'T', 8),
('2025-06-05', '13:00', 'Base Lima', 'P', 9),
('2025-06-06', '14:00', 'Arequipa', 'T', 9),
('2025-06-07', '13:00', 'Base Lima', 'P', 10),
('2025-06-08', '11:00', 'Moquegua', 'T', 10),
('2025-06-09', '16:00', 'Tacna', 'T', 10),
('2025-06-11', '13:00', 'Base Lima', 'P', 11),
('2025-06-12', '08:00', 'Huancavelica', 'T', 11),
('2025-06-13', '16:00', 'Ayacucho', 'T', 11);


INSERT INTO Informe_Entrega (
    fecha_entrega,
    hora_entrega,
    nombre_receptor,
    dni_receptor,
    observacion,
    id_guia_remision
) VALUES 
('2025-05-07', '16:30', 'Juan Pérez', '45678901', 'Entregado sin observaciones', 1),
('2025-05-08', '10:15', 'María Díaz', '47654321', 'Revisado y conforme', 2),
('2025-05-05', '17:45', 'Carlos Ramírez', '49673210', 'Entregado con paquete adicional', 3),
('2025-05-09', '11:20', 'Lucía Rojas', '41234567', 'Destinatario no firmó, testigo presente', 4),
('2025-05-08', '15:00', 'Pedro Gutiérrez', '42678954', 'Entregado a seguridad', 5),
('2025-05-09', '17:00', 'Claudia Salas', '45612378', 'Receptor indicó daño menor en embalaje', 6),
('2025-05-10', '10:15', 'Jorge Linares', '44111222', 'Entregado correctamente', 7),
('2025-05-11', '13:00', 'Marta Chumpitaz', '44556677', 'Conforme', 8),
('2025-05-12', '14:20', 'Carlos Silva', '43219876', 'Receptor tardó en recibir, pero conforme', 9),
('2025-05-13', '11:45', 'Elena Gómez', '42345678', 'Sin novedades', 10);


INSERT INTO Reporte_Incidentes_Entrega (
    id_estado_reporte ,
    descripcion ,
    id_tipo_incidente ,
    fecha_registro,
    hora_registro,
    id_cliente ,
	nombre_realiza,
	dni_realiza,
    id_informe_entrega ,
    id_empleado)
VALUES 
('R', 'Cliente reporta daño visible en una de las cajas del paquete. Se solicitó evidencia fotográfica.', 1, 
 '2025-05-10', '09:15', 6,'Patricia Torres','84657898', 6, 6),
('R', 'Producto llegó con más de 6 horas de retraso respecto al horario pactado.', 2, 
 '2025-05-12', '16:00', 9,'Pedro López','54867898', 9, 9),
('R', 'El cliente indica que falta un componente del pedido. Se está coordinando con el almacén.', 3, 
 '2025-05-08', '12:45', 2,'María Gómez','84213258', 2, 2);





INSERT INTO Empaque (cod_empaque, nombre, id_tipo_empaque, descripcion, capacidad_maxima, ID_Lote) VALUES
('EMA00001', 'Parihuela', 'P', 'Parihuela especial para arándano', 500.0, 1),
('EMA00002', 'Caja', 'C', 'Caja resistente para transporte de uvas', 1000.0, 2),
('EMA00003', 'Saco', 'S', 'Saco ventilado para espárragos', 600.0, 3),
('EMA00004', 'Caja', 'C', 'Caja plástica de palto', 800.0, 4),
('EMA00005', 'Bolsa', 'B', 'Bolsa reforzada para limones', 500.0, 5),
('EMA00006', 'Malla', 'M', 'Malla para mandarinas frescas', 900.0, 6),
('EMA00007', 'Caja', 'C', 'Caja pequeña para fresas', 450.0, 7),
('EMA00008', 'Saco', 'S', 'Saco de malla para frambuesas', 300.0, 8),
('EMA00009', 'Caja', 'C', 'Caja rígida para mangos', 250.0, 9),
('EMA00010', 'Caja', 'C', 'Caja estándar para peras', 5000.0, 10),
('EMA00011', 'Saco', 'S', 'Saco ventilado para arándano', 500.0, 11),
('EMA00012', 'Bolsa', 'B', 'Bolsa resistente para transporte de uvas', 1000.0, 12),
('EMA00013', 'Malla', 'M', 'Malla ventilada para espárragos', 600.0, 13),
('EMA00014', 'Caja', 'C', 'Caja especial para palto', 800.0, 14),
('EMA00015', 'Parihuela', 'P', 'Parihuela reforzada para limones', 500.0, 15),
('EMA00016', 'Caja', 'C', 'Caja para mandarinas frescas', 900.0, 16),
('EMA00017', 'Saco', 'S', 'Saco pequeño para fresas', 450.0, 17),
('EMA00018', 'Caja', 'C', 'Caja de malla para frambuesas', 300.0, 18),
('EMA00019', 'Caja', 'C', 'Caja rígida para mangos', 250.0, 19),
('EMA00020', 'Parihuela', 'P', 'Parihuela estándar para peras', 5000.0, 20);



INSERT INTO Packing (cod_packing, id_estado_packing, fecha_packing, cantidad_producto, peso_Neto, id_pedido, id_empleado, id_empaque) VALUES
('PKG00001', 'F', '2025-01-10', 200, 450.0, 1, 1, 1),
('PKG00002', 'E', '2025-01-12', 500, 980.0, 2, 2, 2),
('PKG00003', 'S', '2025-01-14', 300, 600.0, 3, 3, 3),
('PKG00004', 'F', '2025-01-16', 1000, 1600.0, 4, 4, 4),
('PKG00005', 'E', '2025-01-18', 150, 300.0, 5, 5, 5),
('PKG00006', 'S', '2025-01-20', 850, 1400.0, 6, 6, 6),
('PKG00007', 'F', '2025-01-22', 200, 450.0, 7, 7, 7),
('PKG00008', 'E', '2025-01-24', 400, 800.0, 8, 8, 8),
('PKG00009', 'S', '2025-01-26', 600, 900.0, 9, 9, 9),
('PKG00010', 'F', '2025-01-28', 700, 1000.0, 10, 10, 10),
('PKG00011', 'E', '2025-01-30', 550, 1100.0, 11, 11, 11),
('PKG00012', 'S', '2025-02-01', 320, 640.0, 12, 12, 12),
('PKG00013', 'F', '2025-02-03', 450, 900.0, 13, 13, 13),
('PKG00014', 'E', '2025-02-05', 700, 1350.0, 14, 14, 14),
('PKG00015', 'S', '2025-02-07', 600, 1150.0, 15, 15, 15),
('PKG00016', 'F', '2025-02-09', 800, 1600.0, 16, 16, 16),
('PKG00017', 'E', '2025-02-11', 300, 620.0, 17, 17, 17),
('PKG00018', 'S', '2025-02-13', 400, 750.0, 18, 18, 18),
('PKG00019', 'F', '2025-02-15', 900, 1700.0, 19, 19, 19),
('PKG00020', 'E', '2025-02-17', 250, 520.0, 20, 20, 20);



INSERT INTO Reporte_Packing (cod_Reporte_Packing, observaciones, fecha_reporte, id_empleado, id_packing) VALUES
('RPK00001', 'Packing completado sin incidencias', '2025-01-11', 1, 1),
('RPK00002', 'Problemas menores detectados', '2025-01-13', 2, 2),
('RPK00003', 'Faltante de material de empaque', '2025-01-15', 3, 3),
('RPK00004', 'Verificación exitosa de peso', '2025-01-17', 4, 4),
('RPK00005', 'Cancelación por problemas de calidad', '2025-01-19', 5, 5),
('RPK00006', 'Producto aprobado tras inspección', '2025-01-21', 6, 6),
('RPK00007', 'Producto rechazado, reempaque necesario', '2025-01-23', 7, 7),
('RPK00008', 'Despacho realizado correctamente', '2025-01-25', 8, 8),
('RPK00009', 'Incompleto, requiere verificación', '2025-01-27', 9, 9),
('RPK00010', 'Proceso suspendido por auditoría', '2025-01-29', 10, 10),
('RPK00011', 'Empaque con etiqueta incorrecta', '2025-01-31', 1, 11),
('RPK00012', 'Reempaque completado sin problemas', '2025-02-02', 2, 12),
('RPK00013', 'Daño detectado en caja externa', '2025-02-04', 3, 13),
('RPK00014', 'Retraso por falta de insumos', '2025-02-06', 4, 14),
('RPK00015', 'Control de calidad aprobado', '2025-02-08', 5, 15),
('RPK00016', 'Problema en el sellado detectado', '2025-02-10', 6, 16),
('RPK00017', 'Inspección final sin observaciones', '2025-02-12', 7, 17),
('RPK00018', 'Empaque incompleto, falta revisión', '2025-02-14', 8, 18),
('RPK00019', 'Reporte enviado a supervisión', '2025-02-16', 9, 19),
('RPK00020', 'Empaque listo para despacho', '2025-02-18', 10, 20);



INSERT INTO PROCESOS (cod_procesos, fecha_actualizada, hora_actualizada, tipo_proceso, estado, id_empleado, id_recepcion, id_packing, id_guia_remision, id_movimiento_inventario) VALUES
('PRC00001', '2025-04-28', '08:30:00', 'Recepción', 'Completado', 1, 1, 1, 1, 1),
('PRC00002', '2025-04-28', '09:00:00', 'Inspección', 'En Proceso', 2, 2, 2, 2, 2),
('PRC00003', '2025-04-28', '09:30:00', 'Empaque', 'Pendiente', 3, 3, 3, 3, 3),
('PRC00004', '2025-04-28', '10:00:00', 'Despacho', 'Completado', 4, 4, 4, 4, 4),
('PRC00005', '2025-04-28', '10:30:00', 'Recepción', 'Anulado', 5, 5, 5, 5, 5),
('PRC00006', '2025-04-28', '11:00:00', 'Inspección', 'Completado', 6, 6, 6, 6, 6),
('PRC00007', '2025-04-28', '11:30:00', 'Empaque', 'En Proceso', 7, 7, 7, 7, 7),
('PRC00008', '2025-04-28', '12:00:00', 'Despacho', 'Pendiente', 8, 8, 8, 8, 8),
('PRC00009', '2025-04-28', '12:30:00', 'Recepción', 'Completado', 9, 9, 9, 9, 9),
('PRC00010', '2025-04-28', '13:00:00', 'Inspección', 'Completado', 10, 10, 10, 10, 10),
('PRC00011', '2025-04-28', '13:30:00', 'Empaque', 'En Proceso', 11, 11, 11, 11, 11),
('PRC00012', '2025-04-28', '14:00:00', 'Despacho', 'Pendiente', 12, 12, 12, 12, 12),
('PRC00013', '2025-04-28', '14:30:00', 'Recepción', 'Completado', 13, 13, 13, 13, 13),
('PRC00014', '2025-04-28', '15:00:00', 'Inspección', 'Anulado', 14, 14, 14, 14, 14),
('PRC00015', '2025-04-28', '15:30:00', 'Empaque', 'Completado', 15, 15, 15, 15, 15),
('PRC00016', '2025-04-28', '16:00:00', 'Despacho', 'En Proceso', 16, 16, 16, 16, 16),
('PRC00017', '2025-04-28', '16:30:00', 'Recepción', 'Pendiente', 17, 17, 17, 17, 17),
('PRC00018', '2025-04-28', '17:00:00', 'Inspección', 'Completado', 18, 18, 18, 18, 18),
('PRC00019', '2025-04-28', '17:30:00', 'Empaque', 'Pendiente', 19, 19, 19, 19, 19),
('PRC00020', '2025-04-28', '18:00:00', 'Despacho', 'Completado', 20, 20, 20, 20, 20);




INSERT INTO REPORTE_TRAZABILIDAD (cod_reporte_trazabilidad, observaciones, firmas, fecha, hora, estado, acciones, anexos, id_empleado, id_procesos) VALUES
('RPT00001', 'Observación general del lote A', 'Firmado', '2025-04-25', '08:00:00', 'Completado', 'Inspección visual realizada', 'anexo1.pdf', 1, 1),
('RPT00002', 'Producto con empaques inconsistentes', 'Firmado', '2025-04-25', '09:00:00', 'Pendiente', 'Solicitar reinspección', 'foto_empaque.jpg', 2, 2),
('RPT00003', 'Lote recibido fuera de tiempo', 'Pendiente', '2025-04-25', '10:10:00', 'Pendiente', 'Reprogramar recepción', 'documento_envio.pdf', 3, 3),
('RPT00004', 'Productos con daño menor detectado', 'Firmado', '2025-04-26', '11:20:00', 'Completado', 'Reenvasado realizado', 'img_daños.png', 4, 4),
('RPT00005', 'Insumos insuficientes detectados', 'Firmado', '2025-04-26', '12:45:00', 'Resuelto', 'Reposición solicitada', 'reporte_almacen.pdf', 5, 5),
('RPT00006', 'Omisión de etapa de control de calidad', 'Firmado', '2025-04-26', '13:30:00', 'Cerrado', 'Operador notificado', 'video_omision.mp4', 6, 6),
('RPT00007', 'Falla en máquina de etiquetado', 'Pendiente', '2025-04-27', '14:15:00', 'En proceso', 'Enviar solicitud de mantenimiento', 'foto_etiquetadora.png', 7, 7),
('RPT00008', 'Reporte de accidente menor', 'Firmado', '2025-04-27', '15:00:00', 'Resuelto', 'Informe recibido', 'parte_accidente.pdf', 8, 8),
('RPT00009', 'Inconsistencias en documentación', 'Firmado', '2025-04-27', '15:30:00', 'Pendiente', 'Revisión de documentos', 'doc_revisado.pdf', 9, 9),
('RPT00010', 'Retraso en entrega de insumos', 'Firmado', '2025-04-28', '08:45:00', 'Pendiente', 'Coordinar con proveedor', 'correo_proveedor.pdf', 10, 10),
('RPT00011', 'Empaque defectuoso detectado', 'Firmado', '2025-04-28', '09:15:00', 'En proceso', 'Revisión detallada en curso', 'foto_defecto.jpg', 11, 11),
('RPT00012', 'Problema en calibración de maquinaria', 'Pendiente', '2025-04-28', '10:00:00', 'Pendiente', 'Solicitar mantenimiento', 'manual_calibracion.pdf', 12, 12),
('RPT00013', 'Lote contaminado detectado', 'Firmado', '2025-04-28', '10:45:00', 'Cerrado', 'Lote aislado y retirado', 'reporte_contaminacion.pdf', 13, 13),
('RPT00014', 'Falta de documentación en guía de remisión', 'Firmado', '2025-04-28', '11:30:00', 'Resuelto', 'Documentación completa recibida', 'docs_actualizados.pdf', 14, 14),
('RPT00015', 'Exceso de inventario detectado', 'Firmado', '2025-04-28', '12:15:00', 'Pendiente', 'Revisión con almacén', 'inventario_detalle.xlsx', 15, 15),
('RPT00016', 'Error en etiquetado de producto', 'Firmado', '2025-04-28', '13:00:00', 'En proceso', 'Corrección en proceso', 'etiquetas_erroneas.jpg', 16, 16),
('RPT00017', 'Falta de personal en línea de producción', 'Pendiente', '2025-04-28', '13:45:00', 'Pendiente', 'Solicitar refuerzos', 'turnos_personal.pdf', 17, 17),
('RPT00018', 'Condiciones inadecuadas en almacenamiento', 'Firmado', '2025-04-28', '14:30:00', 'Resuelto', 'Ajustes realizados', 'registro_temperatura.pdf', 18, 18),
('RPT00019', 'Incidente eléctrico menor', 'Firmado', '2025-04-28', '15:15:00', 'Cerrado', 'Equipo revisado y asegurado', 'parte_incidente.pdf', 19, 19),
('RPT00020', 'Retraso en despacho final', 'Pendiente', '2025-04-28', '16:00:00', 'Pendiente', 'Contactar logística', 'plan_despacho.pdf', 20, 20);




INSERT INTO INCIDENCIAS (cod_incidencias, causa, tipo_incidencia, estado, fecha_registrada, hora, observaciones, evidencias, fecha_resolucion, id_empleado, id_procesos) VALUES
('INC00001', 'Fallo en maquinaria', 'Técnica', 'Abierta', '2025-04-25', '08:00:00', 'La máquina de empaquetado se detuvo inesperadamente.', 'foto_maquina1.jpg', NULL, 1, 1),
('INC00002', 'Error humano', 'Operativa', 'Resuelta', '2025-04-25', '09:15:00', 'Error en el registro de empaques.', 'registro_error2.pdf', '2025-04-26', 2, 2),
('INC00003', 'Retraso en entrega', 'Logística', 'Pendiente', '2025-04-25', '10:20:00', 'No se recibió la materia prima a tiempo.', 'correo_retraso.jpg', NULL, 3, 3),
('INC00004', 'Producto dañado', 'Calidad', 'Abierta', '2025-04-26', '11:00:00', 'Producto con empaque roto detectado en inspección.', 'img_dañado.png', NULL, 4, 4),
('INC00005', 'Falta de insumos', 'Logística', 'Resuelta', '2025-04-26', '12:30:00', 'No había suficientes cajas en almacén.', 'foto_almacen.jpg', '2025-04-27', 5, 5),
('INC00006', 'Desviación de proceso', 'Operativa', 'Cerrada', '2025-04-26', '13:10:00', 'Proceso de inspección saltado por operador.', 'video_proceso6.mp4', '2025-04-27', 6, 6),
('INC00007', 'Fallo en etiquetado', 'Técnica', 'Abierta', '2025-04-27', '14:00:00', 'Las etiquetas no se imprimieron correctamente.', 'error_etiqueta7.png', NULL, 7, 7),
('INC00008', 'Accidente menor', 'Seguridad', 'Resuelta', '2025-04-27', '14:45:00', 'Corte leve en el dedo durante embalaje.', 'doc.pdf', '2025-04-27', 8, 8),
('INC00009', 'Error en documentación', 'Administrativa', 'Abierta', '2025-04-27', '15:30:00', 'Datos inconsistentes en guía de remisión.', 'doc_invalido.jpg', NULL, 9, 9),
('INC00010', 'Fallo en sistema de control', 'Técnica', 'Abierta', '2025-04-28', '08:15:00', 'El sistema de monitoreo dejó de registrar datos.', 'log_sistema10.txt', NULL, 10, 10),
('INC00011', 'Error de manipulación', 'Operativa', 'Pendiente', '2025-04-28', '09:00:00', 'Manipulación incorrecta de materiales por nuevo operario.', 'video_error11.mp4', NULL, 11, 11),
('INC00012', 'Retraso en transporte', 'Logística', 'Resuelta', '2025-04-28', '09:45:00', 'Camión llegó con demora por tráfico.', 'foto_transporte12.jpg', '2025-04-29', 12, 12),
('INC00013', 'Producto con defecto', 'Calidad', 'Abierta', '2025-04-28', '10:30:00', 'Se detectaron productos con fallas en el acabado.', 'foto_defecto13.jpg', NULL, 13, 13),
('INC00014', 'Falta de materiales', 'Logística', 'Resuelta', '2025-04-28', '11:15:00', 'Insuficientes etiquetas disponibles.', 'registro_inventario14.pdf', '2025-04-29', 14, 14),
('INC00015', 'Incumplimiento en procedimiento', 'Operativa', 'Cerrada', '2025-04-28', '12:00:00', 'No se siguió protocolo de seguridad.', 'reporte_seguridad15.pdf', '2025-04-29', 15, 15),
('INC00016', 'Falla en impresora', 'Técnica', 'Abierta', '2025-04-28', '12:45:00', 'Impresora dejó de funcionar durante impresión de etiquetas.', 'foto_impresora16.jpg', NULL, 16, 16),
('INC00017', 'Accidente menor', 'Seguridad', 'Resuelta', '2025-04-28', '13:30:00', 'Resbalón en área de carga sin consecuencias graves.', 'informe_accidente17.pdf', '2025-04-28', 17, 17),
('INC00018', 'Datos faltantes', 'Administrativa', 'Pendiente', '2025-04-28', '14:15:00', 'Falta completar campos en formulario de entrada.', 'formulario18.pdf', NULL, 18, 18),
('INC00019', 'Falla eléctrica', 'Técnica', 'Abierta', '2025-04-28', '15:00:00', 'Corte de energía que afectó la línea de producción.', 'registro_corte19.log', NULL, 19, 19),
('INC00020', 'Error en inventario', 'Administrativa', 'Pendiente', '2025-04-28', '15:45:00', 'Diferencias detectadas en conteo físico.', 'reporte_inventario20.xlsx', NULL, 20, 20);


