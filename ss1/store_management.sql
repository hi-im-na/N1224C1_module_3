-- Active: 1736516947094@@127.0.0.1@3306@store_management
-- Active: 1736516947094@@127.0.0.1@3306@store_management
-- Active: 1736516947094@@127.0.0.1@3306@qlttnv
create database if not exists store_management;

use store_management;

create table if not exists product
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255)   NOT NULL,
    description TEXT,
    price       DECIMAL(10, 2) NULL,
    stock       INT
);

insert into product (name, description, price, stock)
values ('Apple', 'Fresh apple', 1.5, 100);

insert into product
values (2, 'Grape', 'Fresh grape', 1, 1000);

insert into product (name)
values ('Egg');

-- cap nhat du lieu
update product
set name = 'hh'
where id = 1;


-- SET SQL_SAFE_UPDATE = 0;
update product
set name = 'hh2';
-- SET SQL_SAFE_UPDATE = 1;

alter table product
    add barcode varchar(255) default null;

alter table product
    add warranty integer default 6;

delete
from product
where price = 1000;

-- SET SQL_SAFE_UPDATE = 0;
delete
from product;
-- SET SQL_SAFE_UPDATE = 1;

drop table product;

drop database if exists store_management;

drop database store_management;