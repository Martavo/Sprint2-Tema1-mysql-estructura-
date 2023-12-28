-- Añadir valores a las tablas
------------
-- CLIENTE
INSERT INTO Cliente (id, nombre, apellido, direccion, codigo_postal, ciudad, provincia, telefono) VALUES 
(1, 'Marta', 'Doe Flor', 'C/Pallars 34', 08005, 'Barcelona', 'Barcelona', '678456789'),
(2, 'Luis', 'Lopez Perez', 'C/Bilbao 144', 08005, 'Barcelona', 'Barcelona', '678456123'),
(3, 'Lucia', 'Hidalgo Fez', 'C/Lluc 4', 08005, 'Barcelona', 'Barcelona', '678456456'),
(4, 'Xavi', 'Orta Viciana', 'C/Gràcia 51', 08004, 'Barcelona', 'Barcelona', '678456678');


-- TIENDA
INSERT INTO Tienda (id, direccion, codigo_postal, ciudad, provincia) VALUES 
(1, 'Rambla Poblenou 456', 08005, 'Barcelona', 'Barcelona'),
(2, 'Calle Bolivia 123', 08005, 'Barcelona', 'Barcelona');

-- TRABAJADOR
INSERT INTO Trabajador (id, nombre, apellidos, DNI, telefono, funcion_trabajo, tienda_id) VALUES 
(1, 'Carlos', 'Gómez Moreno', '46288468M', 644569834, 'Cocinero', 1),
(2, 'Clara', 'Lopez Sandoval', '12345678T', 699843567, 'Repartidor', 1),
(3, 'María', 'Villalba Garcia', '87654321Q', 633451234, 'Cocinero', 2),
(4, 'Curro', 'Fedez Martinez', '67945673N', 688764534, 'Repartidor', 2);

-- COMANDA
INSERT INTO Comanda (id, fecha_hora, tipo_entrega, cantidad, precio, cliente_id, tienda_id) VALUES 
(1, '2023-04-01 14:50:00', 'Domicilio', 2, 14.3, 1, 1),
(2, '2023-04-11 12:10:00', 'Recogida', 1, 12.5, 2, 1),
(3, '2023-04-15 12:53:00', 'Recogida', 4, 46.5, 3, 2),
(4, '2023-04-20 16:06:00', 'Domicilio', 1, 13, 4, 2);


-- CATEGORIA
INSERT INTO Categoria_pizza (id, nombre) VALUES 
(1, 'Rustica'),
(2, 'Fina');

-- PRODUCTOS
INSERT INTO Producto (id, nombre_pizza, descripcion_pizza, foto_pizza, precio_pizza, Categoria_pizza_id, nombre_hamburguesa, descripcion_hamburguera, foto_hamburguesa, precio_hamburguesa, nombre_bebida, descripcion_bebida, foto_bebida, precio_bebida)VALUES
  (1, 'Pizza Margarita', 'Tomate, queso, albahaca', 'foto_en_blob', 12.3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (2, 'Pizza 4 quesos', 'Tomate, mozzarella y 3 quesos más', 'foto_en_blob', 16, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (3, 'Pizza jamon y queso', 'Tomate, mozzarella jamón y queso', 'foto_en_blob', 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (4, NULL, NULL, NULL, NULL, NULL, 'Hamburguesa Clasica', 'Carne, lechuga, tomate','foto_en_blob', 12.5, NULL, NULL, NULL, NULL),
  (5, NULL, NULL, NULL, NULL, NULL, 'Hamburguesa con Queso', 'Deliciosa hamburguesa con queso derretido', 'foto_en_blob', 13, NULL, NULL, NULL, NULL),
  (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Refresco Cola', 'Bebida refrescante', 'foto_en_blob', 2),
  (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Agua', 'Agua mineral sin gas', 'foto_en_blob', 1.6);

-- COMANDA_HAS_PRODUCTO
INSERT INTO Comanda_has_Producto (comanda_id, producto_id)
VALUES
  (1, 1),
  (1, 6),
  (2, 4),
  (3, 2),
  (3, 6),
  (3, 4),
  (3, 2),
  (4, 5);
  
-- TRABAJADOR_HAS_COMANDA
INSERT INTO Trabajador_has_Comanda (id, trabajador_id, comanda_id, fecha_hora) VALUES 
('1', 2, 1, '2023-04-01 15:15:00'),
('2', 4, 4, '2023-04-20 16:25:00');



