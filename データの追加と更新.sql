CREATE DATABASE sales;

USE sales;

DROP TABLE users;

CREATE TABLE users(
	id int not null auto_increment primary key,
    name varchar(30),
    age int
);

INSERT INTO users(id, name, age)VALUES(1,'takahashi',31);

SELECT * FROM users;

INSERT INTO users VALUES(2,'suzuki',37),(3,'sato',21);


CREATE TABLE item(
	id int not null auto_increment primary key,
    item_name varchar(20),
    price int
);

INSERT INTO item VALUE
	(1,'TV',100000),
    (2,'smartphone',80000),
    (3,'camera',50000);

SELECT * FROM item;



ALTER TABLE users ADD frequency varchar(10) not null;

DESC users;
show DATABASES;
USE sales;

-- disable safe update mode
SET SQL_SAFE_UPDATES=0;

UPDATE users SET frequency = 'still';

SELECT * FROM users;

UPDATE users SET age = 32 WHERE id = 1;
UPDATE users SET frequency = 'repeater' WHERE id = 1;

UPDATE users SET frequency = 'infrequent' WHERE id = 2;

#データ削除
DELETE FROM users WHERE id = 1;
INSERT INTO users(name, age, frequency)VALUES('kubota',24,'still');

#テーブル削除
TRUNCATE TABLE users;
INSERT INTO users(name, age, frequency)VALUES('takahashi',31,'still'),('sato',21,'still');













https://ivanderevianko.com/2019/11/fix-error-code-1175-you-are-using-safe-update-mode

-- disable safe update mode
SET SQL_SAFE_UPDATES=0;
-- execute update statement
UPDATE table SET column='value';
-- enable safe update mode
SET SQL_SAFE_UPDATES=1;
