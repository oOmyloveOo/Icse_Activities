/*1 - Listar las oficinas con la cantidad de empleados que trabajan en cada una de ellas.*/
SELECT offices.officeCode, offices.city, COUNT(employeeNumber) AS 'amount_employees'
FROM offices
LEFT JOIN  employees ON offices.officeCode = employees.officeCode
GROUP BY offices.officeCode, offices.city;

/*2 - Listar los clientes que compran a los empleados de las oficinas de USA.*/
SELECT DISTINCT c.customerName
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices of ON e.officeCode = of.officeCode
WHERE of.country = 'USA';

/*3 - Listar a los empleados por la cantidad de clientes que atienden. */
SELECT e.firstName, COUNT(DISTINCT c.customerNumber) as amount_customers
FROM employees e
JOIN customers c ON  e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.firstName;

/*4 - El nombre de los clientes que han hecho un pago por debajo de la media de pagos. */
SELECT  c.customerName
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE p.amount < (SELECT AVG(amount) FROM  payments);

/*5 - El nombre del producto (products.productName) y la descripción del mismo (productlines.textDescription). */
SELECT p.productName, pl.textDescription
FROM products p
JOIN productlines pl ON p.productLine = pl.productLine;

/*6 - Los nombres de los clientes han comprado una '1969 Harley Davidson Ultimate Chopper'. */
SELECT DISTINCT c.customerName
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE p.productName = '1969 Harley Davidson Ultimate Chopper';

/*7 - ¿Qué vendedores han realizado ventas? */
SELECT DISTINCT e.firstName, e.lastName
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber;

/*8 - El nombre del producto más vendido de 2004. */
SELECT p.productName 
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
WHERE YEAR(o.orderDate) =  2004
GROUP BY p.productName
ORDER BY SUM(od.quantityOrdered) DESC
LIMIT 1;

/*9 - Listar las 2 oficinas con más empleados. */
SELECT o.officeCode, o.city, COUNT(*) AS numEmployees
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
GROUP BY o.officeCode, o.city
ORDER BY numEmployees DESC
LIMIT 2;

/*10 - Listar Los empleados con su correspondiente gerente (reportsTo)*/
SELECT e.firstName, e.lastName, e.reportsTo
FROM employees e
LEFT JOIN employees GE ON e.reportsTo  = GE.employeeNumber
ORDER BY e.employeeNumber;
