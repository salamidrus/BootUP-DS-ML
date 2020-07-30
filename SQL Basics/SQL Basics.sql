CREATE TABLE employee (
    Id INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(200),
    Salary NUMERIC(30),
    City varchar(20),
    PRIMARY KEY (Id)
);

insert into employee values(1, "John",32, "New York", 12455,'NY');
insert into employee values(2, "Robert",25, "London", 48755,'NY');
insert into employee values(3, "Juan",28, "Paris", 13525,'LON');
insert into employee values(4, "Cello",18, "Jakarta", 78925,'LON');
insert into employee values(5, "Oscar",39, "Singapore", 13655,'LON');
insert into employee values(6, "Anshu",42, "Delhi", 12455,'KUL');
insert into employee values(7, "Rahul",21, "Kualalumpur", 78555,'KUL');

select * from employee;

/* Group By Operation */

select City,avg(salary) from employee group by City;
select min(Salary) from employee;
select max(Salary) from employee;
select avg(Salary) from employee;

/* order by clause*/
select * from employee order by Age desc;
select City,avg(salary) from employee group by City order by avg(Salary) desc; 

select * from employee order by Salary,Age desc;

/* to  check the total number of rows in the data*/
select count(*) from employee;