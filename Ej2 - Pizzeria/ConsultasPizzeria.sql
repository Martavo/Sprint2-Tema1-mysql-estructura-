-- CONSULTAS

-- Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat.
SELECT COUNT(*) AS cantidad_productos_vendidos FROM Comanda_has_Producto AS cp JOIN Comanda AS c ON cp.Comanda_id = c.id JOIN Producto AS p ON cp.Producto_id = p.id JOIN Categoria_pizza AS cpizza ON p.Categoria_pizza_id = cpizza.id JOIN Tienda AS t ON c.tienda_id = t.id WHERE t.ciudad = 'Barcelona';

-- Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT COUNT(Trabajador_has_Comanda.Comanda_id) AS total_comandes_efectuades, Trabajador.Nombre AS nombre_trabajador FROM Trabajador_has_Comanda JOIN Trabajador ON Trabajador_has_Comanda.Trabajador_id = Trabajador.id
WHERE Trabajador_has_Comanda.Trabajador_id = 4;

