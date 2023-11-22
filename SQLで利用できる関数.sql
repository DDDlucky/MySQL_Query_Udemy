-- 基本的な演算式の活用
USE ecsite;

SELECT 1 + 2;

SELECT 1 - 2;

SELECT 1 * 2;

SELECT 3 / 2;

SELECT 3 DIV 2;

SELECT 3 % 2;

SELECT 3 MOD 2;

SELECT 
    id + order_id AS sum_id
FROM
    order_details
WHERE
    product_id = 9;

SELECT 
    id MOD order_id MOD_id
FROM
    order_details
WHERE
    product_id = 9;


SELECT ABS(-10);

SELECT ABS(10);

SELECT ROUND(2.4);

SELECT CEILING(2.6);

SELECT FLOOR(2.4);

SELECT TRUNCATE(1.0384,4);
SELECT TRUNCATE(1.0384,2);


-- 集計関数①

USE ecsite;

SELECT 
    COUNT(amount)
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    COUNT(id)
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    COUNT(*)
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    COUNT(DISTINCT amount)
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    amount
FROM
    order_details
WHERE
    product_id = 9
GROUP BY amount;


SELECT 
    amount
FROM
    order_details
WHERE
    product_id = 9
GROUP BY amount;


SELECT 
    COUNT(amount)
FROM
    order_details
WHERE
    product_id = 9
GROUP BY amount;


-- 集計関数②
USE ecsite;

SELECT 
    SUM(amount)
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    SUM(id)
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    AVG(amount)
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    AVG(amount) AS avg_amount, SUM(amount) AS sum_amount
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    AVG(amount) AS avg_amount, SUM(amount) AS sum_amount
FROM
    order_details
WHERE
    product_id = 9
GROUP BY amount;


-- 集計関数③
SELECT 
    MAX(price)
FROM
    products;


SELECT 
    MIN(price)
FROM
    products;


SELECT 
    *
FROM
    products
WHERE
    price = (SELECT 
            MAX(price)
        FROM
            products);



SELECT 
    *
FROM
    products
WHERE
    price = (SELECT 
            MIN(price)
        FROM
            products);

SELECT 
    MAX(product_id)
FROM
    order_details
GROUP BY amount;



SELECT 
    MIN(product_id)
FROM
    order_details
GROUP BY amount;


-- 文字列に関する関数①②
USE ecsite;

select concat('A','B','C');

select concat('A',' ','C');

SELECT 
    CONCAT(name, birthday)
FROM
    users;

SELECT LOWER('AAA');


SELECT 
    LOWER(name)
FROM
    users;


SELECT UPPER('aaa');


SELECT 
    UPPER(name)
FROM
    users;


SELECT REPLACE('abc', 'a', 'A');


SELECT 
    REPLACE(name, 'a', 'A')
FROM
    users;

-- 文字列に関する関数③

USE ecsite;

SELECT INSERT('abcd',1,2,'xy');

SELECT 
    INSERT(name, 1, 5, 'AAAAA')
FROM
    users;

SELECT LPAD('ab',6,'A');


SELECT 
    LPAD(name, 30, 'A')
FROM
    users;


SELECT RPAD('ab',6,'A');


SELECT 
    RPAD(name, 30, 'A')
FROM
    users;


SELECT REPEAT('OK',5)
END;

SELECT 
    REPEAT(name, 2)
FROM
    users
END;


-- 文字列に関する関数④
USE ecsite;

SELECT LENGTH('abcd');

SELECT LENGTH('日本語');

SELECT CHAR_LENGTH('日本語');

SELECT CHAR_LENGTH('abcd');


-- 日付と時刻に関する関数①
SELECT CURDATE(), CURTIME(), NOW();

CREATE TABLE simpleid 
(
    id INT(5),
    created_at TIMESTAMP DEFAULT NOW()
);


INSERT INTO simpleid (id) VALUES(1);

SELECT * FROM simpleid;

SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP();

SELECT DATEDIFF('2020-11-30','2020-01-20');

SELECT TIMEDIFF('2020:02:02 23:00:00','2020:01:30 00:00:00');

SELECT TIMESTAMPDIFF(MONTH,'2020-01-01','2020-02-01');

-- その他の関数
SELECT DATABASE();

SELECT CURRENT_USER();

SELECT VERSION();

SELECT CHARSET('Abbbrc');

SELECT COLLATION ('Abbbrc');

SELECT 
    DEFAULT( id)
FROM
    users;

SELECT CAST(NOW() AS signed);

SELECT CONVERT(NOW(), signed);

SELECT 
    CONVERT( id , DECIMAL (5 , 3 ))
FROM
    users;


-- ケーススタディ演習1解説
SELECT product_id, sum(amount) AS sum_amount FROM order_details GROUP BY amount ORDER BY sum_amount DESC;

-- ANS.
SELECT 
    product_id, SUM(amount) AS sum_amount
FROM
    order_details
GROUP BY product_id
ORDER BY SUM(amount) DESC;


-- ケーススタディ演習2解説
SELECT 
    product_id, 
    SUM(amount) AS sum_amount,
    AVG(amount) AS avg_amount,
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM
    order_details
GROUP BY product_id
ORDER BY SUM(amount) DESC;


-- ケーススタディ演習3解説 
SELECT 
    CONCAT('製品ID',product_id,'の送料は', SUM(amount),'です') AS sum_amount
FROM
    order_details
GROUP BY product_id
ORDER BY SUM(amount) DESC;

-- ANS.
SELECT
CAST(CONCAT('製品ID',product_id, 'の商品の総注文量は', SUM(amount),'です。') AS CHAR) AS sum_amount
FROM
order_details
GROUP BY product_id
ORDER BY SUM(amount) DESC;


-- ケーススタディ演習4解説
CREATE TABLE case4(
	id int not null auto_increment primary key,
    name varchar(255) not null,
    created_at CURDATE()
); 

INSERT INTO case4
(id, name, rating, created_at) 
VALUES
(1,Andy, ),
(2,Mary,),
(3,Sum,);

-- ANS.
CREATE TABLE case4 (
    id INT(5) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO case4(name)
VALUES('Andy'),('Mary'),('Sam');

SELECT * FROM case4;


-- ケーススタディ演習5解説
SELECT UPPER(name)FROM case4;

-- ANS.
SELECT 
    UPPER(REPLACE(name, name, 'Mr.Andy'))
FROM
    case4
WHERE
    name = 'Andy';
