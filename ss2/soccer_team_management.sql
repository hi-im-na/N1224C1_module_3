create database if not exists soccer_team_management;
use soccer_team_management;
create table if not exists coach
(
    id   int primary key auto_increment,
    name varchar(255) not null
);

create table if not exists team
(
    id       int primary key auto_increment,
    name     varchar(255) not null,
    coach_id int          not null unique,
    foreign key (coach_id) references coach (id)
);


create table if not exists position
(
    id   int primary key auto_increment,
    name varchar(255) not null
);

create table if not exists player
(
    id      int primary key auto_increment,
    name    varchar(255) not null,
    team_id int          not null,
    foreign key (team_id) references team (id)
);

create table if not exists player_position
(
    id          int primary key auto_increment,
    player_id   int not null,
    position_id int not null,
    foreign key (player_id) references player (id),
    foreign key (position_id) references position (id),
    constraint player_position_unique unique (player_id, position_id)
);

create table if not exists soccer_match
(
    id            int primary key auto_increment,
    name          varchar(255) not null,
    date_and_time timestamp    not null,
    team1_id      int          not null,
    team2_id      int          not null,
    foreign key (team1_id) references team (id),
    foreign key (team2_id) references team (id),
    check ( team1_id != team2_id )
);

create table if not exists match_player
(
    id              int primary key auto_increment,
    player_id       int not null,
    soccer_match_id int not null,
    foreign key (player_id) references player (id),
    foreign key (soccer_match_id) references soccer_match (id),
    constraint match_player_unique unique (player_id, soccer_match_id)
);