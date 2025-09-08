```sql


INSERT INTO Estado_Empleado (ID_Estado_Empleado, Descripcion)
VALUES
('ACTV', 'Activo'),
('DESP', 'Despedido'),
('BAJA', 'Baja Temporal');

INSERT INTO Tipo_Empleado (ID_Tipo_Empleado, Descripcion) VALUES
('OPER', 'Operario'),
('SUPV', 'Supervisor'),
('ADMN', 'Administrador'),
('TECN', 'Técnico'),
('TRAN', 'Transportista');


INSERT INTO Tipo_Producto (ID_Tipo_Producto, Descripcion) VALUES
('FT', 'Fruta de Clima Templado'),
('FM', 'Fruta de Clima Mediterráneo'),
('TR', 'Fruta de Clima Tropical'),
('HT', 'Hortaliza');

INSERT INTO Estado_packing (ID_Estado_packing, Descripcion) VALUES
('F', 'Finalizado'),
('E', 'En proceso'),
('S', 'Suspendido');

INSERT INTO Tipo_empaque (ID_Tipo_empaque, Descripcion) VALUES
('P', 'Parihuela'),
('S', 'Saco'),
('C', 'Caja'),
('B', 'Bolsa plástica'),
('M', 'Malla');


-- Estado_Lote
INSERT INTO Estado_Lote (ID_Estado_Lote, Descripcion) VALUES
('OK', 'Aprobado'),
('OB', 'Observado');

-- Estado_Recepcion
INSERT INTO Estado_Recepcion (ID_Estado_Recepcion, Descripcion) VALUES
('A', 'Aceptado'),
('R', 'Rechazado');

-- Estado_Control_Calidad
INSERT INTO Estado_Control_Calidad (ID_Estado_Control_Calidad, Descripcion) VALUES
('A', 'Aprobado'),
('O', 'Observado');

-- Estado_paquete_Recepcion
INSERT INTO Estado_paquete_Recepcion (ID_Estado_paquete_Recepcion, Descripcion) VALUES
('OKPR', 'Paquete OK'),
('OBS', 'Paquete Observado');

-- Tipo_Periodo
INSERT INTO Tipo_Periodo (ID_Tipo_Periodo, Descripcion) VALUES
('D', 'Diario'),
('S', 'Semanal'),
('M', 'Mensual');


INSERT INTO Estado_Mantenimiento_Operacion (ID_Estado_Mantenimiento_Operacion, Descripcion)
VALUES
('COM', 'Completado'),
('PEN', 'Pendiente'),
('ENP', 'En Proceso');

INSERT INTO Estado_Mantenimiento (ID_Estado_mantenimiento, Descripcion)
VALUES
('EM000001', 'Mantenimiento preventivo'),
('EM000002', 'Mantenimiento correctivo'),
('EM000003', 'En espera de repuestos'),
('EM000004', 'Mantenimiento completo');


INSERT INTO Tipo_Maquina (ID_Tipo_Maquina, Descripcion)
VALUES
('TM001', 'Clasificadora'),
('TM002', 'Máquinas de encerado manual'),
('TM003', 'Termógrafo'),
('TM004', 'Cámara frigorífica'),
('TM005', 'Montacargas'),
('TM006', 'Transpaletas eléctricos'),
('TM007', 'Carritos de mano'),
('TM008', 'Gasificado');

INSERT INTO Estado_Equipo (ID_Estado_equipo, Descripcion)
VALUES
('OPE', 'Operativo'),
('MNT', 'Mantenimiento'),
('FSE', 'Fuera de servicio');



INSERT INTO Estado_Orden_Transporte (ID_Estado_orden, Descripcion) VALUES
('P', 'Pendiente o en curso'),
('F', 'Finalizado');

INSERT INTO Estado_Seguimiento (ID_Estado_seguimiento, Descripcion) VALUES
('T', 'En tránsito'),
('P', 'Realización de una parada'),
('E', 'Realización de una entrega'),
('A', 'Accidente de tránsito');

INSERT INTO Tipo_incidente_entrega (ID_Tipo_incidente, Descripcion) VALUES
('1', 'Producto dañado'),
('2', 'Retraso del producto'),
('3', 'Productos incompletos'),
('4', 'Otros');

INSERT INTO Estado_reporte_incidentes_transporte (ID_Estado_reporte, Descripcion) VALUES
('P', 'Pendiente'),
('R', 'Resuelto');

INSERT INTO Tipo_Movimiento (ID_Tipo_Movimiento, Descripcion) VALUES
('E', 'Entrada'),
('S', 'Salida'),
('T', 'Transferencia');


-- Empleado
INSERT INTO Empleado (ID_Empleado, Nombre_Apellido, Fecha_Nacimiento, Fecha_Contratacion, ID_Tipo_Empleado, ID_Estado_Empleado, Fecha_Despido) VALUES
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
('EMP00016', 'Pipo Hernandez', '1991-10-13', '2021-09-12', 'TRAN', 'ACTV', NULL);





INSERT INTO Maquina_sustituta (ID_Maquina_sustituta, Nombre_de_maquina, ID_Estado_equipo, ID_Tipo_Maquina)
VALUES
('M0000001', 'Cosechadora Sustituta', 'OPE', 'TM001'),
('M0000002', 'Máquina de Encerado Manual Sustituta', 'FSE', 'TM002'),
('M0000003', 'Termógrafo Sustituto', 'OPE', 'TM003'),
('M0000004', 'Cámara Frigorífica Sustituta', 'OPE', 'TM004'),
('M0000005', 'Montacargas Sustituto', 'OPE', 'TM005'),
('M0000006', 'Transpaleta Eléctrica Sustituta', 'FSE', 'TM006'),
('M0000007', 'Carrito de Mano Sustituto', 'OPE', 'TM007'),
('M0000008', 'Gasificadora Sustituta', 'MNT', 'TM008');

INSERT INTO Area (ID_Area, Nombre_del_area)
VALUES
('A01', 'Recepción'),
('A02', 'Pretratamiento'),
('A03', 'Preparación y Paletizado'),
('A04', 'Prefeminamiento'),
('A05', 'Selección y Clasificación'),
('A06', 'Empaquetado y Etiquetado'),
('A07', 'Almacenamiento'),
('A08', 'Despacho');

INSERT INTO Equipo (ID_Equipo, Nombre_equipo, ID_Estado_equipo, ID_Tipo_Maquina, Fecha_registro, Fecha_salida, Detalle, ID_Maquina_sustituta, Antiguedad_anos, ID_Empleado)
VALUES
('EQ000001', 'Clasificadora XZ', 'OPE', 'TM001', '2023-05-01', NULL, 'Modelo XZ-5000, capacidad de 2000 unidades por hora, motor de 150 HP, tamaño 5m x 2m', NULL, 8, 'EMP00001'),
('EQ000002', 'Máquinas de encerado manual', 'FSE', 'TM002', '2023-06-05', '2023-06-10', 'Modelo EN200, potencia 5 HP, 1200 mm de ancho de trabajo, ajustable para diferentes productos', 'M0000001', 10, 'EMP00002'),
('EQ000003', 'Termógrafo ABC', 'OPE', 'TM003', '2023-04-10', NULL, 'Modelo T-30, termómetro digital de precisión, rango de temperatura de -50°C a 150°C', NULL, 5, 'EMP00003'),
('EQ000004', 'Cámara Frigorífica DEF', 'MNT', 'TM004', '2023-05-15', NULL, 'Modelo CF-1000, capacidad de 10,000 litros, sistema de control digital de temperatura', NULL, 7, 'EMP00004'),
('EQ000005', 'Montacargas 123', 'OPE', 'TM005', '2023-07-01', NULL, 'Modelo MC500, capacidad de carga 5000 kg, motor eléctrico, altura máxima 3.5m', NULL, 12, 'EMP00005'),
('EQ000006', 'Transpaleta Eléctrica', 'OPE', 'TM006', '2023-08-01', NULL, 'Modelo TE200, capacidad de carga 2000 kg, batería de 24V, velocidad máxima de 5 km/h', NULL, 4, 'EMP00006'),
('EQ000007', 'Carrito de Mano A', 'FSE', 'TM007', '2023-09-15', '2023-09-20', 'Modelo CM-300, capacidad de carga 300 kg, rueda de acero inoxidable, dimensiones 1.5m x 1m', 'M0000002', 9, 'EMP00007'),
('EQ000008', 'Gasificadora XZ', 'OPE', 'TM008', '2023-10-01', NULL, 'Modelo G-3000, capacidad de 300 litros de gasificación, control automático de temperatura', NULL, 6, 'EMP00008'),
('EQ000009', 'Clasificadora ZX', 'MNT', 'TM001', '2023-11-01', NULL, 'Modelo ZX-800, capacidad de 2500 unidades por hora, motor de 180 HP, tamaño 6m x 2.5m', NULL, 15, 'EMP00009'),
('EQ000010', 'Máquina de Encerado', 'FSE', 'TM002', '2023-12-01', '2023-12-05', 'Modelo EN300, potencia 6 HP, ancho de trabajo 1500 mm, velocidad ajustable', 'M0000003', 3, 'EMP00010') ;


INSERT INTO Planificacion_de_asignacion (ID_Planificacion_asignacion, Fecha_de_asignacion, Fecha_de_vencimiento, Descripcion_de_tarea, ID_Area, ID_Equipo, ID_Empleado_Registra, ID_Empleado_Solicita)
VALUES
('PA000002', '2023-06-01', '2023-06-10', 'Encerado de productos con la Máquina de Encerado Manual', 'A02', 'EQ000002', 'EMP00003', 'EMP00004'),
('PA000003', '2023-07-15', '2023-07-20', 'Termografía para control de calidad con el Termógrafo', 'A03', 'EQ000003', 'EMP00005', 'EMP00006'),
('PA000004', '2023-08-05', '2023-08-12', 'Refrigeración de productos en la Cámara Frigorífica DEF', 'A04', 'EQ000004', 'EMP00007', 'EMP00008'),
('PA000005', '2023-09-01', '2023-09-05', 'Movimiento de materiales con el Montacargas 123', 'A05', 'EQ000005', 'EMP00009', 'EMP00010'),
('PA000006', '2023-10-01', '2023-10-05', 'Transporte de palets con la Transpaleta Eléctrica', 'A06', 'EQ000006', 'EMP00010', 'EMP00001'),
('PA000007', '2023-11-10', '2023-11-15', 'Gasificación para la producción de gas con la Gasificadora XZ', 'A07', 'EQ000007', 'EMP00002', 'EMP00003'),
('PA000008', '2023-12-01', '2023-12-05', 'Encerado de productos con la Máquina de Encerado', 'A08', 'EQ000008', 'EMP00004', 'EMP00005');


INSERT INTO Realiza (ID_Empleado, ID_Planificacion_asignacion)
VALUES
('EMP00002', 'PA000002'),
('EMP00003', 'PA000003'),
('EMP00004', 'PA000004'),
('EMP00005', 'PA000005'),
('EMP00006', 'PA000006'),
('EMP00007', 'PA000007'),
('EMP00008', 'PA000008');


INSERT INTO Historial_Cambios_Area (ID_Cambio, ID_Equipo, ID_Planificacion_asignacion, ID_Area_Anterior, ID_Area_Actual, Cambio_de_area)
VALUES
('H0000002', 'EQ000002', 'PA000002', 'A02', 'A03', TRUE),
('H0000003', 'EQ000003', 'PA000003', 'A03', 'A04', FALSE),
('H0000004', 'EQ000004', 'PA000004', 'A04', 'A05', TRUE),
('H0000005', 'EQ000005', 'PA000005', 'A05', 'A06', FALSE),
('H0000006', 'EQ000006', 'PA000006', 'A06', 'A07', TRUE),
('H0000007', 'EQ000007', 'PA000007', 'A07', 'A08', FALSE);



INSERT INTO Programacion_Mantenimiento_externo (ID_Mantenimiento_externo, Tipo_de_mantenimiento, Fecha_de_inicio, Fecha_de_fin, Empresa_encargada, ID_Equipo, ID_Estado_mantenimiento, ID_Empleado_Registra, ID_Empleado_Solicita, ID_Maquina_sustituta)
VALUES
('MEX00001', 'Mantenimiento preventivo', '2023-05-01', '2023-05-05', 'Mantenimiento S.A.', 'EQ000001', 'EM000001', 'EMP00001', 'EMP00002', NULL),
('MEX00002', 'Mantenimiento correctivo', '2023-06-01', '2023-06-05', 'Reparaciones XYZ', 'EQ000002', 'EM000002', 'EMP00003', 'EMP00004', 'M0000001'),
('MEX00003', 'Mantenimiento preventivo', '2023-07-01', '2023-07-05', 'Mantenimiento S.A.', 'EQ000003', 'EM000001', 'EMP00005', 'EMP00006', NULL),
('MEX00004', 'Mantenimiento correctivo', '2023-08-01', '2023-08-10', 'Reparaciones XYZ', 'EQ000004', 'EM000002', 'EMP00007', 'EMP00008', 'M0000002'),
('MEX00005', 'Mantenimiento preventivo', '2023-09-01', '2023-09-05', 'Mantenimiento S.A.', 'EQ000005', 'EM000001', 'EMP00009', 'EMP00010', NULL);

-- Productos
INSERT INTO Producto (ID_producto, Nombre_producto, ID_Tipo_Producto, Descripcion) VALUES
('PRD00001', 'Arándano', 'FT', 'Fruta fresca de clima templado, rica en antioxidantes'),
('PRD00002', 'Uva de mesa', 'FT', 'Fruta fresca de clima templado, usada en mesas y consumo directo'),
('PRD00003', 'Espárrago', 'HT', 'Hortaliza fresca exportada, utilizada principalmente en la gastronomía'),
('PRD00004', 'Palto', 'FM', 'Fruta fresca de clima mediterráneo, conocida por su sabor cremoso'),
('PRD00005', 'Limón', 'TR', 'Fruta fresca de clima tropical, usada para jugos y aderezos'),
('PRD00006', 'Mandarina', 'FT', 'Fruta fresca de clima templado, fácil de pelar y consumir'),
('PRD00007', 'Fresa', 'FT', 'Fruta fresca de clima templado, muy popular en postres y jugos'),
('PRD00008', 'Mango', 'TR', 'Fruta fresca de clima tropical, dulce y jugosa'),
('PRD00009', 'Granada', 'FT', 'Fruta fresca de clima templado, rica en antioxidantes'),
('PRD00010', 'Kiwi', 'FT', 'Fruta fresca de clima templado, con un sabor ácido y dulce');

-- Lote
INSERT INTO Lote (ID_lote, Descripcion, Cantidad_total, Unidad, fecha_vencimiento, ID_Estado_Lote, Fecha_produccion, ID_producto) VALUES
('LOT00001', 'Lote de arándanos', 500.0, 'kg', '2025-12-31', 'OK', '2024-01-15', 'PRD00001'),
('LOT00002', 'Lote de uvas', 10000.0, 'unidades', '2026-06-30', 'OK', '2024-02-20', 'PRD00002'),
('LOT00003', 'Lote de espárragos', 700.0, 'kg', '2025-10-15', 'OK', '2024-03-05', 'PRD00003'),
('LOT00004', 'Lote de paltos', 8000.0, 'unidades', '2025-08-20', 'OK', '2024-03-12', 'PRD00004'),
('LOT00005', 'Lote de limones', 600.0, 'kg', '2026-01-30', 'OK', '2024-04-01', 'PRD00005'),
('LOT00006', 'Lote de clementinas', 9000.0, 'unidades', '2025-11-22', 'OK', '2024-04-10', 'PRD00006'),
('LOT00007', 'Lote de fresas', 450.0, 'kg', '2025-07-05', 'OK', '2024-04-20', 'PRD00007'),
('LOT00008', 'Lote de frambuesas', 300.0, 'unidades', '2026-03-10', 'OK', '2024-04-28', 'PRD00008'),
('LOT00009', 'Lote de mangos', 250.0, 'kg', '2025-09-25', 'OK', '2024-05-04', 'PRD00009'),
('LOT00010', 'Lote de peras', 5000.0, 'unidades', '2026-02-14', 'OK', '2024-05-12', 'PRD00010');


INSERT INTO Ubicacion_Almacen (ID_Ubicacion_Almacen, Tipo_area, Peso_maximo, Volumen_maximo, ID_Lote) VALUES
('UBC00001', 'A01', 1000.0, 500.0, 'LOT00001'),
('UBC00002', 'A02', 2000.0, 1200.0, 'LOT00002'),
('UBC00003', 'A03', 800.0, 400.0, 'LOT00003'),
('UBC00004', 'A04', 900.0, 450.0, 'LOT00004'),
('UBC00005', 'A05', 1500.0, 900.0, 'LOT00005'),
('UBC00006', 'A06', 700.0, 350.0, 'LOT00006'),
('UBC00007', 'A07', 1200.0, 600.0, 'LOT00007'),
('UBC00008', 'A08', 2500.0, 1300.0, 'LOT00008'),
('UBC00009', 'A09', 1200.0, 600.0, 'LOT00009'),
('UBC00010', 'A10', 2500.0, 1300.0, 'LOT00010');

INSERT INTO Stock (ID_Stock, Cantidad_disponible, Stock_minimo, Stock_maximo, ID_producto) VALUES
('STK00001', 450, 100, 600, 'PRD00001'),
('STK00002', 9000, 3000, 12000, 'PRD00002'),
('STK00003', 600, 200, 800, 'PRD00003'),
('STK00004', 7500, 2000, 10000, 'PRD00004'),
('STK00005', 550, 150, 700, 'PRD00005'),
('STK00006', 8500, 2500, 11000, 'PRD00006'),
('STK00007', 400, 100, 500, 'PRD00007'),
('STK00008', 280, 80, 400, 'PRD00008'),
('STK00009', 230, 70, 350, 'PRD00009'),
('STK00010', 4800, 1500, 6000, 'PRD00010');




INSERT INTO Reporte_inventario (ID_Reporte_inventario, Fecha_inventario, ID_Planificacion_asignacion, ID_Mantenimiento_externo)
VALUES
('RI000002', '2023-06-10', 'PA000002', 'MEX00002'),
('RI000003', '2023-07-20', 'PA000003', 'MEX00002'),
('RI000004', '2023-08-12', 'PA000004', 'MEX00003'),
('RI000005', '2023-09-05', 'PA000005', 'MEX00003'),
('RI000006', '2023-09-10', 'PA000006', 'MEX00001'),
('RI000007', '2023-08-25', 'PA000006', 'MEX00001'),
('RI000008', '2023-09-12', 'PA000007', 'MEX00004'),
('RI000009', '2023-08-30', 'PA000007', 'MEX00004'),
('RI000010', '2023-09-15', 'PA000008', 'MEX00005'); 



INSERT INTO Reporte_equipos (ID_Reporte_equipos, ID_Equipo, ID_Planificacion_asignacion, ID_Mantenimiento_externo)
VALUES
('RE000002', 'EQ000002', 'PA000002', 'MEX00002'),
('RE000003', 'EQ000003', 'PA000003', 'MEX00003'),
('RE000004', 'EQ000004', 'PA000004', 'MEX00004'),
('RE000005', 'EQ000005', 'PA000005', 'MEX00005');

INSERT INTO Mantenimiento_externo_detalle (ID_Mantenimiento_externo_detalle, Detalle_mantenimiento_realizado, ID_Estado_Mantenimiento_Operacion, ID_Mantenimiento_externo)
VALUES
('MXD00001', 'Reemplazo de filtro de aire, limpieza de componentes electrónicos', 'COM', 'MEX00001'),
('MXD00002', 'Revisión y calibración de termómetro digital, verificación de termostato', 'COM', 'MEX00002'),
('MXD00003', 'Cambio de aceite y revisión de sistema hidráulico', 'PEN', 'MEX001'),
('MXD00004', 'Sustitución de componentes defectuosos, limpieza general de la máquina', 'COM', 'MEX00002'),
('MXD00005', 'Reemplazo de partes de motor, revisión de transmisión', 'ENP', 'MEX00003'),
('MXD00006', 'Inspección de cámaras frigoríficas, verificación de sellos', 'COM', 'MEX00003'),
('MXD00007', 'Limpieza de filtros, revisión de bomba de aire', 'COM', 'MEX00004'),
('MXD00008', 'Verificación de presión de neumáticos, revisión de sistema eléctrico', 'ENP', 'MEX00004'),
('MXD00009', 'Cambio de aceite y filtros, calibración de sensores', 'COM', 'MEX00005'),
('MXD00010', 'Revisión completa del sistema hidráulico, cambio de bombas de presión', 'PEN', 'MEX00005');


-- Recepcion
INSERT INTO Recepcion (ID_recepcion, Fecha_registro, Cantidad_recibida, ID_Estado_Recepcion, ID_lote) VALUES
('REC00001', '2024-01-20', 500.0, 'A', 'LOT00001'),
('REC00002', '2024-02-25', 10000.0, 'A', 'LOT00002'),
('REC00003', '2024-03-08', 700.0, 'A', 'LOT00003'),
('REC00004', '2024-03-15', 8000.0, 'A', 'LOT00004'),
('REC00005', '2024-04-05', 600.0, 'A', 'LOT00005'),
('REC00006', '2024-04-12', 9000.0, 'A', 'LOT00006'),
('REC00007', '2024-04-22', 450.0, 'A', 'LOT00007'),
('REC00008', '2024-04-30', 300.0, 'A', 'LOT00008'),
('REC00009', '2024-05-06', 250.0, 'A', 'LOT00009'),
('REC00010', '2024-05-14', 5000.0, 'A', 'LOT00010');

-- Control_de_calidad
INSERT INTO Control_de_calidad (ID_Control_de_calidad, Fecha_inspeccion, ID_Estado_paquete_Recepcion, Temperatura_producto, Observaciones_lote, Observaciones_empaque, ID_Estado_Control_Calidad, ID_Recepcion, ID_empleado) VALUES
('QC000001', '2024-01-21', 'OKPR', 22.5, 'Sin observaciones', 'Empaque intacto', 'A', 'REC00001', 'EMP00001'),
('QC000002', '2024-02-26', 'OBS', 23.0, 'Defecto menor', 'Empaque rasgado', 'O', 'REC00002', 'EMP00002'),
('QC000003', '2024-03-09', 'OKPR', 21.8, 'Sin observaciones', 'Empaque correcto', 'A', 'REC00003', 'EMP00003'),
('QC000004', '2024-03-16', 'OKPR', 22.0, 'Sin observaciones', 'Empaque correcto', 'A', 'REC00004', 'EMP00004'),
('QC000005', '2024-04-06', 'OBS', 24.5, 'Ligera oxidación', 'Caja dañada', 'O', 'REC00005', 'EMP00005'),
('QC000006', '2024-04-13', 'OKPR', 22.3, 'Sin observaciones', 'Empaque correcto', 'A', 'REC00006', 'EMP00006'),
('QC000007', '2024-04-23', 'OKPR', 21.5, 'Sin observaciones', 'Empaque correcto', 'A', 'REC00007', 'EMP00007'),
('QC000008', '2024-05-01', 'OBS', 23.7, 'Golpes leves', 'Caja sucia', 'O', 'REC00008', 'EMP00008'),
('QC000009', '2024-05-07', 'OKPR', 22.1, 'Sin observaciones', 'Empaque correcto', 'A', 'REC00009', 'EMP00009'),
('QC000010', '2024-05-15', 'OKPR', 22.0, 'Sin observaciones', 'Empaque correcto', 'A', 'REC00010', 'EMP00010');



-- Reporte_producto_observado
INSERT INTO Reporte_producto_observado (ID_Reporte_producto_observado, Fecha_registro, Especificacion_no_cumplida, Acciones_a_tomar, ID_Control_de_calidad) VALUES
('RPO00001', '2024-02-27', 'Temperatura fuera de rango', 'Ajustar temperatura almacenamiento', 'QC000002'),
('RPO00002', '2024-04-07', 'Oxidación superficial', 'Revisión y limpieza inmediata', 'QC000005'),
('RPO00003', '2024-05-02', 'Golpes en material', 'Rechazar producto dañado', 'QC000008');

-- Reporte_Recepcion_estadisticas
INSERT INTO Reporte_Recepcion_estadisticas (ID_Reporte_Recepcion_estadisticas, Fecha_emision, Total_unidades_recibidas, ID_Tipo_Periodo, ID_recepcion) VALUES
('RRE00001', '2024-03-01', 500.0, 'M', 'REC00001'),
('RRE00002', '2024-03-02', 10000.0, 'M', 'REC00002'),
('RRE00003', '2024-03-10', 700.0, 'M', 'REC00003'),
('RRE00004', '2024-03-17', 8000.0, 'M', 'REC00004'),
('RRE00005', '2024-04-08', 600.0, 'M', 'REC00005'),
('RRE00006', '2024-04-15', 9000.0, 'M', 'REC00006'),
('RRE00007', '2024-04-24', 450.0, 'M', 'REC00007'),
('RRE00008', '2024-05-02', 300.0, 'M', 'REC00008'),
('RRE00009', '2024-05-08', 250.0, 'M', 'REC00009'),
('RRE00010', '2024-05-16', 5000.0, 'M', 'REC00010');
INSERT INTO Movimiento_inventario (ID_Movimiento_Inventario, ID_Tipo_movimiento, Motivo, Cantidad, Fecha_movimiento, ID_Lote, ID_Reporte_inventario,  ID_Empleado) VALUES
('MOV00001', 'E', 'Recepción de Arándano de la cosecha 2023', 5000, '2023-08-02 09:00:00', 'LOT00001', 'RI000002',  'EMP00001'),
('MOV00002', 'S', 'Despacho de Uva a cliente en Europa', 3000, '2023-09-10 14:30:00', 'LOT00002', 'RI000002',  'EMP00002'),
('MOV00003', 'E', 'Ingreso de Esparrago para almacenamiento', 7000, '2023-08-15 10:00:00', 'LOT00003', 'RI000003',  'EMP00003'),
('MOV00004', 'S', 'Envío de Palto al centro de distribución', 4000, '2023-09-01 16:00:00', 'LOT00004', 'RI000004',  'EMP00004'),
('MOV00005', 'E', 'Entrada de Limón para almacenamiento', 3500, '2023-09-05 08:00:00', 'LOT00005', 'RI000005',  'EMP00005'),
('MOV00006', 'S', 'Envío de Mandarina a exportación', 4500, '2023-09-10 12:00:00', 'LOT00006', 'RI000006', 'EMP00006'),
('MOV00007', 'E', 'Ingreso de Fresa para almacenamiento', 6000, '2023-08-05 11:00:00', 'LOT00007', 'RI000007', 'EMP00007'),
('MOV00008', 'S', 'Despacho de Mango a supermercado', 8000, '2023-09-12 13:30:00', 'LOT00008', 'RI000008',  'EMP00008'),
('MOV00009', 'E', 'Recepción de Granada de cosecha', 5500, '2023-08-12 09:30:00', 'LOT00009', 'RI000009', 'EMP00009'),
('MOV00010', 'S', 'Envío de Kiwi a cliente asiático', 4000, '2023-09-05 10:00:00', 'LOT00010', 'RI000010',  'EMP00010');


INSERT INTO Alerta_inventario (ID_Alerta_inventario, Estado_alerta, Tipo_Alerta, Fecha_hora_alerta, ID_Lote, ID_Reporte_inventario) VALUES
('AI000001', 'Activa', 'Vencimiento Próximo', '2023-09-15 10:00:00', 'LOT00001', 'RI000002'),
('AI000002', 'Activa', 'Stock Bajo', '2023-09-17 14:30:00', 'LOT00002', 'RI000002'),
('AI000003', 'Activa', 'Stock Alto', '2023-09-20 08:00:00', 'LOT00003', 'RI000003'),
('AI000004', 'Activa', 'Vencimiento Próximo', '2023-09-18 11:00:00', 'LOT00004', 'RI000004'), 
('AI000005', 'Activa', 'Stock Bajo', '2023-09-16 09:45:00', 'LOT00005', 'RI000005'),
('AI000006', 'Activa', 'Vencimiento Próximo', '2023-09-19 12:30:00', 'LOT00006', 'RI000006'),
('AI000007', 'Activa', 'Stock Alto', '2023-09-22 15:15:00', 'LOT00007', 'RI000007'),
('AI000008', 'Activa', 'Stock Bajo', '2023-09-25 10:30:00', 'LOT00008', 'RI000008'),
('AI000009', 'Activa', 'Vencimiento Próximo', '2023-09-23 13:00:00', 'LOT00009', 'RI000009'),
('AI000010', 'Activa', 'Stock Alto', '2023-09-26 14:00:00', 'LOT00010', 'RI000010');  




INSERT INTO Vehiculo (ID_Vehiculo, Tipo_vehiculo, Placa_vehiculo, Estado_vehiculo, Marca, Modelo) VALUES
('VH000001', 'Camión', 'ABC123', 'Activo', 'Volvo', 'FH16'),
('VH000002', 'Camioneta', 'XYZ987', 'Mantenimiento', 'Toyota', 'Hilux'),
('VH000003', 'Furgón', 'JKL456', 'Activo', 'Mercedes-Benz', 'Sprinter'),
('VH000004', 'Tráiler', 'LMN321', 'Inactivo', 'Scania', 'R500'),
('VH000005', 'Camión', 'DGH654', 'Activo', 'MAN', 'TGX'),
('VH000006', 'Camioneta', 'ZXC741', 'Activo', 'Nissan', 'Frontier');



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
INSERT INTO Cliente (ID_Cliente, Nombre_cliente, Direccion_cliente, Telefono_cliente, Correo_cliente) VALUES
('CLI00001', 'Juan Pérez', 'Av. Las Américas 123, Lima', '987654321', 'juanperez@email.com'),
('CLI00002', 'María Gómez', 'Calle Los Olivos 456, Arequipa', '987654322', 'mariagomez@email.com'),
('CLI00003', 'Carlos Rodríguez', 'Av. Pardo 789, Cusco', '987654323', 'carlosrodriguez@email.com'),
('CLI00004', 'Ana Martínez', 'Calle 8 de Octubre 101, Piura', '987654324', 'anamartinez@email.com'),
('CLI00005', 'Luis Sánchez', 'Av. San Martín 200, Trujillo', '987654325', 'luissanchez@email.com'),
('CLI00006', 'Patricia Torres', 'Calle Los Cedros 303, Puno', '987654326', 'patriciatorres@email.com'),
('CLI00007', 'José Díaz', 'Calle Bolívar 404, Arequipa', '987654327', 'josediaz@email.com'),
('CLI00008', 'Laura Fernández', 'Av. Universitaria 505, Lima', '987654328', 'laurafernandez@email.com'),
('CLI00009', 'Pedro López', 'Calle Las Flores 606, Cusco', '987654329', 'pedrolopez@email.com'),
('CLI00010', 'Mariana Silva', 'Calle Los Jazmines 707, Lima', '987654330', 'marianasilva@email.com');



INSERT INTO Pedido (ID_Pedido, Direccion_pedido, Fecha_limite, Destino, ID_Cliente) VALUES
('PED00001', 'Av. Los Frutales 123, Lima', '2025-05-10', 'Lima', 'CLI00001'),
('PED00002', 'Calle Primavera 456, Arequipa', '2025-05-12', 'Arequipa', 'CLI00002'),
('PED00003', 'Jr. Los Sauces 789, Trujillo', '2025-05-15', 'Trujillo', 'CLI00003'),
('PED00004', 'Av. Las Flores 321, Cusco', '2025-05-18', 'Cusco', 'CLI00004'),
('PED00005', 'Calle Las Gardenias 654, Chiclayo', '2025-05-20', 'Chiclayo', 'CLI00005'),
('PED00006', 'Av. El Sol 987, Piura', '2025-05-22', 'Piura', 'CLI00006'),
('PED00007', 'Calle Palma Real 741, Ica', '2025-05-25', 'Ica', 'CLI00007'),
('PED00008', 'Av. América Sur 852, Huancayo', '2025-05-28', 'Huancayo', 'CLI00008'),
('PED00009', 'Jr. Amazonas 963, Puno', '2025-05-30', 'Puno', 'CLI00009'),
('PED00010', 'Calle Libertad 159, Tarapoto', '2025-06-02', 'Tarapoto', 'CLI00010');


INSERT INTO Guia_de_Remision (
    ID_Guia_Remision, fecha_emision, fecha_de_traslado, 
    ID_Vehiculo, ID_Informe_de_especificaciones, ID_Transportista, 
    ID_Pedido, ID_Empleado
) VALUES 
('GR000001', '2025-04-01', '2025-04-02', 'VH000001', 'IE000001', 'EMP00011', 'PED00001', 'EMP00001'),
('GR000002', '2025-04-03', '2025-04-04', 'VH000001', 'IE000002','EMP00011', 'PED00002', 'EMP00002'),
('GR000003', '2025-04-05', '2025-04-05', 'VH000001', 'IE000003', 'EMP00011', 'PED00003', 'EMP00003'),
('GR000004', '2025-04-06', '2025-04-07', 'VH000002', 'IE000004', 'EMP00012', 'PED00004', 'EMP00004'),
('GR000005', '2025-04-07', '2025-04-08', 'VH000003', 'IE000005', 'EMP00013', 'PED00005', 'EMP00005'),
('GR000006', '2025-04-08', '2025-04-09', 'VH000003', 'IE000006', 'EMP00013', 'PED00006', 'EMP00006'),
('GR000007', '2025-04-09', '2025-04-10', 'VH000004', 'IE000007', 'EMP00014', 'PED00007', 'EMP00007'),
('GR000008', '2025-04-10', '2025-04-11', 'VH000005', 'IE000008', 'EMP00015', 'PED00008', 'EMP00008'),
('GR000009', '2025-04-11', '2025-04-12', 'VH000005', 'IE000009', 'EMP00015', 'PED00009', 'EMP00009'),
('GR000010', '2025-04-12', '2025-04-13', 'VH000006', 'IE000010', 'EMP00016', 'PED00010', 'EMP00010');


INSERT INTO Orden_Transporte (
     ID_Orden_transporte,
    ID_Empleado,
    Fecha_registro,
    Fecha_finalizado,
    Ubicacion_salida,
    ID_Estado_orden,
    Fecha_salida,
    Hora_salida
) VALUES 
('OT000001', 'EMP00002', '2025-04-05', NULL , 'AREA A', 'P',  '2025-04-05', '12:30'),
('OT000002', 'EMP00002', '2025-04-07', NULL, 'AREA B', 'P',  '2025-04-07', '12:30'),
('OT000003', 'EMP00003', '2025-04-09', NULL, 'AREA A', 'P',  '2025-04-09', '12:30'),
('OT000004','EMP00004', '2025-04-10', NULL, 'AREA B', 'P',  '2025-04-10', '12:30'),
('OT000005', 'EMP00005', '2025-04-12', NULL, 'AREA C', 'P', '2025-04-12', '12:30'),
('OT000006', 'EMP00006', '2025-04-13', NULL, 'AREA D', 'P',  '2025-04-13', '12:30');

INSERT INTO Guia_X_Orden_Transporte (
     ID_Guia_X_Orden,
     ID_Orden_transporte,
    ID_Guia_Remision
) VALUES 
('OT000001GR000001', 'OT000001', 'GR000001'),
('OT000001GR000002', 'OT000001', 'GR000002'),
('OT000001GR000003', 'OT000001', 'GR000003'),
('OT000002GR000004', 'OT000002', 'GR000004'),
('OT000003GR000005', 'OT000003', 'GR000005'),
('OT000003GR000006', 'OT000003', 'GR000006'),
('OT000004GR000007','OT000004', 'GR000007'),
('OT000005GR000008', 'OT000005','GR000008'),
('OT000005GR000009', 'OT000005','GR000009'),
('OT000006GR000010', 'OT000006', 'GR000010');

INSERT INTO Seguimiento (
     ID_Seguimiento,
    Fecha_registro,
    Hora_registro,
    Descripcion ,
    ID_Estado_seguimiento ,
    ID_Orden_transporte )
VALUES 
('SE000001', '2025-04-05', '20:30', 'DIRECCION A', 'T', 'OT000001'),
('SE000002', '2025-04-06', '20:30', 'DIRECCION B', 'T', 'OT000001'),
('SE000003', '2025-04-07', '20:30', 'DIRECCION C', 'P', 'OT000002'),
('SE000004', '2025-04-08', '20:30', 'DIRECCION D', 'P', 'OT000002'),
('SE000005', '2025-04-09', '20:30', 'DIRECCION E', 'P', 'OT000003'),
('SE000006', '2025-04-10', '20:30', 'DIRECCION F', 'P', 'OT000005'),
('SE000007','2025-04-11', '20:30', 'DIRECCION G', 'T', 'OT000005'),
('SE000008', '2025-04-12','20:30', 'DIRECCION H', 'T', 'OT000006'),
('SE000009', '2025-04-13','20:30', 'DIRECCION I', 'T', 'OT000006'),
('SE000010', '2025-04-14','20:30', 'DIRECCION J', 'P', 'OT000006');

INSERT INTO Informe_Entrega (
     ID_Informe_entrega,
    Fecha_entrega,
    Hora_entrega,
    nombre_receptor ,
    dni_receptor,
    observacion,
    ID_Guia_Remision)
VALUES 
('IF000001', '2025-04-06', '20:30', 'Homero Chino', '12345678', NULL,'GR000001' );

INSERT INTO Reporte_Incidentes_Entrega (
     ID_Reporte_incidentes,
    ID_Estado_reporte ,
    Descripcion ,
    ID_Tipo_incidente ,
    Fecha_registro,
    Hora_registro,
    ID_Cliente ,
    ID_Informe_entrega ,
    ID_Empleado)
VALUES 
('RIE00001', 'P', 'El producto esta en malas condiciones', '1', '2025-04-07',  '20:30','CLI00001', 'IF000001', 'EMP00001');




INSERT INTO Empaque (ID_empaque, Nombre, ID_Tipo_empaque, Descripcion, Capacidad_maxima, ID_Lote) VALUES
('EMA00001', 'Parihuela', 'P', 'Parihuela especial para arándano', 500.0, 'LOT00001'),
('EMA00002', 'Caja', 'C', 'Caja resistente para transporte de uvas', 1000.0, 'LOT00002'),
('EMA00003', 'Saco', 'S', 'Saco ventilado para espárragos', 600.0, 'LOT00003'),
('EMA00004', 'Caja', 'C', 'Caja plástica de palto', 800.0, 'LOT00004'),
('EMA00005', 'Bolsa', 'B', 'Bolsa reforzada para limones', 500.0, 'LOT00005'),
('EMA00006', 'Malla', 'M', 'Malla para mandarinas frescas', 900.0, 'LOT00006'),
('EMA00007', 'Caja', 'C', 'Caja pequeña para fresas', 450.0, 'LOT00007'),
('EMA00008', 'Saco', 'S', 'Saco de malla para frambuesas', 300.0, 'LOT00008'),
('EMA00009', 'Caja', 'C', 'Caja rígida para mangos', 250.0, 'LOT00009'),
('EMA00010', 'Caja', 'C', 'Caja estándar para peras', 5000.0, 'LOT00010');



INSERT INTO Packing (ID_packing, ID_Estado_packing, Fecha_packing, Cantidad_producto, Peso_Neto, ID_Pedido, ID_Empleado, ID_empaque) VALUES
('PKG00001', 'F', '2025-01-10', 200, 450.0, 'PED00001', 'EMP00001', 'EMA00001'),
('PKG00002', 'E', '2025-01-12', 500, 980.0, 'PED00002', 'EMP00002', 'EMA00002'),
('PKG00003', 'S', '2025-01-14', 300, 600.0, 'PED00003', 'EMP00003', 'EMA00003'),
('PKG00004', 'F', '2025-01-16', 1000, 1600.0, 'PED00004', 'EMP00004', 'EMA00004'),
('PKG00005', 'E', '2025-01-18', 150, 300.0, 'PED00005', 'EMP00005', 'EMA00005'),
('PKG00006', 'S', '2025-01-20', 850, 1400.0, 'PED00006', 'EMP00006', 'EMA00006'),
('PKG00007', 'F', '2025-01-22', 200, 450.0, 'PED00007', 'EMP00007', 'EMA00007'),
('PKG00008', 'E', '2025-01-24', 400, 800.0, 'PED00008', 'EMP00008', 'EMA00008'),
('PKG00009', 'S', '2025-01-26', 600, 900.0, 'PED00009', 'EMP00009', 'EMA00009'),
('PKG00010', 'F', '2025-01-28', 700, 1000.0, 'PED00010', 'EMP00010', 'EMA00010');



INSERT INTO Reporte_Packing (ID_Reporte_Packing, Observaciones, Fecha_reporte, ID_Empleado, ID_packing) VALUES
('RPK00001', 'Packing completado sin incidencias', '2025-01-11', 'EMP00001', 'PKG00001'),
('RPK00002', 'Problemas menores detectados', '2025-01-13', 'EMP00002', 'PKG00002'),
('RPK00003', 'Faltante de material de empaque', '2025-01-15', 'EMP00003', 'PKG00003'),
('RPK00004', 'Verificación exitosa de peso', '2025-01-17', 'EMP00004', 'PKG00004'),
('RPK00005', 'Cancelación por problemas de calidad', '2025-01-19', 'EMP00005', 'PKG00005'),
('RPK00006', 'Producto aprobado tras inspección', '2025-01-21', 'EMP00006', 'PKG00006'),
('RPK00007', 'Producto rechazado, reempaque necesario', '2025-01-23', 'EMP00007', 'PKG00007'),
('RPK00008', 'Despacho realizado correctamente', '2025-01-25', 'EMP00008', 'PKG00008'),
('RPK00009', 'Incompleto, requiere verificación', '2025-01-27', 'EMP00009', 'PKG00009'),
('RPK00010', 'Proceso suspendido por auditoría', '2025-01-29', 'EMP00010', 'PKG00010');




INSERT INTO Procesos VALUES
('PRC00001', '2025-04-28', '08:30:00', 'Recepción', 'Completado', 'RPT00001', 'EMP00001', 'REC00001', 'PKG00001', 'GR000001', 'MOV00001'),
('PRC00002', '2025-04-28', '09:00:00', 'Inspección', 'En Proceso', 'RPT00002', 'EMP00002', 'REC00002', 'PKG00002', 'GR000002', 'MOV00002'),
('PRC00003', '2025-04-28', '09:30:00', 'Empaque', 'Pendiente', 'RPT00003', 'EMP00003', 'REC00003', 'PKG00003', 'GR000003', 'MOV00003'),
('PRC00004', '2025-04-28', '10:00:00', 'Despacho', 'Completado', 'RPT00004', 'EMP00004', 'REC00004', 'PKG00004', 'GR000004', 'MOV00004'),
('PRC00005', '2025-04-28', '10:30:00', 'Recepción', 'Anulado', 'RPT00005', 'EMP00005', 'REC00005', 'PKG00005', 'GR000005', 'MOV00005'),
('PRC00006', '2025-04-28', '11:00:00', 'Inspección', 'Completado', 'RPT00006', 'EMP00006', 'REC00006', 'PKG00006', 'GR000006', 'MOV00006'),
('PRC00007', '2025-04-28', '11:30:00', 'Empaque', 'En Proceso', 'RPT00007', 'EMP00007', 'REC00007', 'PKG00007', 'GR000007', 'MOV00007'),
('PRC00008', '2025-04-28', '12:00:00', 'Despacho', 'Pendiente', 'RPT00008', 'EMP00008', 'REC00008', 'PKG00008', 'GR000008', 'MOV00008'),
('PRC00009', '2025-04-28', '12:30:00', 'Recepción', 'Completado', 'RPT00009', 'EMP00009', 'REC00009', 'PKG00009', 'GR000009', 'MOV00009'),
('PRC00010', '2025-04-28', '13:00:00', 'Inspección', 'Anulado', 'RPT00010', 'EMP00010', 'REC00010', 'PKG00010', 'GR000010', 'MOV00010');




INSERT INTO Reporte_trazabilidad VALUES
('RPT00001', 'Observación general del lote A', 'Firmado', '2025-04-25', '08:00:00', 'Completado', 'Inspección visual realizada', 'anexo1.pdf', 'EMP00001', 'PRC00001'),
('RPT00002', 'Producto con empaques inconsistentes', 'Firmado', '2025-04-25', '09:00:00', 'Pendiente', 'Solicitar reinspección', 'foto_empaque.jpg', 'EMP00002', 'PRC00002'),
('RPT00003', 'Lote recibido fuera de tiempo', 'Pendiente', '2025-04-25', '10:10:00', 'Pendiente', 'Reprogramar recepción', 'documento_envio.pdf', 'EMP00003', 'PRC00003'),
('RPT00004', 'Productos con daño menor detectado', 'Firmado', '2025-04-26', '11:20:00', 'Completado', 'Reenvasado realizado', 'img_daños.png', 'EMP00004', 'PRC00004'),
('RPT00005', 'Insumos insuficientes detectados', 'Firmado', '2025-04-26', '12:45:00', 'Resuelto', 'Reposición solicitada', 'reporte_almacen.pdf', 'EMP00005', 'PRC00005'),
('RPT00006', 'Omisión de etapa de control de calidad', 'Firmado', '2025-04-26', '13:30:00', 'Cerrado', 'Operador notificado', 'video_omision.mp4', 'EMP00006', 'PRC00006'),
('RPT00007', 'Falla en máquina de etiquetado', 'Pendiente', '2025-04-27', '14:15:00', 'En proceso', 'Enviar solicitud de mantenimiento', 'foto_etiquetadora.png', 'EMP00007', 'PRC00007'),
('RPT00008', 'Reporte de accidente menor', 'Firmado', '2025-04-27', '15:00:00', 'Resuelto', 'Informe médico recibido', 'parte_accidente.pdf', 'EMP00008', 'PRC00008'),
('RPT00009', 'Inconsistencias en documentación', 'Firmado', '2025-04-27', '15:30:00', 'Pendiente', 'Revisión de documentos', 'doc_revisado.pdf', 'EMP00009', 'PRC00009'),
('RPT00010', 'Problemas de red durante inspección', 'Firmado', '2025-04-28', '07:45:00', 'Completado', 'Sistema reiniciado', 'log_sistema.txt', 'EMP00010', 'PRC00010');




INSERT INTO Incidencias VALUES
('INC00001', 'Fallo en maquinaria', 'Técnica', 'Abierta', '2025-04-25', '08:00:00', 'La máquina de empaquetado se detuvo inesperadamente.', 'foto_maquina1.jpg', NULL, 'EMP00001', 'PRC00001'),
('INC00002', 'Error humano', 'Operativa', 'Resuelta', '2025-04-25', '09:15:00', 'Error en el registro de empaques.', 'registro_error2.pdf', '2025-04-26', 'EMP00002', 'PRC00002'),
('INC00003', 'Retraso en entrega', 'Logística', 'Pendiente', '2025-04-25', '10:20:00', 'No se recibió la materia prima a tiempo.', 'correo_retraso.jpg', NULL, 'EMP00003', 'PRC00003'),
('INC00004', 'Producto dañado', 'Calidad', 'Abierta', '2025-04-26', '11:00:00', 'Producto con empaque roto detectado en inspección.', 'img_dañado.png', NULL, 'EMP00004', 'PRC00004'),
('INC00005', 'Falta de insumos', 'Logística', 'Resuelta', '2025-04-26', '12:30:00', 'No había suficientes cajas en almacén.', 'foto_almacen.jpg', '2025-04-27', 'EMP00005', 'PRC00005'),
('INC00006', 'Desviación de proceso', 'Operativa', 'Cerrada', '2025-04-26', '13:10:00', 'Proceso de inspección saltado por operador.', 'video_proceso6.mp4', '2025-04-27', 'EMP00006', 'PRC00006'),
('INC00007', 'Fallo en etiquetado', 'Técnica', 'Abierta', '2025-04-27', '14:00:00', 'Las etiquetas no se imprimieron correctamente.', 'error_etiqueta7.png', NULL, 'EMP00007', 'PRC00007'),
('INC00008', 'Accidente menor', 'Seguridad', 'Resuelta', '2025-04-27', '14:45:00', 'Corte leve en el dedo durante embalaje.', 'doc.pdf', '2025-04-27', 'EMP00008', 'PRC00008'),
('INC00009', 'Error en documentación', 'Administrativa', 'Abierta', '2025-04-27', '15:30:00', 'Datos inconsistentes en guía de remisión.', 'doc_invalido.jpg', NULL, 'EMP00009', 'PRC00009'),
('INC00010', 'Fallo de red', 'Técnica', 'Cerrada', '2025-04-28', '07:45:00', 'Interrupción temporal del sistema de monitoreo.', 'log_red.txt', '2025-04-28', 'EMP00010', 'PRC00010');


```
