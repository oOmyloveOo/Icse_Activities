/* 1 - El nombre (CustomerName) de los 3 últimos Customers ordenados por el ID.*/
SELECT CompanyName AS CustomerName
FROM Customers
ORDER BY CustomerID DESC
LIMIT 3;

/*2 - El número de clientes cuyo nombre empieza por A. */
SELECT *
FROM Customers
WHERE LEFT(CompanyName, 1) = 'A';

/*3 - La lista de Customers ordenada por el país. Orden alfabético.*/
SELECT CompanyName AS Customers
FROM Customers
ORDER BY  Country ASC;

/*4 - La lista de Customers de forma que no se repitan clientes de un mismo país.*/
SELECT DISTINCT CompanyName AS Customers
FROM Customers

/*5 - De la lista de productos, seleccionar el nombre y el precio de los 5 productos de más bajo
coste.*/
SELECT ProductName,UnitPrice 
FROM Products
ORDER BY  UnitPrice ASC
LIMIT 5;

/*6 - De la lista de Clientes traerte los clientes cuyo id esté entre 2 y 4 ambos incluidos*/
SELECT CompanyName AS CustomerID
FROM  Customers
WHERE  CustomerID BETWEEN 2 AND  4;

/*7 - De la lista de Suppliers (proveedores) traerte aquellos en cuya dirección tenga al menos dos
palabras (un espacio)*/
SELECT CompanyName AS Supplier,Address
FROM Suppliers
WHERE INSTR(Address, ' ') > 0;

/*8 - Los Suppliers agrupados por su country y ordenados alfabéticamente por el nombre del
país.*/
SELECT CompanyName AS Supplier
FROM Suppliers
GROUP BY Country
ORDER BY CompanyName;

/*9 - El nombre y los apellidos de los 3 empleados más mayores (según su fecha de nacimiento)*/
SELECT LastName, FirstName AS Employee, BirthDate
FROM Employees
ORDER BY BirthDate ASC
LIMIT 3;

/*10 - El precio medio de los todos los productos que hay.*/ 
SELECT ROUND(AVG(UnitPrice), 2) AS AveragePrice
FROM Products;



