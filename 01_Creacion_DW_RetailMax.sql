create database DW_RetailMax;
go

use DW_RetailMax;
go

CREATE TABLE DimCliente
(
    IdCliente VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Sexo CHAR(1),
    Edad INT,
    Ciudad VARCHAR(50),
    Region VARCHAR(30),
    Segmento VARCHAR(30)
);

CREATE TABLE DimProducto
(
    IdProducto VARCHAR(10) PRIMARY KEY,
    Producto VARCHAR(100),
    Categoria VARCHAR(50),
    Marca VARCHAR(50),
    Precio DECIMAL(10,2)
);


CREATE TABLE DimTienda
(
    IdTienda VARCHAR(10) PRIMARY KEY,
    Tienda VARCHAR(100),
    Ciudad VARCHAR(50),
    Region VARCHAR(30)
);

CREATE TABLE DimVendedor
(
    IdVendedor VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    IdTienda VARCHAR(10)
);

CREATE TABLE DimMetodoPago
(
    IdMetodo INT PRIMARY KEY,
    Metodo VARCHAR(30)
);

CREATE TABLE DimTiempo
(
    Fecha DATE PRIMARY KEY,
    Dia INT,
    Mes INT,
    Anio INT,
    Trimestre INT
);

CREATE TABLE FactVentas
(
    IdVenta VARCHAR(10) PRIMARY KEY,
    Fecha DATE,
    IdCliente VARCHAR(10),
    IdProducto VARCHAR(10),
    IdTienda VARCHAR(10),
    IdVendedor VARCHAR(10),
    IdMetodo INT,
    Cantidad INT,
    Precio DECIMAL(10,2),
    Total DECIMAL(10,2)
);

ALTER TABLE FactVentas
ADD CONSTRAINT FK_FactVentas_Cliente
FOREIGN KEY (IdCliente)
REFERENCES DimCliente(IdCliente);

ALTER TABLE FactVentas
ADD CONSTRAINT FK_FactVentas_Producto
FOREIGN KEY (IdProducto)
REFERENCES DimProducto(IdProducto);

ALTER TABLE FactVentas
ADD CONSTRAINT FK_FactVentas_Tienda
FOREIGN KEY (IdTienda)
REFERENCES DimTienda(IdTienda);

ALTER TABLE FactVentas
ADD CONSTRAINT FK_FactVentas_Tiempo
FOREIGN KEY (Fecha)
REFERENCES DimTiempo(Fecha);

ALTER TABLE FactVentas
ADD CONSTRAINT FK_FactVentas_Vendedor
FOREIGN KEY (IdVendedor)
REFERENCES DimVendedor(IdVendedor);

ALTER TABLE FactVentas
ADD CONSTRAINT FK_FactVentas_MetodoPago
FOREIGN KEY (IdMetodo)
REFERENCES DimMetodoPago(IdMetodo);