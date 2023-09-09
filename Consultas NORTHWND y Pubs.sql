use NORTHWND

-- Muestra los nombres de los productos y sus precios unitarios, ordenados por precio de forma ascendente.
SELECT Products.ProductName, Products.UnitPrice
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY Products.UnitPrice;

-- Muestra la cantidad total de productos vendidos por categoría y muestra solo las categorías con más de 100 unidades vendidas en total.
SELECT Categories.CategoryName, SUM(Details.Quantity) AS Total
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
INNER JOIN dbo.[Order Details] Details ON Products.ProductID = Details.ProductID
GROUP BY Categories.CategoryName
HAVING SUM(Details.Quantity) > 100;

-- Muestra el número de pedidos realizados por cada cliente y muestra solo aquellos clientes que han realizado más de 5 pedidos.
SELECT Customers.CompanyName, COUNT(Orders.OrderID) AS NumeroOrden
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CompanyName
HAVING COUNT(Orders.OrderID) > 5;

-- Muestra el nombre completo de los empleados y sus ciudades de residencia, concatenados en una sola columna.
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS NombreCompleto, Employees.City
FROM Employees;

-- Muestra los nombres de los productos y sus fechas de inicio de disponibilidad, ordenados por año de disponibilidad de forma descendente.
SELECT Products.ProductName, YEAR(Products.Discontinued) AS AñoDescontinuacion
FROM Products
ORDER BY AñoDescontinuacion DESC;

-- Muestra el nombre de la categoría y el precio promedio de los productos en esa categoría,
-- y muestra solo las categorías donde el precio promedio es superior a $50.
SELECT Categories.CategoryName, AVG(Products.UnitPrice) AS Precio
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
HAVING AVG(Products.UnitPrice) > 50;

-- Muestra el año de pedido y la cantidad total de productos vendidos en ese año,
-- agrupados por año de pedido.
SELECT YEAR(Orders.OrderDate) AS OrderYear, SUM(OD.Quantity) AS TotalVendido
FROM Orders
INNER JOIN dbo.[Order Details] OD ON Orders.OrderID = OD.OrderID
GROUP BY OrderDate;

-- Muestra el nombre del producto más barato en cada categoría.
SELECT Categories.CategoryName, MIN(Products.UnitPrice) AS MinimoPrecio
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName;

-- Muestra el nombre del empleado que ha procesado el pedido más caro y el monto del pedido.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MAX(O.Freight) AS MaxOrderTotal
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY FirstName, LastName;

-- Muestra los nombres de los productos y la cantidad de veces que aparecen en los detalles de pedidos,
-- ordenados por la cantidad de veces que se han pedido de forma descendente.
SELECT Products.ProductName, COUNT(O.ProductID) AS VecesOrdenado
FROM Products
INNER JOIN dbo.[Order Details] O ON Products.ProductID = O.ProductID
GROUP BY Products.ProductName
ORDER BY VecesOrdenado DESC;

-- Muestra el mes y año de los pedidos junto con la cantidad total de productos vendidos en cada mes,
-- ordenados por año y mes de forma ascendente.
SELECT YEAR(O.OrderDate) AS AñoORDEN, MONTH(O.OrderDate) AS MesOrden, SUM(OD.Quantity) AS TotalSold
FROM Orders O
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY OrderDate
ORDER BY AñoORDEN ASC, MesOrden ASC;

-- Muestra el nombre del empleado, el número total de pedidos procesados por el empleado,
-- y el promedio de cantidad de productos por pedido para ese empleado.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COUNT(O.OrderID) AS TotalOrders, AVG(OD.Quantity) AS AvgQuantityPerOrder
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY E.FirstName, E.LastName

-- Muestra los nombres de los productos y sus precios unitarios, ordenados por precio de forma ascendente.
SELECT P.ProductName, P.UnitPrice
FROM Products P
INNER JOIN Categories C ON P.CategoryID = C.CategoryID
ORDER BY P.UnitPrice;

-- Muestra la cantidad total de productos vendidos por categoría y muestra solo las categorías con más de 100 unidades vendidas en total.
SELECT C.CategoryName, SUM(OD.Quantity) AS TotalSold
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
INNER JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY C.CategoryName
HAVING SUM(OD.Quantity) > 100;

-- Muestra el número de pedidos realizados por cada cliente y muestra solo aquellos clientes que han realizado más de 5 pedidos.
SELECT C.CompanyName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
HAVING COUNT(O.OrderID) > 5;

-- Muestra el nombre completo de los empleados y sus ciudades de residencia, concatenados en una sola columna.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreCompleto, E.City
FROM Employees E;

-- Muestra el nombre de la categoría y el precio promedio de los productos en esa categoría,
-- y muestra solo las categorías donde el precio promedio es superior a $50.
SELECT C.CategoryName, AVG(P.UnitPrice) AS Precio
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName
HAVING AVG(P.UnitPrice) > 50;

-- Muestra el año de pedido y la cantidad total de productos vendidos en ese año,
-- agrupados por año de pedido.
SELECT YEAR(O.OrderDate) AS AñoOrden, SUM(OD.Quantity) AS Total
FROM Orders O
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY OrderDate;

-- Muestra el nombre de la categoría y el precio mínimo de los productos en cada categoría.
SELECT C.CategoryName AS NombreCategoría, MIN(P.UnitPrice) AS PrecioMínimo
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY CategoryName;

-- Muestra los nombres de los productos y sus unidades en stock, ordenados por unidades en stock de forma descendente.
SELECT P.ProductName, P.UnitsInStock
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID
ORDER BY P.UnitsInStock DESC;

-- Muestra la cantidad total de productos vendidos por proveedor y muestra solo los proveedores con más de 200 unidades vendidas en total.
SELECT S.CompanyName AS NombreProveedor, SUM(OD.Quantity) AS TotalVendido
FROM Suppliers S
INNER JOIN Products P ON S.SupplierID = P.SupplierID
INNER JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY S.CompanyName
HAVING SUM(OD.Quantity) > 200;

