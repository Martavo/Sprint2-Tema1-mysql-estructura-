-- CONSULTAS

-- Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat.
SELECT COUNT(chp.Comanda_id) AS total_begudes_vendudes, cl.Ciudad FROM Comanda_has_Producto chp JOIN Producto p ON chp.Producto_id = p.id JOIN Comanda c ON chp.Comanda_id = c.id 
JOIN Cliente cl ON c.Cliente_id = cl.id JOIN Bebida b ON p.Bebida_id = b.id WHERE b.id IS NOT NULL GROUP BY cl.Ciudad;

-- Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT COUNT(Trabajador_has_Comanda.Comanda_id) AS total_comandes_efectuades, Trabajador.Nombre AS nombre_trabajador FROM Trabajador_has_Comanda JOIN Trabajador ON Trabajador_has_Comanda.Trabajador_id = Trabajador.id
WHERE Trabajador_has_Comanda.Trabajador_id = 2;

