show global variables like "local_infile";
set global local_infile=1;
/*********************************/
use august;
CREATE TABLE bank_customers (
    rownumber INT,
    customerid VARCHAR(20),
    surname VARCHAR(40),
    CreditScore INT,
    Geography VARCHAR(20),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance NUMERIC,
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary NUMERIC,
    Exited INT
);
load data local infile "C:\\Users\\idrus\\bootup\\BootUP-DS-ML\\SQL Basics" into table
bank_customers character set latin1 fields terminated by "," enclosed by '"'
lines terminated by "\r\n" ignore 1 lines;


