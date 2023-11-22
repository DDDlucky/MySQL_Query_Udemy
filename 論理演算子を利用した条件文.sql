USE ecsite;

-- 符号による論理式
SELECT * FROM order_details WHERE product_id = 3;

SELECT * FROM order_details WHERE product_id != 3;

SELECT * FROM order_details WHERE product_id <> 3;

-- 不等号による論理式
SELECT * FROM products;

SELECT * FROM products WHERE price > 40;

SELECT * FROM products WHERE price >= 40;

SELECT * FROM products WHERE price < 40;

SELECT * FROM products WHERE price <= 40;

SELECT * FROM products WHERE price <> 40;

SELECT * FROM products WHERE price >< 40;

-- NOT LIKEによる論理式
SELECT 
    *
FROM
    users
WHERE
    birthday LIKE '20%';


SELECT 
    *
FROM
    users
WHERE
    birthday NOT LIKE '20%';

-- ANDとORによる論理式
SELECT 
    *
FROM
    users
WHERE
    birthday LIKE '20%';


SELECT 
    *
FROM
    users
WHERE
    birthday LIKE '20%' AND gender = 0;


SELECT
	*
FROM
	users
WHERE
	birthday LIKE '20%' && gender = 0;


SELECT 
    *
FROM
    users
WHERE
    birthday LIKE '20%' OR gender = 0;


 
■BETWEENによる論理式
SELECT
*
FROM
products
WHERE
price
BETWEEN
40 AND 598;


SELECT
*
FROM
products
WHERE
price >= 40
AND
price <= 598;


SELECT
*
FROM
products
WHERE
price
NOT BETWEEN
40 AND 598;


SELECT
*
FROM
products
WHERE
price < 40
OR
price > 598;

-- BETWEENによる論理式
SELECT 
    *
FROM
    products
WHERE
    price BETWEEN 40 AND 598;


SELECT 
    *
FROM
    products
WHERE
    price >= 40 AND price <= 598;


SELECT 
    *
FROM
    products
WHERE
    price NOT BETWEEN 40 AND 598;


SELECT 
    *
FROM
    products
WHERE
    price < 40 OR price > 598;


-- INによる論理式
SELECT 
    *
FROM
    order_details
WHERE
    product_id IN (1 , 3);


SELECT 
    *
FROM
    order_details
WHERE
    product_id IN (1);


SELECT 
    *
FROM
    order_details
WHERE
    product_id = 1;



SELECT 
    *
FROM
    order_details
WHERE
    product_id = 1 OR product_id = 3;



SELECT 
    *
FROM
    order_details
WHERE
    product_id IN (1 , 2, 3, 4, 5);



SELECT 
    *
FROM
    order_details
WHERE
    product_id = 1 
    OR 
    product_id = 2
	OR 
    product_id = 3
	OR 
    product_id = 4
	OR 
    product_id = 5;


SELECT 
    *
FROM
    order_details
WHERE
    product_id NOT IN (1 , 3);


SELECT 
    *
FROM
    order_details
WHERE
    product_id != 1 AND product_id != 3;


-- ケーススタディ演習１解説
SELECT * FROM users WHERE name LIKE 'A%' OR name LIKE 'B%' OR name LIKE 'C%';
-- SELECT * FROM users WHERE name  IN ('A%', 'B%', 'C%'); ->不正解

-- ANS.
SELECT 
    *
FROM
    users
WHERE
    name LIKE 'A%' 
    OR
    name LIKE 'B%'
	OR
    name LIKE 'C%';


-- ケーススタディ演習2解説
SELECT * FROM users WHERE birthday LIKE '___3-%' OR birthday LIKE '%-03-%';

-- ANS.
SELECT * FROM users;

SELECT 
    *
FROM
    users
WHERE
    birthday LIKE '%3-%';


-- ケーススタディ演習3解説
SELECT * FROM products WHERE id IN (3, 4, 5, 6);

-- ANS. 
SELECT * FROM order_details;

SELECT 
    *
FROM
    order_details
WHERE
    order_id LIKE '__';

SELECT 
    *
FROM
    order_details
WHERE
    order_id LIKE '__'
        AND product_id IN (3 , 4, 5, 6);


-- ケーススタディ演習4解説
SELECT * FROM order_details WHERE product_id NOT IN(5, 6, 9) AND amount >= 2;

-- ANS.
SELECT 
    *
FROM
    order_details
WHERE
    amount >= 2
        AND product_id NOT IN (5 , 6, 9);


-- ケーススタディ演習5解説
SELECT * FROM products WHERE price NOT BETWEEN 40 AND 300;

-- ANS.
SELECT 
    *
FROM
    products
WHERE
    price NOT BETWEEN 40 AND 300;
    

