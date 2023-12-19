-- Añadir valores a las tablas
------------
-- CLIENTE
INSERT INTO Cliente (id, Nombre, Apellidos, Direccion, CodigoPostal, Ciudad, Provincia, Telefono) VALUES 
(1, 'Marta', 'Doe Flor', 'C/Pallars 34', 08005, 'Barcelona', 'Barcelona', '678456789'),
(2, 'Luis', 'Lopez Perez', 'C/Bilbao 144', 08005, 'Barcelona', 'Barcelona', '678456123'),
(3, 'Lucia', 'Hidalgo Fez', 'C/Lluc 4', 08005, 'Barcelona', 'Barcelona', '678456456'),
(4, 'Xavi', 'Orta Viciana', 'C/Gràcia 51', 08004, 'Barcelona', 'Barcelona', '678456678'),
(5, 'Montse', 'Garcia Gonzalez', 'C/Toledo 65', 08002, 'Barcelona', 'Barcelona', '678456912'),
(6, 'Anna', 'Moreno Peres', 'C/Pino 3', 08003, 'Barcelona', 'Barcelona', '678456846');

-- TIENDA
INSERT INTO Tienda (id, Direccion, CodigoPostal, Ciudad, Provincia) VALUES 
(1, 'Rambla Poblenou 456', 08005, 'Barcelona', 'Barcelona'),
(2, 'Calle Bolivia 123', 08005, 'Barcelona', 'Barcelona');

-- TRABAJADOR
INSERT INTO Trabajador (id, Nombre, Apellidos, DNI, Telefono, FuncionTrabajo, Tienda_id) VALUES 
(1, 'Carlos', 'Gómez Moreno', '46288468M', 644569834, 'Cocinero', 1),
(2, 'Clara', 'Lopez Sandoval', '12345678T', 699843567, 'Repartidor', 1),
(3, 'María', 'Villalba Garcia', '87654321Q', 633451234, 'Cocinero', 2),
(4, 'Curro', 'Fedez Martinez', '67945673N', 688764534, 'Repartidor', 2);

-- COMANDA

INSERT INTO Comanda (id, Fecha_hora, Tipo_entrega, Cantidad_productos, Precio, cliente_id, Tienda_id) VALUES 
(1, '2023-04-01 14:50:00', 'Entrega a domicilio', 2, 16, 1, 1),
(2, '2023-04-11 12:10:00', 'Para recoger', 1, 11, 2, 1),
(3, '2023-04-15 12:53:00', 'Para recoger', 4, 47, 3, 2),
(4, '2023-04-20 16:06:00', 'Entrega a domicilio', 1, 10, 4, 2),
(5, '2023-04-25 20:10:00', 'Para recoger', 5, 68, 5, 1),
(6, '2023-04-28 14:45:00', 'Para recoger', 2, 21, 6, 2),
(7, '2023-04-30 21:40:00', 'Entrega a domicilio', 3, 36, 3, 1);

-- BEBIDA
INSERT INTO Bebida (id, Nombre, Descipcion, Foto, Precio) VALUES 
(1, 'Agua', 'Agua mineral sin gas', 'foto_en_blob', 1.6),
(2, 'Coca-cola', 'Bebida refrescante', 'foto_en_blob', 2.5),
(3, 'Fanta', 'Bebida refrescante', 'foto_en_blob', 2),
(4, 'Nesté', 'Bebida refrescante', 'foto_en_blob', 2);

-- HAMBURGUESA
INSERT INTO Hamburguesa (id, Nombre, Descipcion, Foto, Precio) VALUES 
(1, 'Hamburguesa con Queso', 'Deliciosa hamburguesa con queso derretido', 'foto_en_blob', 13),
(2, 'Hamburguesa con Bacon', 'Deliciosa hamburguesa con bacon crujiente', 'foto_en_blob', 15),
(3, 'Hamburguesa con Cebolla', 'Deliciosa hamburguesa con cebolla caramelizada', 'foto_en_blob', 14);

-- PIZZA
INSERT INTO Pizza (id, Nombre, Descripcion, Foto, Precio, Categoria_id) VALUES 
(1, 'Pizza Margarita', 'Tomate, mozzarella y albahaca', 'foto_en_blob', 12, 2),
(2, 'Pizza 4 quesos', 'Tomate, mozzarella y 3 quesos más', 'foto_en_blob', 16, 2),
(3, 'Pizza jamon y queso', 'Tomate, mozzarella jamón y queso', 'foto_en_blob', 14, 1),
(4, 'Pizza burrata y tomate', 'Tomate, mozzarella y burrata', 'foto_en_blob', 14, 2),
(5, 'Pizza 4 estaciones', 'Tomate, mozzarella, chamiñones, aceitunas y jamón dulce', 'foto_en_blob', 14, 1);

-- CATEGORIA
INSERT INTO Categoria (id, nombre) VALUES 
(1, 'Pizza con carne'),
(2, 'Pizza vegetarianas');

-- PRODUCTO
		-- BEBIDAS
INSERT INTO Producto (id, Hamburguesa_id, Bebida_id, Pizza_id) VALUES 
(1, NULL, 1, NULL),
(2, NULL, 2, NULL),
(3, NULL, 3, NULL),
(4, NULL, 4, NULL);

		-- HAMBURGUESAS
INSERT INTO Producto (id, Hamburguesa_id, Bebida_id, Pizza_id) VALUES 
(5, 1, NULL, NULL),
(6, 2, NULL, NULL),
(7, 3, NULL, NULL);

		-- PIZZAS
INSERT INTO Producto (id, Hamburguesa_id, Bebida_id, Pizza_id) VALUES 
(8, NULL, NULL, 1),
(9, NULL, NULL, 2),
(10, NULL, NULL, 3),
(11, NULL, NULL, 4),
(12, NULL, NULL, 5);

-- TRABAJADOR_HAS_COMANDA
INSERT INTO Trabajador_has_Comanda (id, Trabajador_id, Comanda_id, Fecha_hora) VALUES 
('1', 2, 1, '2023-04-01 15:15:00'),
('2', 4, 4, '2023-04-20 16:25:00'),
('3', 2, 7, '2023-04-30 22:20:00');

-- COMANDA_HAS_PRODUCTO
INSERT INTO Comanda_has_Producto (Comanda_id, Producto_id) VALUES 
(1, 1),
(1, 2),
(2, 8),
(3, 2),
(3, 10),
(3, 11),
(3,6),
(4, 3),
(5, 5),
(5, 8),
(5, 1),
(5, 2),
(5, 11),
(6, 1),
(6, 12),
(7, 1),
(7, 5),
(7, 11);





