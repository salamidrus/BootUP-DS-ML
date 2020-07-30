/* Creating a new database*/
CREATE database AUGUST;

/* Using the database august*/
USE AUGUST;

/* Creata a table customer in the database august*/
CREATE TABLE CUSTOMERS (
    ID INT(5),
    Name VARCHAR(20),
    Email VARCHAR(25),
    Age INT(3),
    Gender VARCHAR(8)
);

/* Delete a table */
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    Email VARCHAR(25) NOT NULL,
    Age INT(3),
    Gender VARCHAR(8),
    PRIMARY KEY (ID)
);

/* Show the table description */
DESC customers;

/* ALTER Command */
/* Add a new column */
ALTER TABLE customers ADD DOB date;

ALTER TABLE customers DROP Age;

/* Modifying a column*/
ALTER TABLE customers MODIFY Email varchar(30) NOT NULL UNIQUE;

/*********************************************************************/
/* INSERT Command - DML*/
INSERT into customers (Name,Email,Gender,DOB) values ('Syarif','salam@mail.com','Male','20200502');
SELECT * FROM customers;

/* OR */
INSERT into customers values (2,'Salam','salam@mail.com','Male', '20200502');

/* Update the table */
UPDATE customers 
SET 
    DOB = '19810401'
WHERE
    ID = 2;

UPDATE customers 
SET 
    DOB = '19950401',
    Email = 'salam1@mail.com'
WHERE
    ID = 1;
  
/*********************************************************/
/* DELETE Command*/
INSERT into customers (Name,Email,Gender,DOB) values ('Yanto','salamyanto@mail.com','Male', '20200503');  
SELECT * FROM customers;

DELETE from customers where ID= 4;
SELECT * FROM customers;

/**************************************************************************/
/* SELECT Command */
SELECT 
    *
FROM
    customers;

SELECT 
    ID, Name, DOB
FROM
    customers;
 
/* Filters*/ 
SELECT * from customers where DOB<"19900101";    
select * from customers where Gender="Male";
select ID,Email from customers where Gender="Male";

select * from customers limit 2;

/* Using multiple conditions for filtering*/ 

select * from customers where DOB<"19900101" and Gender ="male";
select * from customers where DOB<"19900101" or Gender ="male";