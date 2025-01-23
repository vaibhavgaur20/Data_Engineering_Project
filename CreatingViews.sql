CREATE SCHEMA gold;

-- CREATE VIEW CALENDAR 
CREATE VIEW gold.calendar
AS
SELECT * 
FROM 
    OPENROWSET(
        BULK 'https://asa22012025.dfs.core.windows.net/silver/Calender/',
        FORMAT = 'PARQUET'
    ) as QUER1

-- CREATE VIEW AdventureWorks_Products
CREATE VIEW gold.AdventureWorks_Products
AS 
SELECT *
FROM 
    OPENROWSET(
        BULK 'https://asa22012025.dfs.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'PARQUET'
    ) AS QUER2

-- Create view Customer
CREATE VIEW gold.Customer
AS 
SELECT * 
FROM 
    OPENROWSET(
        BULK 'https://asa22012025.dfs.core.windows.net/silver/Customer/',
        FORMAT = 'PARQUET'
    ) AS QUER3 

-- Create view Product_Subcategories
CREATE VIEW gold.Product_Subcategories
AS 
SELECT * 
FROM 
    OPENROWSET(
        BULK 'https://asa22012025.dfs.core.windows.net/silver/Product_Subcategories/',
        FORMAT = 'PARQUET'
    ) AS QUER4

-- Create view Returns
CREATE VIEW gold.Customer
AS 
SELECT * 
FROM 
    OPENROWSET(
        BULK 'https://asa22012025.dfs.core.windows.net/silver/Returns/',
        FORMAT = 'PARQUET'
    ) AS QUER5

-- Create view Sales_2015
CREATE VIEW gold.Sales_2015
AS 
SELECT * 
FROM 
    OPENROWSET(
        BULK 'https://asa22012025.dfs.core.windows.net/silver/Sales_2015/',
        FORMAT = 'PARQUET'
    ) AS QUER6

-- Create view Territories
CREATE VIEW gold.Territories
AS 
SELECT * 
FROM 
    OPENROWSET(
        BULK 'https://asa22012025.dfs.core.windows.net/silver/Territories/',
        FORMAT = 'PARQUET'
    ) AS QUER7

















