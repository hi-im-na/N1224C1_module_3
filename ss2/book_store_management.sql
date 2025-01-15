create database if not exists book_store_management;

use book_store_management;

create table if not exists author
(
    id   int primary key auto_increment,
    name varchar(255) not null
);

create table if not exists employee
(
    id      int primary key auto_increment,
    name    varchar(255) not null,
    address varchar(255) not null
);

create table if not exists book
(
    id          int primary key auto_increment,
    title       varchar(255)   not null,
    price       decimal(10, 2) not null,
    employee_id int            not null,
    author_id   int            not null,
    foreign key (author_id) references author (id),
    foreign key (employee_id) references employee (id)
);