-- Muestra el número de pedidos realizados por cada empleado y muestra solo aquellos empleados que han procesado más de 15 pedidos.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COUNT(O.OrderID) AS TotalPedidos
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName, E.LastName
HAVING COUNT(O.OrderID) > 15;

-- Muestra el nombre completo de los clientes y sus ciudades de residencia, concatenados en una sola columna.
SELECT CONCAT(C.ContactName, ' ', C.ContactTitle) AS NombreCompleto, C.City
FROM Customers C;

-- Muestra el nombre de la categoría y el precio promedio de los productos en esa categoría,
-- y muestra solo las categorías donde el precio promedio es superior a $60.
SELECT C.CategoryName AS NombreCategoría, AVG(P.UnitPrice) AS PrecioPromedio
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName
HAVING AVG(P.UnitPrice) > 60;

-- Muestra los nombres de los productos y sus fechas de inicio de disponibilidad, ordenados por año de disponibilidad de forma descendente.
SELECT P.ProductName, YEAR(P.Discontinued) AS AñoDescontinuado
FROM Products P
ORDER BY AñoDescontinuado DESC;

-- Muestra el año de pedido y la cantidad total de productos vendidos en ese año,
-- agrupados por año de pedido.
SELECT YEAR(O.OrderDate) AS AñoPedido, SUM(OD.Quantity) AS TotalVendido
FROM Orders O
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY OrderDate;

-- Muestra el nombre del producto más barato en cada categoría.
SELECT C.CategoryName, MIN(P.UnitPrice) AS PrecioMínimo
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName;

-- Muestra el nombre del país y el número total de pedidos realizados desde ese país.
SELECT C.Country AS NombrePaís, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.Country;

-- Muestra el año de pedido y la cantidad total de productos vendidos en ese año,
-- agrupados por año de pedido.
SELECT YEAR(O.OrderDate) AS AñoPedido, SUM(OD.Quantity) AS TotalVendido
FROM Orders O
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY YEAR(O.OrderDate);

-- Muestra el nombre del producto y la cantidad total de veces que se ha pedido ese producto,
-- agrupados por nombre del producto.
SELECT P.ProductName AS NombreProducto, COUNT(OD.Quantity) AS TotalVecesPedido
FROM Products P
INNER JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra el nombre del empleado y el promedio de la cantidad de productos por pedido procesado por ese empleado,
-- agrupados por nombre del empleado.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, AVG(OD.Quantity) AS PromedioCantidadPorPedido
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY FirstName, LastName;

-- Muestra el nombre de la categoría y el precio mínimo de los productos en cada categoría,
-- agrupados por nombre de la categoría.
SELECT C.CategoryName AS NombreCategoría, MIN(P.UnitPrice) AS PrecioMínimo
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY CategoryName;

-- Muestra el nombre del cliente y la cantidad total gastada por cada cliente en productos,
-- agrupados por nombre del cliente.
SELECT C.CompanyName AS NombreCliente, SUM(P.UnitPrice * OD.Quantity) AS TotalGastado
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY CompanyName;

-- Muestra el nombre de la ciudad y el número total de pedidos realizados desde cada ciudad,
-- agrupados por nombre de la ciudad.
SELECT C.City AS NombreCiudad, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY City;

-- Muestra el nombre del producto y el precio promedio de los productos,
-- agrupados por nombre del producto.
SELECT P.ProductName AS NombreProducto, AVG(P.UnitPrice) AS PrecioPromedio
FROM Products P
GROUP BY ProductName;

-- Muestra el nombre del empleado y el número total de pedidos procesados por ese empleado,
-- agrupados por nombre del empleado.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COUNT(O.OrderID) AS TotalPedidos
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY FirstName, LastName;

-- Muestra el nombre del producto y la cantidad total de unidades en stock de ese producto,
-- agrupados por nombre del producto.
SELECT P.ProductName AS NombreProducto, SUM(P.UnitsInStock) AS TotalUnidadesEnStock
FROM Products P
GROUP BY ProductName;

-- Muestra el nombre del cliente y el número total de pedidos realizados por ese cliente,
-- agrupados por nombre del cliente.
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CompanyName;
-- Muestra el nombre del proveedor y el total de unidades vendidas de todos los productos de ese proveedor,
-- agrupados por nombre del proveedor.
SELECT S.CompanyName AS NombreProveedor, SUM(OD.Quantity) AS TotalUnidadesVendidas
FROM Suppliers S
INNER JOIN Products P ON S.SupplierID = P.SupplierID
INNER JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY CompanyName;

-- Muestra el nombre de la categoría y el número total de productos en cada categoría,
-- agrupados por nombre de la categoría.
SELECT C.CategoryName AS NombreCategoría, COUNT(P.ProductID) AS TotalProductos
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY CategoryName;

-- Muestra el nombre del producto y el precio promedio de los productos en cada categoría,
-- agrupados por nombre del producto.
SELECT P.ProductName AS NombreProducto, AVG(P.UnitPrice) AS PrecioPromedio
FROM Products P
GROUP BY ProductName;

-- Muestra el nombre del cliente y el total gastado por cada cliente en productos,
-- agrupados por nombre del cliente.
SELECT C.CompanyName AS NombreCliente, SUM(P.UnitPrice * OD.Quantity) AS TotalGastado
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY CompanyName;

-- Muestra el nombre de la ciudad y el número total de pedidos realizados desde cada ciudad,
-- agrupados por nombre de la ciudad.
SELECT C.City AS NombreCiudad, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY City;

-- Muestra el nombre del empleado y la cantidad promedio de productos por pedido procesado por ese empleado,
-- agrupados por nombre del empleado.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, AVG(OD.Quantity) AS CantidadPromedioPorPedido
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY FirstName, LastName;

