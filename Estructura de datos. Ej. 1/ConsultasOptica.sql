-- PETICIONES
-- Llista el total de compres d’un client/a. Ejemplo con 2 clientes
SELECT c.id AS cliente_id, c.nombre AS cliente_nombre, COUNT(v.id) AS total_compras FROM cliente c LEFT JOIN venta v ON c.id = v.id_clientes WHERE c.id = 2 GROUP BY c.id, c.nombre;
SELECT c.id AS cliente_id, c.nombre AS cliente_nombre, COUNT(v.id) AS total_compras FROM cliente c LEFT JOIN venta v ON c.id = v.id_clientes WHERE c.id = 1 GROUP BY c.id, c.nombre;

-- Llista les diferents ulleres que ha venut un empleat durant un any. Ejemplo con el empleado 1 el año 2023
SELECT e.id AS empleado_id, e.nombre AS empleado_nombre, COUNT(v.id) AS cantidad_gafas_vendidas FROM empleado e JOIN venta v ON e.id = v.id_empleado WHERE e.id = 1 AND YEAR(v.tiempo_venta) = 2023 GROUP BY e.id, e.nombre;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica. 
SELECT DISTINCT p.id AS proveedor_id, p.nombre AS proveedor_nombre FROM proveedor p JOIN gafas g ON p.id = g.proveedor_id JOIN venta v ON g.id = v.gafas_id ORDER BY proveedor_id ASC;
