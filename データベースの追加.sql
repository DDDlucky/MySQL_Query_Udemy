show databases;
CREATE DATABASE artdata;

use artdata;

show tables;

CREATE TABLE artist(
	id int not null auto_increment primary key,
    name varchar(255) not null,
    category varchar(255)
);

show columns from artist;

DROP table artist;

show databases;
DROP DATABASE artdata;

