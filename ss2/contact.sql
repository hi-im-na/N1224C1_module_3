create database if not exists contact;
use contact;


create table if not exists person
(
    id   int primary key auto_increment,
    name varchar(255) not null
);

create table if not exists phone_number
(
    id        int primary key auto_increment,
    number    varchar(255) not null,
    person_id int          not null,
    foreign key (person_id) references person (id)
);

create table if not exists email
(
    id        int primary key auto_increment,
    email     varchar(255) not null,
    person_id int          not null,
    foreign key (person_id) references person (id)
);
