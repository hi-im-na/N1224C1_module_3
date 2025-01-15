create database if not exists school;
use school;

create table if not exists teacher
(
    id   int primary key auto_increment,
    name varchar(255) not null
);

create table if not exists student
(
    id         int primary key auto_increment,
    name       varchar(255) not null,
    teacher_id int          not null,
    foreign key (teacher_id) references teacher (id)
);