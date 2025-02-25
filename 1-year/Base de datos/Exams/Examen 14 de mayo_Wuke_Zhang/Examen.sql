--Sección 2: Consultas SQL
-- Consulta errónea 1
SELECT nombre, COUNT(*) 
FROM Clientes 
GROUP BY nombre;

-- Consulta errónea 2
SELECT orden_id, nombre
FROM Ordenes 
JOIN Clientes ON Ordenes.cliente_id = Clientes.cliente_id
WHERE fecha = (SELECT MAX(fecha) FROM Ordenes);

--Escribe cinco consultas SQL que cumplan con los siguientes requisitos (0,5 cada una):

--Una consulta que muestre el nombre de cada cliente y el número total de órdenes que ha realizado.
SELECT c.nombre AS NombreCliente, COUNT(o.orden_id) AS TotalOrdenes
FROM Clientes c
LEFT JOIN Ordenes o ON c.cliente_id = o.cliente_id
GROUP BY c.nombre;

--Una consulta que muestre el nombre de cada producto y la cantidad total vendida.
SELECT p.nombre AS NombreProducto, SUM(op.cantidad) AS CantidadTotalVendida
FROM Productos p
JOIN Ordenes_Productos op ON p.producto_id = op.producto_id
GROUP BY p.nombre;

--Una consulta que muestre la fecha de cada orden y el número de productos diferentes en cada orden, filtrando las fechas donde haya más de 3 productos diferentes.
SELECT o.fecha, COUNT(DISTINCT producto_id) AS NumProductosDiferentes
FROM Ordenes o
JOIN Ordenes_Productos op ON o.orden_id = op.orden_id
GROUP BY fecha
HAVING COUNT(DISTINCT producto_id) >= 3;

--Una consulta que muestre el nombre y precio de los productos cuyo precio es mayor que el precio promedio de todos los productos.
SELECT nombre, precio
FROM Productos
WHERE precio > (SELECT AVG(precio) FROM Productos);

--Una consulta que muestre el nombre de cada cliente y el gasto total realizado, ordenado de mayor a menor gasto.
SELECT c.nombre AS NombreCliente, SUM(o.total) AS GastoTotal
FROM Clientes c
JOIN Ordenes o ON c.cliente_id = o.cliente_id
GROUP BY c.nombre
ORDER BY GastoTotal DESC;

/*Una consulta que muestre el nombre de cada cliente y el total de órdenes que ha realizado, 
pero solo para aquellos clientes cuyo gasto total es mayor que el gasto promedio de todos los clientes.*/
SELECT c.nombre AS NombreCliente, COUNT(o.orden_id) AS TotalOrdenes
FROM Clientes c
JOIN Ordenes o ON c.cliente_id = o.cliente_id
GROUP BY c.nombre
HAVING SUM(o.total) > (SELECT AVG(total) FROM (SELECT SUM(total) AS total FROM Ordenes GROUP BY cliente_id) AS promedio_total);

/*Sección 3: Ejercicios de SQL
Crear una Vista (1 punto)
Escribe una consulta SQL para crear una vista llamada VistaClientesOrdenes que muestre el nombre del cliente, la fecha de la orden y el total de la orden.*/
CREATE VIEW VistaClientesOrdenes AS
SELECT c.nombre AS NombreCliente, o.fecha AS FechaOrden, o.total AS TotalOrden
FROM Clientes c
JOIN Ordenes o ON c.cliente_id = o.cliente_id;

/*Crear una Tabla Temporal (1 punto)
Escribe una consulta SQL para crear una tabla temporal llamada ClientesVIP que contenga los IDs de cliente, 
nombres y el gasto total para aquellos clientes que hayan gastado más de 1000 en total.*/
CREATE TEMPORARY TABLE ClientesVIP AS
SELECT c.cliente_id, c.nombre, SUM(o.total) AS gasto_total
FROM Clientes c
JOIN Ordenes o ON c.cliente_id = o.cliente_id
GROUP BY c.cliente_id, c.nombre
HAVING gasto_total > 1000;

/*Realizar un Dump del SQL (1 punto)
Describe el comando necesario para realizar un dump de la base de datos gestion_base_datos en un archivo llamado dump.sql.*/
mysqldump -u usuario -p gestion_base_datos > dump.sql

/*Optimizar una Consulta (0,5 puntos)
Dada una consulta que muestra el nombre de cada cliente y el gasto total realizado:*/
CREATE INDEX idx_cliente_id ON Ordenes(cliente_id);

/*Sección 4: SQL con Errores (0,5 puntos cada uno)
SQL con Errores*/

-- Error 1
INSERT INTO Clientes (nombre, email) VALUES ('Juan','juan@example.com');

-- Error 2
SELECT cliente_id, nombre
FROM Clientes
GROUP BY cliente_id,nombre;
