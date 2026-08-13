Proyecto de Inteligencia de Negocios - RetailMax Perú S.A.C.


* Descripción: 
Proyecto académico de Inteligencia de Negocios desarrollado para RetailMax Perú S.A.C., orientado al análisis de ventas mediante la implementación de un Data Warehouse, procesos ETL con T-SQL y un dashboard interactivo desarrollado en Power BI.


* Objetivo:
Diseñar e implementar una solución de Inteligencia de Negocios que permita organizar, integrar y analizar la información de ventas de RetailMax Perú, facilitando la generación de indicadores y reportes para la toma de decisiones.


* Tecnologías utilizadas:
- SQL Server Developer
- T-SQL
- BULK INSERT
- Microsoft Power BI
- Microsoft Excel
- Archivos CSV


* Arquitectura:
El proyecto sigue el flujo:
CSV → ETL/T-SQL → SQL Server → Power BI → Dashboard


* Modelo dimensional:
El Data Warehouse utiliza un esquema estrella compuesto por:
- FactVentas
- DimCliente
- DimProducto
- DimTienda
- DimTiempo
- DimVendedor
- DimMetodoPago


* ETL:
- El proceso ETL permitió integrar los datos provenientes de archivos CSV hacia SQL Server.
- Se utilizaron instrucciones T-SQL, principalmente BULK INSERT, para realizar la carga de información hacia las tablas del Data Warehouse.
- Posteriormente, se realizaron validaciones de integridad referencial para comprobar la correcta relación entre la tabla de hechos y las dimensiones.


* Dashboard en Power BI:
Se desarrolló un dashboard interactivo en Power BI para analizar las ventas.
El dashboard permite analizar la información mediante diferentes dimensiones como:
- Periodo
- Productos
- Categorías
- Regiones
- Segmentos de clientes
- Métodos de pago


* KPIs
- Ventas Totales
- Cantidad Vendida
- Ticket Promedio


* Entregables
- Scripts SQL
- Archivos CSV
- Dashboard Power BI
- Informe final
- Presentación ejecutiva


* Resultados
- La solución desarrollada permitió centralizar la información de ventas, facilitar su análisis mediante indicadores y representar los resultados de forma visual e interactiva mediante Power BI.
- El proyecto permitió aplicar conceptos de Data Warehouse, procesos ETL, modelado dimensional, SQL y visualización de datos.
