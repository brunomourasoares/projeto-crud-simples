create table users
(
    id         integer generated always as identity
        primary key,
    name       varchar(100) not null,
    email      varchar(100) not null
        unique,
    phone      varchar(20)  not null,
    birth_date date         not null,
    address    varchar(255) not null
);