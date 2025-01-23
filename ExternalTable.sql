-- Create a MAster Key 
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'V@4'

-- Scoped Credentials which is Managed Identity as the link is between 2 Azure Services
CREATE DATABASE SCOPED CREDENTIAL cred_vaib
WITH 
    IDENTITY = 'Managed Identity'

-- Need To create 2 External Data Source one for retriving the data from which is silver layer and another one to store, which is gold layer

CREATE EXTERNAL DATA SOURCE source_silver
WITH 
(
    LOCATION = 'https://asa22012025.dfs.core.windows.net/silver',
    CREDENTIAL = cred_vaib
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH 
(
    LOCATION = 'https://asa22012025.dfs.core.windows.net/gold',
    CREDENTIAL = cred_vaib
)

-- File Format
CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

-- Create External Table

CREATE EXTERNAL TABLE gold.extsales
WITH 
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.Sales_2015

