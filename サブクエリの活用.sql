-- FROM句におけるサブクエリ
SELECT 
    name
FROM
    (SELECT 
        *
    FROM
        users) AS Sub;

SELECT name FROM users;


SELECT 
    name
FROM
    (SELECT 
        *
    FROM
        users);


SELECT 
    gender
FROM
    (SELECT 
        *
    FROM
        users
    GROUP BY gender) AS Sub;


SELECT 
    *
FROM
    (SELECT 
        product_id, SUM(amount) AS amount_sum
    FROM
        order_details
    GROUP BY product_id) AS sub;

SELECT 
    product_id, SUM(amount) AS amount_sum
FROM
    order_details
GROUP BY product_id;


CREATE VIEW sub AS
    SELECT 
        product_id, SUM(amount) AS amount_sum
    FROM
        order_details
    GROUP BY product_id;

SELECT * FROM sub;


SELECT 
    *
FROM
    (SELECT 
        product_id, COUNT(amount) AS id_count
    FROM
        order_details
    GROUP BY product_id) AS sub
WHERE
    product_id = 1;


SELECT 
    AVG(sub.COUNT), MIN(sub.COUNT), MAX(sub.COUNT)
FROM
    (SELECT 
        COUNT(amount) AS count
    FROM
        order_details
    GROUP BY product_id) AS sub;


-- SELECT句におけるサブクエリ
USE ecsite;

SELECT
	(SELECT SUM(amount) FROM order_details) AS SUM
FROM
	order_details;


SELECT
	product_id,
	SUM(amount) AS PRODUCT_SUM,
	(SELECT SUM(amount) FROM order_details) AS TOTAL_SUM
FROM
	order_details
GROUP BY product_id;


SELECT
	(SELECT SUM(amount) FROM order_details GROUP BY product_id) AS SUM
FROM
	order_details;


-- WHERE句におけるサブクエリ（INの活用）
SELECT 
    *
FROM
    users
WHERE
    id IN (SELECT 
            id
        FROM
            users
        WHERE
            birthday BETWEEN '1990-01-01' AND '1995-01-01');


SELECT 
    id, order_id, product_id, amount
FROM
    order_details
WHERE
    product_id IN (SELECT 
            id
        FROM
            products
        WHERE
            price > 40);


SELECT 
    order_details.id,
    order_details.order_id,
    order_details.product_id,
    order_details.amount,
    products.price
FROM
    order_details
        JOIN
    products ON order_details.product_id = products.id
WHERE
    products.price > 40;


SELECT 
    order_details.id,
    order_details.order_id,
    order_details.product_id,
    order_details.amount,
    products.price
FROM
    order_details
        JOIN
    products ON order_details.product_id = products.id
WHERE
    products.price > 40;


SELECT 
    id, order_id, product_id, amount, price
FROM
    order_details
WHERE
    product_id IN (SELECT 
            id
        FROM
            products
        WHERE
            price > 40);


-- WHERE句におけるサブクエリ（EXISTSの活用）
SELECT 
    *
FROM
    users
WHERE
    EXISTS( SELECT 
            *
        FROM
            users
        WHERE
            id = 1);


SELECT 
    *
FROM
    users
WHERE
    EXISTS( SELECT 
            *
        FROM
            users
        WHERE
            id = 101);


SELECT 
    *
FROM
    users
WHERE
    id IN (SELECT 
            id
        FROM
            users
        WHERE
            id = 1);


SELECT 
    *
FROM
    users
WHERE
    EXISTS( SELECT 
            *
        FROM
            orders
        WHERE
            orders.user_id = users.id);


-- HAVING句におけるサブクエリ
SELECT 
    product_id, SUM(amount) AS amount_sum
FROM
    order_details
GROUP BY product_id
HAVING SUM(amount) > (SELECT 
        SUM(amount) / 9
    FROM
        order_details);


SELECT SUM(amount)/9 FROM order_details;


-- ANY/SOME/ALLによる論理式
SELECT 
    *
FROM
    products
WHERE
    price > ANY (SELECT 
            price
        FROM
            products
        WHERE
            id < 5);


SELECT 
    *
FROM
    products
WHERE
    price > ANY (SELECT 
            price
        FROM
            products
        WHERE
            id < 5);


SELECT 
    *
FROM
    products
WHERE
    price > SOME (SELECT 
            price
        FROM
            products
        WHERE
            id < 5);

SELECT 
    *
FROM
    products
WHERE
    price > ALL (SELECT 
            price
        FROM
            products
        WHERE
            id < 5);


-- ケーススタディ演習１解説
SELECT * FROM product_reviews;

SELECT 
    user_id
FROM
    product_reviews
WHERE
    user_id = (SELECT 
            user_id
        FROM
            product_reviews
        WHERE
            product_id = 5);

-- ANS.
SELECT 
    *
FROM
    users
WHERE
    id IN (SELECT 
            user_id
        FROM
            product_reviews
        WHERE
            product_id = 5)
ORDER BY users.id;

-- 他
SELECT DISTINCT
    users.*
FROM
    users
        INNER JOIN
    product_reviews ON product_reviews.user_id = users.id
WHERE
    product_id = 5
ORDER BY users.id;


-- ケーススタディ演習2解説
SELECT * FROM order_details;

SELECT * FROM orders;

SELECT 
    gender, SUM(amount), AVG(amount), MIN(amount), MAX(amount)
FROM
    users
        INNER JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON orders.id = order_details.order_id
GROUP BY gender;

-- ANS.
SELECT 
    gender, SUM(amount) AS sum
FROM
    order_details
        JOIN
    orders ON orders.id = order_details.order_id
        JOIN
    users ON users.id = orders.user_id
GROUP BY users.gender;


SELECT 
    AVG(sub.sum), MIN(sub.sum), MAX(sub.sum)
FROM
    (SELECT 
        SUM(amount) AS sum
    FROM
        order_details
    JOIN orders ON orders.id = order_details.order_id
    JOIN users ON users.id = orders.user_id
    GROUP BY users.gender) AS sub;


-- ケーススタディ演習3解説
show tables;
SELECT * FROM product_reviews;

SELECT * 
FROM 
product_reviews
JOIN users ON product_reviews.user_id = users.id
WHERE product_reviews.product_id = 5 AND body EXISTS (SELECT );

-- ANS.
SELECT 
    *
FROM
    product_reviews
WHERE
    product_id = 7
        AND body LIKE '%disappointing%';


SELECT 
    *
FROM
    users
WHERE
    EXISTS( SELECT 
            user_id
        FROM
            product_reviews
        WHERE
            product_id = 7
                AND body LIKE '%disappointing%');


SELECT 
    *
FROM
    users
WHERE
    id IN (SELECT 
            user_id
        FROM
            product_reviews
        WHERE
            product_id = 7
                AND body LIKE '%disappointing%');


-- ケーススタディ演習4解説
SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    COUNT(order_id) AS order_count,
    SUM(order_details.amount * price) AS total_fee,
    SUM(order_details.amount * price * 1.1) AS tax_included
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON order_details.order_id = orders.id
        INNER JOIN
    products ON order_details.product_id = products.id
GROUP BY users.id
ORDER BY users.id;


-- ANS.　
SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    order_details.product_id,
    order_details.amount,
    products.name,
    SUM(amount * price) AS total_fee,
    SUM(amount * price * 1.1) AS tax_included
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON order_details.order_id = orders.id
        INNER JOIN
    products ON order_details.product_id = products.id
GROUP BY users.id
ORDER BY users.id;