-- Muestra el nombre del producto y el total de unidades vendidas de ese producto,
-- agrupados por nombre del producto.
SELECT P.ProductName AS NombreProducto, SUM(OD.Quantity) AS TotalUnidadesVendidas
FROM Products P
INNER JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra el nombre de la categoría y la cantidad total de productos en cada categoría,
-- agrupados por nombre de la categoría, pero excluyendo las categorías que tienen menos de 10 productos.
SELECT C.CategoryName AS NombreCategoría, COUNT(P.ProductID) AS TotalProductos
FROM Categories C
INNER JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY CategoryName
HAVING COUNT(P.ProductID) >= 10;

--LEFT JOIN
-- Muestra todos los clientes y sus pedidos correspondientes (si los tienen).
SELECT C.CompanyName AS NombreCliente, O.OrderID
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;

-- Muestra todos los productos y su categoría correspondiente (si están categorizados).
SELECT P.ProductName AS NombreProducto, C.CategoryName AS Categoria
FROM Products P
LEFT JOIN Categories C ON P.CategoryID = C.CategoryID;

-- Muestra el nombre de cada empleado y la cantidad total de pedidos que ha procesado (incluso si no ha procesado ningún pedido).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COUNT(O.OrderID) AS TotalPedidos
FROM Employees E
LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY FirstName, LastName;

-- Muestra el nombre de cada producto y la cantidad total de unidades vendidas de ese producto (incluso si no se ha vendido ninguna unidad).
SELECT P.ProductName AS NombreProducto, SUM(OD.Quantity) AS TotalUnidadesVendidas
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra todos los proveedores y los productos que suministran (incluso si no suministran ningún producto).
SELECT S.CompanyName AS NombreProveedor, P.ProductName AS NombreProducto
FROM Suppliers S
LEFT JOIN Products P ON S.SupplierID = P.SupplierID;

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CompanyName;

-- Muestra el nombre de cada producto y la cantidad total de unidades en stock de ese producto (incluso si no se tiene ninguna unidad en stock).
SELECT P.ProductName AS NombreProducto, SUM(P.UnitsInStock) AS TotalUnidadesEnStock
FROM Products P
LEFT JOIN Products S ON P.ProductID = S.ProductID
GROUP BY P.ProductName;

-- Muestra todos los pedidos y sus detalles de pedido correspondientes (incluso si no tienen detalles de pedido).
SELECT O.OrderID, P.ProductName AS NombreProducto, OD.Quantity
FROM Orders O
LEFT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
LEFT JOIN Products P ON OD.ProductID = P.ProductID;

