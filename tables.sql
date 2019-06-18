drop database fujifilm;
create database fujifilm;

use fujifilm;

drop table employee;
create table employee (id int auto_increment primary key, first_name varchar(255) not null, 
last_name varchar(255) not null, emailid varchar(255) not null unique, address varchar(255) not null, 
contact varchar(255) not null, employeeid varchar(255) not null unique,
username varchar(255) not null unique, password varchar(255) not null
);

drop table customer;
create table customer (id int auto_increment primary key, first_name varchar(255) not null, 
last_name varchar(255) not null, emailid varchar(255) not null unique, address varchar(255) not null, 
contact varchar(255) not null, username varchar(255) not null unique, password varchar(255) not null
);

drop table product;
create table product (product_id int auto_increment primary key,
product_name varchar(255) unique,price number(45),Qty int(50));

insert into product (product_name, price, Qty)
VALUES
("Fujifilm GFX 100",9999.95,50),
("Fujifilm X-T30",999.0,80),
("Fujifilm GFX 50R",3999.00,45),
("Fujifilm GFX 50S",4499.00,60),
("Fujifilm X-PRO2",859.00,65),
("Fujifilm FDR GO PLUS 500",145000,40),
("Fujifilm FDR SMART-X",21500,30),
("Fujifilm SDHC 8GB",6.99,100),
("Fujifilm SDHC 64GB",29.00,150),
("Fujifilm LTO ULTRIUM 7",67.00,200),
("Fujifilm PRIMA T2",5500.00,100),
("Fujifilm XF 18-135mm f",699.00,85),
("Fujifilm X-T1",3999.00,250)