-- Insertar datos de clientes
INSERT INTO cliente (id, nombre, direccion, telefono, email, fecha_registro) VALUES (1,'Maite Ortiz Lopez', 'C/Topete 176 1 3 08221 Terrassa España', 936726487, 'maite@gmail.com', '2023-04-30');
INSERT INTO cliente (id, nombre, direccion, telefono, email, fecha_registro) VALUES (2,'Pedro Garcia Orta', 'C/Rosamar 23 3 1 08223 Terrassa España', 937654345, 'pedro@gmail.com', '2021-02-21');
INSERT INTO cliente (id, nombre, direccion, telefono, email, fecha_registro) VALUES (3, 'Xavi Gomez Lopez', 'C/Beethoven 23 7 3 08225 Terrassa España', 936726476, 'xavi@gmail.com', '2022-10-15');
INSERT INTO cliente (id, nombre, direccion, telefono, email, fecha_registro) VALUES (4, 'Juan Carlos Leon Sanchez', 'C/Nova 9 2 5 08221 Terrassa España', 936726190, 'juancarlos@gmail.com', '2020-07-10');
INSERT INTO cliente (id, nombre, direccion, telefono, email, fecha_registro) VALUES (5, 'Lucia Cordoba Pino', 'C/Corsega 123 6 1 08222 Terrassa España', 936726677, 'lucia@gmail.com', '2021-11-25');


-- Insertar datos de proveedores
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES (1,'GafasMiro', 'Av.Lorca 45 08225 Terrassa España', '987654321', '123456789', 'NIF1236748');
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES (2,'GafasCrital', 'C/Roc Boronat 167 08221 Terrassa España', '987657385', '836456599', 'NIF6825479');
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES (3,'GafasVeo', 'C/Bilbao 125 08224 Terrassa España', '987078421', '123000189', 'NIF45637895');
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES (4,'GafasRetina', 'C/Pallars 301 08223 Terrassa España', '987123421', '137856789', 'NIF5432148');
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES (5,'GafasObservo', 'C/Roc 16 08225 Terrassa España', '987123385', '836400099', 'NIF6878479');
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES (6,'GafasCleo', 'C/Palencia 105 08224 Terrassa España', '987000421', '123222189', 'NIF45637885');
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES (7,'GafasSol', 'C/Pallars 301 08223 Terrassa España', '98711121', '137446789', 'NIF546648');

-- Insertar datos de trabajadores
INSERT INTO empleado (id, nombre, apellido1, apellido2) VALUES (1, 'Rosa', 'Lopez', 'Viciana');
INSERT INTO empleado (id, nombre, apellido1, apellido2) VALUES (2, 'Laura', 'Montero', 'Ramos');
INSERT INTO empleado (id, nombre, apellido1, apellido2) VALUES (3, 'Alex', 'Pico', 'Zamora');

-- Insertar datos de gafas con el nuevo proveedor
INSERT INTO gafas (id, marca, graduacion, montura, color_montura, color_crital, precio, id_proveedor) VALUES (1, 'Carrerra', 1, 'Pasta', 'Negro', 'Incoloro', 150, 2);
INSERT INTO gafas (id, marca, graduacion, montura, color_montura, color_crital, precio, id_proveedor) VALUES (2, 'Oxford', 2.5, 'Flotante', 'Azul', 'Azul', 350, 1);
INSERT INTO gafas (id, marca, graduacion, montura, color_montura, color_crital, precio, id_proveedor) VALUES (3, 'Dior', 2, 'Pasta', 'Verde', 'Incoloro', 375,  4);
INSERT INTO gafas (id, marca, graduacion, montura, color_montura, color_crital, precio, id_proveedor) VALUES (4, 'Mickel Kors', 1.5, 'Metalica', 'Lila', 'Rosa', 250, 3);
INSERT INTO gafas (id, marca, graduacion, montura, color_montura, color_crital, precio, id_proveedor) VALUES (5, 'Rayban', 1, 'Flotante', 'Azul', 'Azul', 150, 5);
INSERT INTO gafas (id, marca, graduacion, montura, color_montura, color_crital, precio, id_proveedor) VALUES (6, 'Chanel', 3, 'Pasta', 'Verde', 'Incoloro', 75,  7);
INSERT INTO gafas (id, marca, graduacion, montura, color_montura, color_crital, precio, id_proveedor) VALUES (7, 'Prim', 5, 'Metalica', 'Lila', 'Rosa', 550, 6);

-- Insertar datos de venta de gafas durante un año específico
INSERT INTO venta (id, id_empleado, id_clientes) VALUES (1, 1, 3);
INSERT INTO venta (id, id_empleado, id_clientes) VALUES (2, 2, 5);
INSERT INTO venta (id, id_empleado, id_clientes) VALUES (3, 2, 1);
INSERT INTO venta (id, id_empleado, id_clientes) VALUES (4, 1, 2);
INSERT INTO venta (id, id_empleado, id_clientes) VALUES (5, 3, 4);
INSERT INTO venta (id, id_empleado, id_clientes) VALUES (6, 3, 3);

-- Insertar datos de gafas vendidas
INSERT INTO gafas_has_ventas (gafas_id, venta_id, tiempo_venta) VALUES (1, 1, '2021-02-01 1:05:20');
INSERT INTO gafas_has_ventas (gafas_id, venta_id, tiempo_venta) VALUES (2, 3, '2021-05-24 00:46:30');
INSERT INTO gafas_has_ventas (gafas_id, venta_id, tiempo_venta) VALUES (3, 2, '2022-10-13 00:31:17');
INSERT INTO gafas_has_ventas (gafas_id, venta_id, tiempo_venta) VALUES (4, 4, '2022-12-01 02:12:35');
INSERT INTO gafas_has_ventas (gafas_id, venta_id, tiempo_venta) VALUES (5, 5, '2023-02-11 00:57:20');
INSERT INTO gafas_has_ventas (gafas_id, venta_id, tiempo_venta) VALUES (6, 3, '2023-06-25 01:13:43');


-- Relacionar el cliente con la recomendación
INSERT INTO cliente_has_recomendacion (cliente_id, recomendacion_id) VALUES (4, 1);
INSERT INTO cliente_has_recomendacion (cliente_id, recomendacion_id) VALUES (2, 2);
INSERT INTO cliente_has_recomendacion (cliente_id, recomendacion_id) VALUES (3, 3);


-- Insertar datos en la tabla 'recomendacion'
INSERT INTO recomendacion (id) VALUES (1);
INSERT INTO recomendacion (id) VALUES (2);
INSERT INTO recomendacion (id) VALUES (3);

