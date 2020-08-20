-- RFM Analysis

-- check whether local infile is enabled or not
show global variables like "local_infile";
set global local_infile=1;

-- create a new database
CREATE database RFM;
USE RFM;

-- create table to store the data
CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(100),
    Quantity NUMERIC(10),
    InvoiceDate DATETIME,
    UnitPrice NUMERIC(20),
    CustomerID VARCHAR(20),
    Country VARCHAR(20)
);

drop table online_retail;

load data local infile "C:\\Users\\idrus\\bootup\\BootUP-DS-ML\\Project\\RFM Analysis\\Online Retail CSV.csv" into table online_retail 
character set latin1 fields terminated by ';' enclosed by '"' lines terminated by '\r\n' ignore 1 lines
(InvoiceNo,StockCode,Description,Quantity,@tmp_date,UnitPrice,CustomerID,Country)
set InvoiceDate = str_to_date(@tmp_date,'%d/%m/%Y %h:%i');

SELECT 
    *
FROM
    online_retail;

SELECT 
    COUNT(*)
FROM
    online_retail;

-- Calculate Recency - create a table - recency
drop table recency;
CREATE TABLE recency SELECT customerid, MAX(invoicedate) AS last_order_date FROM
    online_retail
GROUP BY customerid
ORDER BY last_order_date DESC;
SELECT 
    *
FROM
    recency;


SELECT 
    COUNT(*)
FROM
    recency;

-- create a frequency table
drop table frequency;
CREATE TABLE frequency SELECT customerid AS freq_cid,
    COUNT(invoicedate) AS frequency_order FROM
    online_retail
GROUP BY customerid
ORDER BY frequency_order DESC;
SELECT 
    *
FROM
    frequency;

-- create a monetary table
CREATE TABLE monetary SELECT customerid, SUM(quantity * unitprice) AS monetary_value FROM
    online_retail
GROUP BY customerid
ORDER BY monetary_value DESC;

SELECT 
    *
FROM
    monetary;
SELECT 
    COUNT(*)
FROM
    monetary;

-- first join
CREATE TABLE table1 SELECT customerid AS cid, last_order_date, frequency_order FROM
    recency,
    frequency
WHERE
    recency.customerid = frequency.freq_cid;

SELECT 
    *
FROM
    table1;
drop table table1;

-- second join to create the master table
CREATE TABLE table2 SELECT customerid, last_order_date, frequency_order, monetary_value FROM
    table1,
    monetary
WHERE
    table1.cid = monetary.customerid;
 
SELECT 
    *
FROM
    table2;

-- dropping the rows with missing values
SELECT 
    *
FROM
    table2
WHERE
    customerid IS NULL
        OR last_order_date IS NULL
        OR frequency_order IS NULL
        OR monetary_value IS NULL;
DELETE FROM table2 
WHERE
    customerid IS NULL
    OR customerid = "" 
    OR last_order_date IS NULL
    OR frequency_order IS NULL
    OR monetary_value IS NULL;

select * from table2;

-- creating a table11 - containing customers from 1st quartile of frequency and 1st quartile of monetary

declare @length numeric select count(*) from table2;
