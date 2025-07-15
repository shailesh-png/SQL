#database creation in sql...

#DDL commands-----

create database test1;    
use test1;
CREATE TABLE sales_data (
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    sale_date DATE,
    region VARCHAR(50)
);
select* from sales_data;
insert into sales_data (product_name,category,quantity,price,sale_date,region)
values
('Wireless Mouse', 'Electronics', 3, 25.99, '2025-07-01', 'USA'),
('Yoga Mat', 'Fitness', 2, 19.99, '2025-07-02', 'Canada'),
('Laptop Stand', 'Electronics', 1, 45.50, '2025-07-03', 'UK'),
('Water Bottle', 'Fitness', 5, 12.99, '2025-07-04', 'USA'),
('USB-C Charger', 'Electronics', 4, 18.00, '2025-07-05', 'Germany'),
('Resistance Bands', 'Fitness', 2, 22.49, '2025-07-06', 'Canada'),
('Notebook', 'Stationery', 6, 3.50, '2025-07-07', 'India'),
('Ballpoint Pens', 'Stationery', 10, 0.99, '2025-07-08', 'India'),
('Bluetooth Speaker', 'Electronics', 2, 35.75, '2025-07-09', 'USA'),
('Dumbbells', 'Fitness', 1, 49.99, '2025-07-10', 'UK');

select * from sales_data;

alter table sales_data add column location char(20);
select * from sales_data;
alter table sales_data modify column location int(20);
select * from sales_data;
alter table sales_data modify column location char(30);
select * from sales_data;
alter table sales_data drop location;
select * from sales_data;

------------------------------------------------------------------------------------------------
create table college(Teacher char(20),Students varchar(25),classes varchar(20));
insert into college (Teacher,Students,classes)
values
("rashmi","shubham","twelth"),
("apurva","neha","tenth"),
("prajwal","rutwik","eighth");
select * from college;

alter table college rename to school;
select * from school;

truncate table school;
drop table school;