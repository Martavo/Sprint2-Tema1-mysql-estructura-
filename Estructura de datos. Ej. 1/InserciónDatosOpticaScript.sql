-- Insertar datos de clientes
INSERT INTO cliente (id, nombre, direccion, telefono, email, fecha_registro) VALUES 
(1,'Maite Ortiz Lopez', 'C/Topete 176 1 3 08221 Terrassa España', 936726487, 'maite@gmail.com', '2023-04-30'),
(2,'Pedro Garcia Orta', 'C/Rosamar 23 3 1 08223 Terrassa España', 937654345, 'pedro@gmail.com', '2021-02-21'),
(3, 'Xavi Gomez Lopez', 'C/Beethoven 23 7 3 08225 Terrassa España', 936726476, 'xavi@gmail.com', '2022-10-15'),
(4, 'Juan Carlos Leon Sanchez', 'C/Nova 9 2 5 08221 Terrassa España', 936726190, 'juancarlos@gmail.com', '2020-07-10'),
(5, 'Lucia Cordoba Pino', 'C/Corsega 123 6 1 08222 Terrassa España', 936726677, 'lucia@gmail.com', '2021-11-25');


-- Insertar datos de proveedores
INSERT INTO proveedor (id, nombre, direccion, telefono, fax, NIF) VALUES 
(1,'GafasMiro', 'Av.Lorca 45 08225 Terrassa España', '987654321', '123456789', 'NIF1236748'),
(2,'GafasCrital', 'C/Roc Boronat 167 08221 Terrassa España', '987657385', '836456599', 'NIF6825479'),
(3,'GafasVeo', 'C/Bilbao 125 08224 Terrassa España', '987078421', '123000189', 'NIF45637895'),
(4,'GafasRetina', 'C/Pallars 301 08223 Terrassa España', '987123421', '137856789', 'NIF5432148'),
(5,'GafasObservo', 'C/Roc 16 08225 Terrassa España', '987123385', '836400099', 'NIF6878479'),
(6,'GafasCleo', 'C/Palencia 105 08224 Terrassa España', '987000421', '123222189', 'NIF45637885'),
(7,'GafasSol', 'C/Pallars 301 08223 Terrassa España', '98711121', '137446789', 'NIF546648');

-- Insertar datos de trabajadores
INSERT INTO empleado (id, nombre, apellido1, apellido2) VALUES 
(1, 'Rosa', 'Lopez', 'Viciana'),
(2, 'Laura', 'Montero', 'Ramos'),
(3, 'Alex', 'Pico', 'Zamora');

-- Insertar datos de gafas 
INSERT INTO gafas (id, marca, color_montura, color_cristal_dch, color_crital_izq, precio, graduacion_izq, graducacion_dch, montura, proveedor_id) VALUES 
(1, 'Carrerra', 'Negro', 'Incoloro', 'Incoloro', 150, 2, 1.5, 'Pasta', 2),
(2, 'Oxford', 'Verde', 'Negro', 'Negro', 250, 2, 1.5, 'Flotante', 3),
(3, 'Dior', 'Marron', 'Marron', 'Marron', 350, 2, 1.5, 'Pasta', 4),
(4, 'Mickel Kors', 'Blanco', 'Incoloro', 'Incoloro', 550, 2, 1.5, 'Metalicas', 1),
(5, 'Rayban', 'Amarillo', 'Gris', 'Gris', 160, 2, 1.5, 'Pasta', 6),
(6, 'Chanel', 'Rojo', 'Negro', 'Negro', 440, 2, 1.5, 'Flotante', 7),
(7, 'Prim', 'Negro', 'Incoloro', 'Incoloro', 50, 2, 1.5, 'Pasta', 2);


-- Insertar datos de venta de gafas durante un año específico
INSERT INTO venta (id, id_empleado, id_clientes, gafas_id, tiempo_venta) VALUES 
(1, 1, 1, 1, '2023-02-01 10:00:00'),
(2, 2, 5, 5, '2023-03-01 1:05:20'),
(3, 2, 1, 6, '2023-04-24 00:46:30'),
(4, 1, 2, 3, '2023-10-13 00:31:17'),
(5, 3, 4, 4, '2023-11-01 02:12:35'),
(6, 3, 3, 2, '2023-12-11 00:57:20');



-- Relacionar el cliente con la recomendación
INSERT INTO cliente_has_recomendacion (cliente_id, recomendacion_id) VALUES 
(4, 1),
(2, 2),
(3, 3);


-- Insertar datos en la tabla 'recomendacion'
INSERT INTO recomendacion (id) VALUES 
(1),
(2),
(3);
