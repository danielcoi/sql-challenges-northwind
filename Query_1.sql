SELECT*
FROM sys.databases;--VERIFICO QUE LA NUEVA DB CREADA DE "MICROSOFT NORTHWIND" EST CREADA--

USE
NORTHWIND;
SELECT*--VEO LAS TABLAS DISPONIBLES--
FROM sys.tables;

-- (1) Pregunta de negocio: El departamento de Marketing quiere hacer una campaña en Francia.
-- Necesitamos el nombre de la empresa (CompanyName), el nombre del contacto (ContactName)
-- y el teléfono de todos los clientes (Customers) que vivan en Francia (France).

SELECT*
FROM Suppliers;

SELECT*
FROM Suppliers
WHERE Country='France';

SELECT CompanyName,ContactName,Phone
FROM Suppliers
WHERE Country='France';


-- (2) Alerta de Inventario (Operadores y Ordenamiento)
-- Pregunta de negocio: El gerente de compras necesita saber qué productos corren el riesgo de agotarse.
-- Dame una lista de los productos (Products) donde las unidades en stock (UnitsInStock)
-- sean menores ó iguales a 5, pero que no estén descontinuados (Discontinued = 0).
-- Ordena el resultado de menor a mayor stock.

USE
NORTHWIND;
SELECT*
FROM Products;

SELECT UnitsInStock
FROM Products;

SELECT*
FROM Products
WHERE UnitsInStock<=5;

SELECT*
FROM Products
WHERE UnitsInStock<=5
 AND Discontinued=0;

SELECT*
FROM Products
WHERE UnitsInStock<=5
 AND Discontinued=0
ORDER BY UnitsInStock ASC;



-- (3).El top de los costosos
-- Pregunta de negocio: Queremos saber cuáles son los 5 productos más caros de la tienda.
-- Muestra el nombre del producto y su precio (UnitPrice),
-- pero redondea el precio para que no lleve decimales y renombra esa columna como Precio_Redondeado.

USE
NORTHWIND;

SELECT*
FROM Products;

SELECT TOP 5*
FROM Products
ORDER BY UnitPrice DESC;

SELECT TOP 5
			productname,
			unitprice
FROM Products
ORDER BY UnitPrice DESC;

SELECT TOP 5
			productname,
			ROUND(unitprice,0) AS Precio_Redondeado
FROM Products
ORDER BY UnitPrice DESC;



-- (4) Radiografía de Empleados (Agrupaciones)
-- Pregunta de negocio: Recursos Humanos quiere saber cuántos empleados (Employees) tenemos en cada ciudad.
-- Queremos ver la ciudad (City) y al lado el total de empleados que viven en ella.

USE NORTHWIND;

SELECT*
FROM Employees;

SELECT City,
	COUNT(*)
FROM Employees
GROUP BY City;

SELECT City,
	COUNT(*) AS Empleados_viviendo_por_ciudad
FROM Employees
GROUP BY City;



-- (5).El reto de las Ventas (Tu primer JOIN)
-- Pregunta de negocio: Finanzas necesita ver las órdenes de compra pero con nombres reales,
-- no con códigos. Haz una consulta que junte la tabla de Órdenes (Orders) con la de Clientes (Customers) y
-- muestra: el ID de la orden (OrderID), la fecha de la orden (OrderDate) y
-- el nombre de la empresa cliente (CompanyName).

SELECT*
FROM Orders;

SELECT*
FROM Customers;

SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Customers.CompanyName
FROM Orders
INNER JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID;
