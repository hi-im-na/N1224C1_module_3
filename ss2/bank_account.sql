create database if not exists bank_account;
use bank_account;

create table if not exists customer
(
    id   int primary key auto_increment,
    name varchar(255) not null
);

create table if not exists account
(
    id          int primary key auto_increment,
    balance     decimal(10, 2) not null,
    customer_id int            not null unique,
    foreign key (customer_id) references customer (id)
);