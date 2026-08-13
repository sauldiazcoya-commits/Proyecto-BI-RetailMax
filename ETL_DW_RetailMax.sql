use DW_RetailMax;
go


BULK INSERT DimCliente
FROM 'C:\BI\Clientes.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT DimProducto
FROM 'C:\BI\Productos.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT DimTienda
FROM 'C:\BI\Tiendas.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT DimVendedor
FROM 'C:\BI\Vendedores.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT DimMetodoPago
FROM 'C:\BI\MetodosPago.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT DimTiempo
FROM 'C:\BI\Calendario.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT FactVentas
FROM 'C:\BI\Ventas.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);

select*from DimCliente;
select*from DimProducto;
select*from DimTiempo;
select*from DimTienda
select*from DimMetodoPago;
select*from DimVendedor
select*from FactVentas;

--Ventas totales
SELECT SUM(Total) AS VentasTotales
FROM FactVentas;

--Cantidad por producto
SELECT
    P.Producto,
    SUM(F.Cantidad) AS CantidadVendida
FROM FactVentas F
INNER JOIN DimProducto P
    ON F.IdProducto = P.IdProducto
GROUP BY P.Producto
ORDER BY CantidadVendida DESC;

--Ventas por región
SELECT
    T.Region,
    SUM(F.Total) AS Ventas
FROM FactVentas F
INNER JOIN DimTienda T
    ON F.IdTienda = T.IdTienda
GROUP BY T.Region;

--Ventas totales
SELECT SUM(Total) AS VentasTotales
FROM FactVentas;

--Cantidad vendida
SELECT SUM(Cantidad) AS CantidadVendida
FROM FactVentas;

--Ticket promedio
SELECT AVG(Total) AS TicketPromedio
FROM FactVentas;

--Ventas por categoria
SELECT
    P.Categoria,
    SUM(F.Total) AS Ventas
FROM FactVentas F
INNER JOIN DimProducto P
    ON F.IdProducto = P.IdProducto
GROUP BY P.Categoria
ORDER BY Ventas DESC;

--Top mas vendidos
SELECT TOP 10
    P.Producto,
    SUM(F.Cantidad) AS CantidadVendida
FROM FactVentas F
INNER JOIN DimProducto P
    ON F.IdProducto = P.IdProducto
GROUP BY P.Producto
ORDER BY CantidadVendida DESC;

--Ventas por región
SELECT
    T.Region,
    SUM(F.Total) AS Ventas
FROM FactVentas F
INNER JOIN DimTienda T
    ON F.IdTienda = T.IdTienda
GROUP BY T.Region
ORDER BY Ventas DESC;

--Ventas por segmento de cliente
SELECT
    C.Segmento,
    SUM(F.Total) AS Ventas
FROM FactVentas F
INNER JOIN DimCliente C
    ON F.IdCliente = C.IdCliente
GROUP BY C.Segmento
ORDER BY Ventas DESC;

--Ventas por mes
SELECT
    T.Mes,
    SUM(F.Total) AS Ventas
FROM FactVentas F
INNER JOIN DimTiempo T
    ON F.Fecha = T.Fecha
GROUP BY T.Mes
ORDER BY T.Mes;