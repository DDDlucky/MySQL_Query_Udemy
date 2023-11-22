-- SELECTの活用

USE ecsite;

SHOW tables;

SHOW COLUMNS FROM users;

SHOW keys FROM users;

SELECT * FROM users;

SELECT name from users;

SELECT id, name from users;

SELECT id, name, birthday from users;


-- WHEREの活用
SELECT * FROM users WHERE birthday = '2002-03-09';

SELECT name, birthday FROM users WHERE birthday = '2002-03-09';

SELECT name, birthday FROM users WHERE birthday = '2002-03-09' OR birthday = '2003-06-07';


-- ASの活用
SELECT id AS user_id FROM users;

SELECT id AS user_id, name AS fullname, birthday AS DOB FROM users;


-- DISTINCTの活用
SELECT * FROM order_details;

SELECT DISTINCT order_id FROM order_details;

SELECT DISTINCT id, product_id FROM order_details;

SELECT DISTINCT order_id, product_id FROM order_details;


-- ORDER BYの活用
SELECT name FROM users ORDER BY name;

SELECT id, name, birthday FROM users ORDER BY name;

SELECT name FROM users ORDER BY name DESC;

SELECT id, name, birthday FROM users ORDER BY name DESC;

SELECT id, name, birthday FROM users ORDER BY birthday DESC;

SELECT id, name, birthday FROM users ORDER BY 1;

SELECT id, name, birthday FROM users ORDER BY 2;

SELECT id, name, birthday FROM users ORDER BY 3;

SELECT id, name, birthday FROM users ORDER BY id, birthday;


-- LIMITの活用

SELECT 
    id, name
FROM
    users
ORDER BY name DESC
LIMIT 10;


SELECT 
    id, name
FROM
    users
ORDER BY name DESC
LIMIT 5;


SELECT 
    id, name
FROM
    users
ORDER BY name DESC
LIMIT 2 , 5;


SELECT 
    id, name
FROM
    users
ORDER BY name DESC
LIMIT 7 , 10;


SELECT 
    id, name
FROM
    users
ORDER BY name DESC
LIMIT 10 OFFSET 7;


-- LIKEの活用
SELECT 
    name
FROM
    users
WHERE
    name LIKE '%da%';

SELECT 
    name
FROM
    users
WHERE
    name LIKE 'au%';

SELECT 
    name
FROM
    users
WHERE
    name LIKE '%an';

SELECT 
    id, name
FROM
    users
WHERE
    id LIKE '_';

SELECT 
    id, name
FROM
    users
WHERE
    id LIKE '__';

SELECT 
    id, name
FROM
    users
WHERE
    id LIKE '___';
    

-- GROUP BYの活用

SELECT * FROM order_details GROUP BY amount;

SELECT * FROM order_details;


SELECT 
    *
FROM
    order_details
WHERE
    order_id LIKE '__'
GROUP BY amount;


-- HAVINGの活用

SELECT 
    *
FROM
    order_details
GROUP BY amount
HAVING id = 5;

SELECT 
    *
FROM
    order_details
GROUP BY amount
HAVING id > 1;

SELECT 
    id AS order_details_id
FROM
    order_details
WHERE
    order_id LIKE '__'
GROUP BY amount
HAVING id > 10
ORDER BY id
LIMIT 1 OFFSET 1;

SELECT 
    id AS order_details_id
FROM
    order_details
WHERE
    order_id LIKE '__'
GROUP BY amount
HAVING id > 10
ORDER BY id
LIMIT 1 OFFSET 1;


-- SELECT文を駆使したケーススタディ演習1 解説 
SELECT id, name, birthday FROM users WHERE birthday LIKE '%-06-%'; 

-- SELECT文を駆使したケーススタディ演習2 解説
SELECT * FROM users ORDER BY id DESC LIMIT 1;

-- SELECT文を駆使したケーススタディ演習3 解説
SELECT * FROM order_details WHERE order_id LIKE '__' AND product_id = 6;

-- SELECT文を駆使したケーススタディ演習4 解説
SELECT id, name AS 20s_users, birthday FROM users WHERE birthday < '2000-01-01' AND birthday > '1990-01-01';
-- ANS. 
SELECT id, name AS 20s_users, birthday FROM users WHERE birthday LIKE '199%';

-- SELECT文を駆使したケーススタディ演習5 解説
SELECT DISTINCT user_id FROM orders;

-- SELECT文を駆使したケーススタディ演習6 解説
SELECT * FROM order_details WHERE amount >= 2 GROUP BY product_id;
SELECT * FROM order_details HAVING amount >= 2 GROUP BY product_id;
-- ANS.
SELECT 
    *
FROM
    order_details
WHERE
    amount > 1
GROUP BY product_id;

-- SELECT * FROM order_details WHERE amount > 1;

SELECT 
    *
FROM
    order_details
GROUP BY product_id
HAVING amount > 1;

SELECT 
    *
FROM
    order_details
GROUP BY product_id;