-- Muestra el nombre de cada cliente y el promedio de los montos de sus pedidos (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, AVG(O.OrderAmount) AS PromedioMontoPedido
FROM Customers C
LEFT JOIN (
  SELECT CustomerID, OrderID, SUM(Freight) AS OrderAmount
  FROM Orders
  GROUP BY CustomerID, OrderID
) O ON C.CustomerID = O.CustomerID
GROUP BY CompanyName;

-- Muestra el nombre de cada producto y el precio máximo de venta de ese producto (incluso si no se ha vendido ninguna unidad).
SELECT P.ProductName AS NombreProducto, MAX(OD.UnitPrice) AS PrecioMaximoVenta
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra todos los productos y la cantidad total de unidades vendidas de ese producto (incluso si no se han vendido unidades).
SELECT P.ProductName AS NombreProducto, SUM(ISNULL(OD.Quantity, 0)) AS TotalUnidadesVendidas
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra el nombre de cada categoría y la cantidad total de productos en esa categoría (incluso si no hay productos en esa categoría).
SELECT C.CategoryName AS NombreCategoría, SUM(ISNULL(P.ProductID, 0)) AS TotalProductos
FROM Categories C
LEFT JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY CategoryName;

-- Muestra el nombre de cada producto y el precio promedio de venta de ese producto (incluso si no se ha vendido ninguna unidad).
SELECT P.ProductName AS NombreProducto, AVG(ISNULL(OD.UnitPrice, 0)) AS PrecioPromedioVenta
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra todos los proveedores y la cantidad de productos que suministran (incluso si no suministran productos).
SELECT S.CompanyName AS NombreProveedor, COUNT(P.ProductID) AS TotalProductosSuministrados
FROM Suppliers S
LEFT JOIN Products P ON S.SupplierID = P.SupplierID
GROUP BY CompanyName;

-- Muestra todos los empleados y sus pedidos correspondientes (incluso si no han realizado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, O.OrderID
FROM Employees E
LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID;

-- Muestra el nombre de cada producto y la cantidad máxima vendida de ese producto (incluso si no se ha vendido ninguna unidad).
SELECT P.ProductName AS NombreProducto, MAX(ISNULL(OD.Quantity, 0)) AS MaxUnidadesVendidas
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra el nombre de cada empleado y el promedio de la cantidad de productos por pedido procesado por ese empleado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, AVG(ISNULL(OD.Quantity, 0)) AS CantidadPromedioPorPedido
FROM Employees E
LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID
LEFT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY FirstName, LastName;

-- Muestra todos los productos y su proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Products P
LEFT JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Consultas con LEFT JOIN --

-- Muestra el nombre de cada producto y la cantidad máxima vendida de ese producto (incluso si no se ha vendido ninguna unidad).
SELECT P.ProductName AS NombreProducto, MAX(ISNULL(OD.Quantity, 0)) AS MaxUnidadesVendidas
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra el nombre de cada cliente y la fecha del primer pedido que realizaron (incluso si no han realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CompanyName;


-- Muestra el nombre de cada cliente y el país en el que se encuentra (incluso si no tienen país registrado).
SELECT C.CompanyName AS NombreCliente, COALESCE(C.Country, 'Desconocido') AS País
FROM Customers C;

-- Muestra el nombre de cada empleado y el nombre del jefe bajo el cual trabajan (incluso si no tienen jefe asignado).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(M.FirstName, ' ', M.LastName) AS Jefe
FROM Employees E
LEFT JOIN Employees M ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada producto y su precio de compra promedio (incluso si no se ha comprado ningún producto).
SELECT P.ProductName AS NombreProducto, AVG(ISNULL(OD.UnitPrice, 0)) AS PrecioCompraPromedio
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra el nombre de cada proveedor y la cantidad total de productos que suministran (incluso si no suministran productos).
SELECT S.CompanyName AS NombreProveedor, COUNT(P.ProductID) AS TotalProductosSuministrados
FROM Suppliers S
LEFT JOIN Products P ON S.SupplierID = P.SupplierID
GROUP BY CompanyName;

-- Muestra el nombre de cada empleado y su fecha de nacimiento (incluso si no tienen fecha de nacimiento registrada).
-- Muestra el nombre de cada empleado y su fecha de nacimiento (incluso si no tienen fecha de nacimiento registrada).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, 
       CASE 
           WHEN E.BirthDate IS NOT NULL THEN CONVERT(VARCHAR(10), E.BirthDate, 103)
           ELSE 'Fecha Desconocida'
       END AS FechaNacimiento
FROM Employees E;


-- Muestra el nombre de cada cliente y la fecha del primer pedido que realizaron (incluso si no han realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CompanyName;

-- Muestra el nombre de cada empleado y el nombre de la ciudad en la que viven (incluso si no tienen ciudad registrada).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COALESCE(E.City, 'Ciudad Desconocida') AS Ciudad
FROM Employees E;

-- Muestra el nombre de cada producto y el nombre del proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Products P
LEFT JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Consultas con LEFT JOIN --

-- Muestra el nombre de cada empleado y el nombre de su supervisor (incluso si no tienen supervisor).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(S.FirstName, ' ', S.LastName) AS Supervisor
FROM Employees E
LEFT JOIN Employees S ON E.ReportsTo = S.EmployeeID;

-- Muestra el nombre de cada cliente y su ciudad (incluso si no tienen ciudad registrada).
SELECT C.CompanyName AS NombreCliente, COALESCE(C.City, 'Ciudad Desconocida') AS Ciudad
FROM Customers C;

-- Muestra el nombre de cada producto y su precio de venta promedio (incluso si no se ha vendido ninguna unidad).
SELECT P.ProductName AS NombreProducto, AVG(ISNULL(OD.UnitPrice, 0)) AS PrecioVentaPromedio
FROM Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

-- Muestra el nombre de cada proveedor y su país (incluso si no tienen país registrado).
SELECT S.CompanyName AS NombreProveedor, COALESCE(S.Country, 'País Desconocido') AS País
FROM Suppliers S;

-- Muestra el nombre de cada empleado y el total de productos vendidos por ese empleado (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID
LEFT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY FirstName, LastName;

-- Muestra el nombre de cada cliente y la fecha del último pedido que realizaron (incluso si no han realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, MAX(O.OrderDate) AS ÚltimaFechaPedido
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CompanyName;

-- Muestra el nombre de cada producto y la cantidad total de unidades en stock de ese producto (incluso si no se tiene ninguna unidad en stock).
SELECT P.ProductName AS NombreProducto, SUM(ISNULL(P.UnitsInStock, 0)) AS TotalUnidadesEnStock
FROM Products P
GROUP BY Productname;

-- Muestra el nombre de cada empleado y su fecha de contratación (incluso si no tienen fecha de contratación registrada).
-- Muestra el nombre de cada empleado y su fecha de contratación (incluso si no tienen fecha de contratación registrada).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, 
       CASE 
           WHEN E.HireDate IS NOT NULL THEN CONVERT(VARCHAR(10), E.HireDate, 103)
           ELSE 'Fecha de Contratación Desconocida'
       END AS FechaContratación
FROM Employees E;


-- Muestra el nombre de cada cliente y su código postal (incluso si no tienen código postal registrado).
SELECT C.CompanyName AS NombreCliente, COALESCE(C.PostalCode, 'Código Postal Desconocido') AS CódigoPostal
FROM Customers C;

-- Muestra el nombre de cada producto y su cantidad mínima en stock (incluso si no se ha establecido una cantidad mínima).
SELECT P.ProductName AS NombreProducto, COALESCE(P.ReorderLevel, 0) AS CantidadMínimaEnStock
FROM Products P;

-- Muestra el nombre de cada empleado y el nombre del territorio que supervisa (incluso si no supervisan territorios).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, T.TerritoryDescription AS TerritorioSupervisado
FROM Employees E
LEFT JOIN EmployeeTerritories ET ON E.EmployeeID = ET.EmployeeID
LEFT JOIN Territories T ON ET.TerritoryID = T.TerritoryID;

-- Muestra el nombre de cada empleado y el nombre del territorio que supervisa (incluso si no supervisan territorios).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, T.TerritoryDescription AS TerritorioSupervisado
FROM Employees E
LEFT JOIN EmployeeTerritories ET ON E.EmployeeID = ET.EmployeeID
LEFT JOIN Territories T ON ET.TerritoryID = T.TerritoryID;


-- Muestra el nombre de cada producto y su proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Products P
LEFT JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Muestra el nombre de cada empleado y su título (incluso si no tienen título registrado).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COALESCE(E.Title, 'Título Desconocido') AS Título
FROM Employees E;

-- Muestra el nombre de cada cliente y su ciudad (incluso si no tienen ciudad registrada).
SELECT C.CompanyName AS NombreCliente, COALESCE(C.City, 'Ciudad Desconocida') AS Ciudad
FROM Customers C;

-- Muestra el nombre de cada producto y su categoría correspondiente (incluso si no están categorizados).
SELECT P.ProductName AS NombreProducto, C.CategoryName AS Categoria
FROM Products P
LEFT JOIN Categories C ON P.CategoryID = C.CategoryID;

-- Muestra el nombre de cada empleado y la cantidad total de productos que ha vendido (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID
LEFT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY FirstName, LastName;

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CompanyName;

-- Muestra el nombre de cada empleado y la fecha de su primer pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Employees E
LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY FirstName, LastName;

-- Muestra el nombre de cada producto y la cantidad mínima en stock (incluso si no se ha establecido una cantidad mínima).
SELECT P.ProductName AS NombreProducto, COALESCE(P.ReorderLevel, 0) AS CantidadMínimaEnStock
FROM Products P;


--RIGT JOIN

-- Muestra el nombre de cada empleado y el nombre de su jefe (incluso si algunos empleados no tienen jefe).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(M.FirstName, ' ', M.LastName) AS Jefe
FROM Employees M
RIGHT JOIN Employees E ON E.ReportsTo = M.EmployeeID;


-- Muestra el nombre de cada empleado y la fecha de su último pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MAX(O.OrderDate) AS ÚltimaFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);


-- Muestra el nombre de cada producto y el nombre de su proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Suppliers S
RIGHT JOIN Products P ON S.SupplierID = P.SupplierID;

-- Muestra el nombre de cada empleado y su título (incluso si no tienen título registrado).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COALESCE(E.Title, 'Título Desconocido') AS Título
FROM Employees E
RIGHT JOIN Employees M ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada empleado y el nombre de su jefe (incluso si algunos empleados no tienen jefe).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(M.FirstName, ' ', M.LastName) AS Jefe
FROM Employees M
RIGHT JOIN Employees E ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada producto y su categoría correspondiente (incluso si no están categorizados).
SELECT P.ProductName AS NombreProducto, C.CategoryName AS Categoria
FROM Categories C
RIGHT JOIN Products P ON C.CategoryID = P.CategoryID;

-- Muestra el nombre de cada empleado y la cantidad total de productos que ha vendido (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
RIGHT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName;

-- Muestra el nombre de cada empleado y la fecha de su primer pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y la cantidad mínima en stock (incluso si no se ha establecido una cantidad mínima).
SELECT P.ProductName AS NombreProducto, COALESCE(P.ReorderLevel, 0) AS CantidadMínimaEnStock
FROM Products P
RIGHT JOIN Suppliers S ON P.SupplierID = S.SupplierID;


-- Muestra el nombre de cada empleado y el nombre de su jefe (incluso si algunos empleados no tienen jefe).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(M.FirstName, ' ', M.LastName) AS Jefe
FROM Employees M
RIGHT JOIN Employees E ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada producto y el nombre de su proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Suppliers S
RIGHT JOIN Products P ON S.SupplierID = P.SupplierID;

-- Muestra el nombre de cada empleado y su título (incluso si no tienen título registrado).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COALESCE(E.Title, 'Título Desconocido') AS Título
FROM Employees E
RIGHT JOIN Employees M ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada empleado y la cantidad total de productos que ha vendido (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
RIGHT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y su categoría correspondiente (incluso si no están categorizados).
SELECT P.ProductName AS NombreProducto, C.CategoryName AS Categoria
FROM Categories C
RIGHT JOIN Products P ON C.CategoryID = P.CategoryID;

-- Muestra el nombre de cada empleado y la cantidad total de productos que ha vendido (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
RIGHT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName;

-- Muestra el nombre de cada empleado y la fecha de su primer pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y la cantidad mínima en stock (incluso si no se ha establecido una cantidad mínima).
SELECT P.ProductName AS NombreProducto, COALESCE(P.ReorderLevel, 0) AS CantidadMínimaEnStock
FROM Products P
RIGHT JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Muestra el nombre de cada empleado y la fecha de su último pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MAX(O.OrderDate) AS ÚltimaFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);


-- Muestra el nombre de cada producto y la cantidad total vendida en todas las órdenes (incluso si algunos productos no se han vendido).
SELECT P.ProductName AS NombreProducto, SUM(ISNULL(OD.Quantity, 0)) AS TotalVendido
FROM Products P
RIGHT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName;

-- Muestra el nombre de cada producto y su categoría correspondiente (incluso si no están categorizados).
SELECT P.ProductName AS NombreProducto, C.CategoryName AS Categoria
FROM Categories C
RIGHT JOIN Products P ON C.CategoryID = P.CategoryID;

-- Muestra el nombre de cada empleado y la fecha de su primer pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y la cantidad mínima en stock (incluso si no se ha establecido una cantidad mínima).
SELECT P.ProductName AS NombreProducto, COALESCE(P.ReorderLevel, 0) AS CantidadMínimaEnStock
FROM Products P
RIGHT JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Muestra el nombre de cada empleado y la fecha de su último pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MAX(O.OrderDate) AS ÚltimaFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName;

-- Muestra el nombre de cada empleado y el nombre de su jefe (incluso si algunos empleados no tienen jefe).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(M.FirstName, ' ', M.LastName) AS Jefe
FROM Employees M
RIGHT JOIN Employees E ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada producto y el nombre de su proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Suppliers S
RIGHT JOIN Products P ON S.SupplierID = P.SupplierID;

-- Muestra el nombre de cada empleado y su título (incluso si no tienen título registrado).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COALESCE(E.Title, 'Título Desconocido') AS Título
FROM Employees E
RIGHT JOIN Employees M ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada empleado y la cantidad total de productos que ha vendido (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
RIGHT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);


-- Muestra el nombre de cada empleado y su título (incluso si no tienen título registrado).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, COALESCE(E.Title, 'Título Desconocido') AS Título
FROM Employees E
RIGHT JOIN Employees M ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada empleado y la cantidad total de productos que ha vendido (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
RIGHT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y su categoría correspondiente (incluso si no están categorizados).
SELECT P.ProductName AS NombreProducto, C.CategoryName AS Categoría
FROM Categories C
RIGHT JOIN Products P ON C.CategoryID = P.CategoryID;

-- Muestra el nombre de cada empleado y la fecha de su primer pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y la cantidad mínima en stock (incluso si no se ha establecido una cantidad mínima).
SELECT P.ProductName AS NombreProducto, COALESCE(P.ReorderLevel, 0) AS CantidadMínimaEnStock
FROM Products P
RIGHT JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName;

-- Muestra el nombre de cada empleado y la fecha de su último pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MAX(O.OrderDate) AS ÚltimaFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y el nombre de su proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Suppliers S
RIGHT JOIN Products P ON S.SupplierID = P.SupplierID;

-- Muestra el nombre de cada producto y su precio unitario más bajo (incluso si no tienen precio registrado).
SELECT P.ProductName AS NombreProducto, MIN(ISNULL(P.UnitPrice, 0)) AS PrecioUnitarioMásBajo
FROM Products P
RIGHT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName;

-- Muestra el nombre de cada empleado y el nombre de su jefe (incluso si algunos empleados no tienen jefe).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(M.FirstName, ' ', M.LastName) AS Jefe
FROM Employees M
RIGHT JOIN Employees E ON E.ReportsTo = M.EmployeeID;

--Muestra el nombre de cada producto y el precio promedio de venta (incluso si no se han vendido productos).
SELECT P.ProductName AS NombreProducto, AVG(ISNULL(OD.UnitPrice, 0)) AS PrecioPromedioVenta
FROM Products P
RIGHT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName;

-- Muestra el nombre de cada producto y su categoría correspondiente (incluso si no están categorizados).
SELECT P.ProductName AS NombreProducto, C.CategoryName AS Categoría
FROM Categories C
RIGHT JOIN Products P ON C.CategoryID = P.CategoryID;

-- Muestra el nombre de cada empleado y la fecha de su primer pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MIN(O.OrderDate) AS PrimeraFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y la cantidad mínima en stock (incluso si no se ha establecido una cantidad mínima).
SELECT P.ProductName AS NombreProducto, COALESCE(P.ReorderLevel, 0) AS CantidadMínimaEnStock
FROM Products P
RIGHT JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado (incluso si no ha realizado ningún pedido).
SELECT C.CompanyName AS NombreCliente, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName;

-- Muestra el nombre de cada empleado y la fecha de su último pedido procesado (incluso si no han procesado pedidos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, MAX(O.OrderDate) AS ÚltimaFechaPedido
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada producto y el nombre de su proveedor correspondiente (incluso si algunos productos no tienen proveedor).
SELECT P.ProductName AS NombreProducto, S.CompanyName AS Proveedor
FROM Suppliers S
RIGHT JOIN Products P ON S.SupplierID = P.SupplierID;

-- Muestra el nombre de cada empleado y la cantidad total de productos que ha vendido (incluso si no han vendido productos).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, SUM(ISNULL(OD.Quantity, 0)) AS TotalProductosVendidos
FROM Employees E
RIGHT JOIN Orders O ON E.EmployeeID = O.EmployeeID
RIGHT JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY CONCAT(E.FirstName, ' ', E.LastName);

-- Muestra el nombre de cada empleado y el nombre de su jefe (incluso si algunos empleados no tienen jefe).
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS NombreEmpleado, CONCAT(M.FirstName, ' ', M.LastName) AS Jefe
FROM Employees M
RIGHT JOIN Employees E ON E.ReportsTo = M.EmployeeID;

-- Muestra el nombre de cada producto y la cantidad total vendida en todas las órdenes (incluso si algunos productos no se han vendido).
SELECT P.ProductName AS NombreProducto, SUM(ISNULL(OD.Quantity, 0)) AS TotalVendido
FROM Products P
RIGHT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName;

--FULL JOIN PUBS

Use Pubs


-- Muestra el nombre de cada autor y el título de sus libros (incluso si algunos autores no tienen libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(T.title, 'Sin Libros') AS TituloLibro
FROM authors A
FULL JOIN titleauthor TA ON A.au_id = TA.au_id
FULL JOIN titles T ON TA.title_id = T.title_id;

-- Muestra el nombre de cada editor y el título de los libros que han publicado (incluso si algunos editores no tienen libros publicados).
SELECT P.pub_name AS NombreEditor, COALESCE(T.title, 'Sin Libros Publicados') AS TituloLibro
FROM publishers P
FULL JOIN titles T ON P.pub_id = T.pub_id;

-- Muestra el nombre de cada empleado de ventas y el nombre de los títulos que han vendido (incluso si algunos empleados no han vendido títulos).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, COALESCE(T.title, 'Sin Ventas') AS TituloVendido
FROM employee E
FULL JOIN sales S ON E.emp_id = S.stor_id
FULL JOIN titles T ON S.title_id = T.title_id;

-- Muestra el nombre de cada título y el nombre de los autores que lo han escrito (incluso si algunos títulos no tienen autores).
SELECT T.title AS Titulo, COALESCE(A.au_fname, 'Sin Autores') AS NombreAutor, COALESCE(A.au_lname, 'Sin Autores') AS ApellidoAutor
FROM titles T
FULL JOIN titleauthor TA ON T.title_id = TA.title_id
FULL JOIN authors A ON TA.au_id = A.au_id;

-- Muestra el nombre de cada autor y el título de los libros que han escrito (incluso si algunos autores no tienen libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(T.title, 'Sin Libros') AS TituloLibro
FROM authors A
FULL JOIN titleauthor TA ON A.au_id = TA.au_id
FULL JOIN titles T ON TA.title_id = T.title_id;

-- Muestra el nombre de cada autor y su estado (incluso si algunos autores no tienen estado registrado).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(A.state, 'Sin Estado') AS Estado
FROM authors A;

-- Muestra el nombre de cada editor y la cantidad total de libros publicados por cada uno (incluso si algunos editores no han publicado libros).
SELECT P.pub_name AS NombreEditor, COALESCE(COUNT(T.title_id), 0) AS TotalLibrosPublicados
FROM publishers P
FULL JOIN titles T ON P.pub_id = T.pub_id
GROUP BY P.pub_name;

-- Muestra el nombre de cada título y la cantidad de ejemplares vendidos (incluso si algunos títulos no se han vendido).
SELECT T.title AS TituloLibro, COALESCE(SUM(S.qty), 0) AS CantidadVendida
FROM titles T
FULL JOIN sales S ON T.title_id = S.title_id
GROUP BY T.title;

-- Muestra el nombre de cada empleado de ventas y la cantidad total de títulos vendidos (incluso si algunos empleados no han vendido títulos).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, COALESCE(SUM(S.qty), 0) AS TotalTitulosVendidos
FROM employee E
FULL JOIN sales S ON E.emp_id = S.stor_id
GROUP BY E.emp_id, E.fname, E.lname;

-- Muestra el nombre de cada empleado y el nombre de los títulos que han vendido (incluso si algunos empleados no han vendido títulos).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, COALESCE(T.title, 'Sin Ventas') AS TituloVendido
FROM employee E
FULL JOIN sales S ON E.emp_id = S.Stor_id
FULL JOIN titles T ON S.title_id = T.title_id;

-- Muestra el nombre de cada autor y el número de libros que han escrito (incluso si algunos autores no han escrito libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COUNT(T.title_id) AS TotalLibrosEscritos
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
GROUP BY A.au_fname, A.au_lname;

-- Muestra el nombre de cada editor y la cantidad total de copias vendidas de los libros que han publicado (incluso si algunos editores no han publicado libros).
SELECT P.pub_name AS NombreEditor, COALESCE(SUM(S.qty), 0) AS TotalCopiasVendidas
FROM publishers P
LEFT JOIN titles T ON P.pub_id = T.pub_id
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY P.pub_name;

-- Muestra el nombre de cada empleado y el número total de títulos que han vendido (incluso si algunos empleados no han vendido títulos).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, COALESCE(COUNT(S.title_id), 0) AS TotalTitulosVendidos
FROM employee E
LEFT JOIN sales S ON E.emp_id = S.stor_id
GROUP BY E.emp_id, E.fname, E.lname;

-- Muestra el nombre de cada título y la cantidad total de copias vendidas (incluso si algunos títulos no se han vendido).
SELECT T.title AS TituloLibro, COALESCE(SUM(S.qty), 0) AS CantidadTotalCopiasVendidas
FROM titles T
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY T.title;

-- Muestra el nombre de cada autor y la cantidad total de ejemplares vendidos de sus libros (incluso si algunos autores no han vendido libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(SUM(S.qty), 0) AS TotalEjemplaresVendidos
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY A.au_fname, A.au_lname;

-- Muestra el nombre de cada empleado de ventas y la cantidad total de copias vendidas de los libros que han vendido (incluso si algunos empleados no han vendido títulos).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, COALESCE(SUM(S.qty), 0) AS TotalCopiasVendidas
FROM employee E
LEFT JOIN sales S ON E.emp_id = S.stor_id
LEFT JOIN titles T ON S.title_id = T.title_id
GROUP BY E.emp_id, E.fname, E.lname;

-- Muestra el nombre de cada título y el nombre de los autores que lo han escrito (incluso si algunos títulos no tienen autores).
SELECT T.title AS TituloLibro, COALESCE(AU.au_fname, 'Sin Autores') AS NombreAutor, COALESCE(AU.au_lname, 'Sin Autores') AS ApellidoAutor
FROM titles T
LEFT JOIN titleauthor TA ON T.title_id = TA.title_id
LEFT JOIN authors AU ON TA.au_id = AU.au_id;

-- Muestra el nombre de cada autor y la cantidad total de libros publicados (incluso si algunos autores no han publicado libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(COUNT(TA.title_id), 0) AS TotalLibrosPublicados
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
GROUP BY A.au_fname, A.au_lname;

-- Muestra el nombre de cada título y la cantidad total de copias vendidas de primera edición (incluso si algunos títulos no tienen copias de primera edición vendidas).
SELECT T.title AS TituloLibro, COALESCE(SUM(S.qty), 0) AS CopiasPrimeraEdicionVendidas
FROM titles T
LEFT JOIN sales S ON T.title_id = S.title_id
WHERE T.type = 'first edition'
GROUP BY T.title;

-- Muestra el nombre de cada título y la cantidad total de copias no vendidas (incluso si algunos títulos no tienen copias no vendidas).
SELECT T.title AS TituloLibro, COALESCE((T.ytd_sales - SUM(S.qty)), T.ytd_sales) AS CopiasNoVendidas
FROM titles T
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY T.title, T.ytd_sales;

-- Consultas adicionales sin enumerar para la base de datos "Pubs" --

-- Muestra el nombre de cada autor y el número de libros que han escrito (incluso si algunos autores no han escrito libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COUNT(T.title_id) AS TotalLibrosEscritos
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
GROUP BY A.au_fname, A.au_lname;

-- Muestra el nombre de cada editor y la cantidad total de copias vendidas de los libros que han publicado (incluso si algunos editores no han publicado libros).
SELECT P.pub_name AS NombreEditor, COALESCE(SUM(S.qty), 0) AS TotalCopiasVendidas
FROM publishers P
LEFT JOIN titles T ON P.pub_id = T.pub_id
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY P.pub_name;

-- Muestra el nombre de cada empleado y el número total de títulos que han vendido (incluso si algunos empleados no han vendido títulos).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, COALESCE(COUNT(S.title_id), 0) AS TotalTitulosVendidos
FROM employee E
LEFT JOIN sales S ON E.emp_id = S.stor_id
GROUP BY E.emp_id, E.fname, E.lname;

-- Muestra el nombre de cada título y la cantidad total de copias vendidas (incluso si algunos títulos no se han vendido).
SELECT T.title AS TituloLibro, COALESCE(SUM(S.qty), 0) AS CantidadTotalCopiasVendidas
FROM titles T
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY T.title;

-- Muestra el nombre de cada autor y la cantidad total de ejemplares vendidos de sus libros (incluso si algunos autores no han vendido libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(SUM(S.qty), 0) AS TotalEjemplaresVendidos
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY A.au_fname, A.au_lname;

-- Muestra el nombre de cada empleado de ventas y la cantidad total de copias vendidas de los libros que han vendido (incluso si algunos empleados no han vendido títulos).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, COALESCE(SUM(S.qty), 0) AS TotalCopiasVendidas
FROM employee E
LEFT JOIN sales S ON E.emp_id = S.stor_id
LEFT JOIN titles T ON S.title_id = T.title_id
GROUP BY E.emp_id, E.fname, E.lname;

-- Muestra el nombre de cada título y el nombre de los autores que lo han escrito (incluso si algunos títulos no tienen autores).
SELECT T.title AS TituloLibro, COALESCE(AU.au_fname, 'Sin Autores') AS NombreAutor, COALESCE(AU.au_lname, 'Sin Autores') AS ApellidoAutor
FROM titles T
LEFT JOIN titleauthor TA ON T.title_id = TA.title_id
LEFT JOIN authors AU ON TA.au_id = AU.au_id;

-- Muestra el nombre de cada autor y la cantidad total de libros publicados (incluso si algunos autores no han publicado libros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(COUNT(TA.title_id), 0) AS TotalLibrosPublicados
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
GROUP BY A.au_fname, A.au_lname;

-- Muestra el nombre de cada título y la cantidad total de copias vendidas de primera edición (incluso si algunos títulos no tienen copias de primera edición vendidas).
SELECT T.title AS TituloLibro, COALESCE(SUM(S.qty), 0) AS CopiasPrimeraEdicionVendidas
FROM titles T
LEFT JOIN sales S ON T.title_id = S.title_id
WHERE T.type = 'first edition'
GROUP BY T.title;

-- Muestra el nombre de cada autor y la cantidad total de libros publicados en cada ciudad (incluso si algunos autores no han publicado en ciertas ciudades).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(P.city, 'Sin Ciudad') AS Ciudad, COALESCE(COUNT(TA.title_id), 0) AS LibrosPublicadosEnCiudad
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
LEFT JOIN publishers PU ON T.pub_id = PU.pub_id
LEFT JOIN publishers P ON PU.pub_id = P.pub_id
GROUP BY A.au_fname, A.au_lname, P.city;

-- Muestra el nombre de cada título y la cantidad total de copias vendidas en cada género (incluso si algunos títulos no se han vendido en un género).
SELECT T.title AS TituloLibro, G.type AS Genero, COALESCE(SUM(S.qty), 0) AS CopiasVendidasEnGenero
FROM titles T
LEFT JOIN roysched RS ON T.title_id = RS.title_id
LEFT JOIN titles G ON RS.title_id = G.title_id
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY T.title, G.type;

-- Muestra el nombre de cada autor y la cantidad total de libros publicados en cada país (incluso si algunos autores no han publicado en ciertos países).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, COALESCE(PU.country, 'Sin País') AS Pais, COALESCE(COUNT(TA.title_id), 0) AS LibrosPublicadosEnPais
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
LEFT JOIN publishers PU ON T.pub_id = PU.pub_id
GROUP BY A.au_fname, A.au_lname, PU.country;

-- Muestra el nombre de cada título y la cantidad total de títulos publicados por cada género (incluso si algunos géneros no tienen títulos).
SELECT G.type AS Genero, COALESCE(COUNT(T.title_id), 0) AS TitulosPublicadosEnGenero
FROM titles T
LEFT JOIN roysched RS ON T.title_id = RS.title_id
LEFT JOIN titles G ON RS.title_id = G.title_id
GROUP BY G.type;


-- Muestra el nombre de cada título y la cantidad total de copias vendidas en cada año (incluso si algunos títulos no se han vendido en un año).
SELECT T.title AS TituloLibro, YEAR(S.ord_date) AS AñoVenta, COALESCE(SUM(S.qty), 0) AS CopiasVendidasEnAño
FROM titles T
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY T.title, YEAR(S.ord_date);

-- Muestra el nombre de cada autor y la cantidad total de libros publicados en cada género (incluso si algunos autores no han publicado en ciertos géneros).
SELECT A.au_fname AS NombreAutor, A.au_lname AS ApellidoAutor, G.type AS Genero, COALESCE(COUNT(TA.title_id), 0) AS LibrosPublicadosEnGenero
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
LEFT JOIN roysched RS ON T.title_id = RS.title_id
LEFT JOIN titles G ON RS.title_id = G.title_id
GROUP BY A.au_fname, A.au_lname, G.type;

-- Muestra el nombre de cada título y la cantidad total de títulos publicados en cada país (incluso si algunos títulos no se han publicado en ciertos países).
SELECT T.title AS TituloLibro, COALESCE(PU.country, 'Sin País') AS Pais, COALESCE(COUNT(T.title_id), 0) AS TitulosPublicadosEnPais
FROM titles T
LEFT JOIN publishers PU ON T.pub_id = PU.pub_id
GROUP BY T.title, PU.country;

-- Muestra el nombre de cada título y la cantidad total de títulos publicados por cada editor (incluso si algunos editores no han publicado títulos).
SELECT T.title AS TituloLibro, COALESCE(PU.pub_name, 'Sin Editor') AS Editor, COALESCE(COUNT(T.title_id), 0) AS TitulosPublicadosPorEditor
FROM titles T
LEFT JOIN publishers PU ON T.pub_id = PU.pub_id
GROUP BY T.title, PU.pub_name;

-- Muestra el nombre de cada título y la cantidad total de ejemplares en stock (incluso si algunos títulos no tienen ejemplares en stock).
SELECT T.title AS TituloLibro, COALESCE(SUM(T.ytd_sales), 0) AS EjemplaresEnStock
FROM titles T
GROUP BY T.title;

-- Muestra el nombre de cada empleado y la cantidad total de títulos que han vendido en cada mes (incluso si algunos empleados no han vendido en un mes).
SELECT E.emp_id AS IDEmpleado, E.fname AS NombreEmpleado, E.lname AS ApellidoEmpleado, MONTH(S.ord_date) AS MesVenta, COALESCE(SUM(S.qty), 0) AS TitulosVendidosEnMes
FROM employee E
LEFT JOIN sales S ON E.emp_id = S.stor_id
GROUP BY E.emp_id, E.fname, E.lname, MONTH(S.ord_date);

-- Muestra el nombre de cada título y la cantidad total de ejemplares no vendidos (incluso si algunos títulos no tienen ejemplares no vendidos).
SELECT T.title AS TituloLibro, COALESCE(SUM(S.qty), 0) AS EjemplaresNoVendidos
FROM titles T
LEFT JOIN sales S ON T.title_id = S.title_id
GROUP BY T.title;

