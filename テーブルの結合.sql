-- JOIN／UNIONの概要

CREATE DATABASE hr_data2;

USE hr_data2;


CREATE TABLE employees 
(
    employee_id INT(6) PRIMARY KEY,
    last_name VARCHAR(15) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    joining_date DATE NOT NULL,
    age INT(3) NOT NULL,
    department VARCHAR(30) NOT NULL DEFAULT 'unassigned',
    rater INT(6)
);

INSERT INTO employees
(employee_id, last_name, first_name, sex, joining_date, age, department, Rater)
VALUES
(1001,'Sato','takashi','m',20180401,23,'Sales',1006),
(1002,'Endo','Maki','w',20160401,24,'HR', 1006),
(1003,'Kudo','Takaaki','m',20100401,30,'Devlopment', 1005),
(1004,'Shin','Ando','m',20100401,32,'Devlopment', 1005),
(1005,'Andy','Bogard','m',20100401,35,'Devlopment',''),
(1006,'Kow','Murasame','m',20100401,38,'Devlopment','');


CREATE TABLE evaluations 
(
    id INT(6) PRIMARY KEY AUTO_INCREMENT,
    employee_id INT(6) NOT NULL,
    year YEAR NOT NULL,
    rating VARCHAR(1) NOT NULL,
    explanation VARCHAR(1000) NOT NULL,
    FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id)
);


INSERT INTO evaluations
(employee_id, year, rating, explanation)
VALUES
(1001,2019, 'A','Very good'),
(1002,2019, 'B','Good'),
(1003,2019, 'E','Need Training'),
(1005,2019, 'A','Very good');


CREATE TABLE payrolls
(
	id INT(6) PRIMARY KEY AUTO_INCREMENT,
	employee_id INT(6) NOT NULL,
	position VARCHAR(20) NOT NULL,
	decided_date DATE NOT NULL,
	payroll_rate INT(20) NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

INSERT INTO payrolls
(employee_id, position, decided_date, payroll_rate)
VALUES
(1001,'Sales staff',20190301,200000),
(1002,'Leader',20190301,250000),
(1003,'Manager',20190301,300000),
(1006,'Manager',20190301,400000);


SELECT * FROM employees;

SELECT * FROM evaluations;

SELECT * FROM payrolls;


-- INNER JOIN②
USE hr_data2;

SELECT
	* 
FROM 
	evaluations
		INNER JOIN
	employees ON evaluations.employee_id = employees.employee_id;

SELECT 
    *
FROM
    employees
        INNER JOIN
    evaluations ON evaluations.employee_id = employees.employee_id
WHERE
    SEX = 'm'
ORDER BY employees.employee_id DESC;

-- LEFT JOIN
SELECT 
    *
FROM
    employees
        LEFT JOIN
    evaluations ON evaluations.employee_id = employees.employee_id;

SELECT 
    *
FROM
    employees
        LEFT OUTER JOIN
    evaluations ON evaluations.employee_id = employees.employee_id;


-- RIGHT JOIN
SELECT 
    *
FROM
    evaluations
        RIGHT JOIN
    employees ON evaluations.employee_id = employees.employee_id;


SELECT 
    *
FROM
    evaluations
        RIGHT OUTER JOIN
    employees ON evaluations.employee_id = employees.employee_id;


SELECT 
    *
FROM
    evaluations
        RIGHT OUTER JOIN
    employees ON evaluations.employee_id = employees.employee_id;


SELECT 
    *
FROM
    evaluations FULL
        JOIN
    employees ON evaluations.employee_id = employees.employee_id;


-- CROSS JOIN
USE hr_data2;


SELECT 
    *
FROM
    employees
        CROSS JOIN
    evaluations;


SELECT 
    *
FROM
    employees
        CROSS JOIN
    evaluations ON evaluations.employee_id = employees.employee_id;


SELECT 
    *
FROM
    employees
        INNER JOIN
    evaluations ON evaluations.employee_id = employees.employee_id;


SELECT 
    *
FROM
    employees
        CROSS JOIN
    evaluations
WHERE
    evaluations.employee_id = employees.employee_id;


SELECT 
    *
FROM
    employees
        INNER JOIN
    evaluations;
    

-- SELF JOIN
USE hr_data2;


SELECT 
    *
FROM
    employees emp01
        JOIN
    employees emp02 ON emp02.employee_id = emp01.rater;


SELECT 
    *
FROM
    employees emp02
        JOIN
    employees emp01 ON emp02.employee_id = emp01.rater;

-- 3つ以上のテーブルへのJOIN
USE hr_data2;


SELECT 
    *
FROM
    employees
        INNER JOIN
    evaluations ON evaluations.employee_id = employees.employee_id
        INNER JOIN
    payrolls ON payrolls.employee_id = employees.employee_id;


SELECT 
    employees.employee_id,
    employees.last_name,
    employees.first_name,
    evaluations.rating,
    payrolls.payroll_rate
FROM
    employees
        INNER JOIN
    evaluations ON evaluations.employee_id = employees.employee_id
        INNER JOIN
    payrolls ON payrolls.employee_id = employees.employee_id;


SELECT 
    employees.employee_id,
    employees.last_name,
    employees.first_name,
    evaluations.rating,
    payrolls.payroll_rate
FROM
    employees
        RIGHT JOIN
    evaluations ON evaluations.employee_id = employees.employee_id
        RIGHT JOIN
    payrolls ON payrolls.employee_id = employees.employee_id;


SELECT 
    employees.employee_id,
    employees.last_name,
    employees.first_name,
    evaluations.rating,
    payrolls.payroll_rate
FROM
    employees
        RIGHT JOIN
    evaluations ON evaluations.employee_id = employees.employee_id
        INNER JOIN
    payrolls ON payrolls.employee_id = employees.employee_id;


SELECT 
    employees.employee_id,
    employees.last_name,
    employees.first_name,
    evaluations.rating,
    payrolls.payroll_rate
FROM
    employees
        INNER JOIN
    evaluations ON evaluations.employee_id = employees.employee_id
        RIGHT JOIN
    payrolls ON payrolls.employee_id = employees.employee_id;


-- UNION
USE hr_data2;


SELECT 
    *
FROM
    employees
WHERE
    employee_id = 1001 
UNION SELECT 
    *
FROM
    employees
WHERE
    employee_id = 1002;


SELECT 
    *
FROM
    employees
WHERE
    employee_id = 1001 
UNION SELECT 
    *
FROM
    employees
WHERE
    sex = 'm';



SELECT 
    *
FROM
    employees
WHERE
    employee_id = 1001 
UNION ALL SELECT 
    *
FROM
    employees
WHERE
    sex = 'm';


SELECT 
    *
FROM
    employees
WHERE
    employee_id = 1001 
UNION ALL SELECT 
    *
FROM
    employees
WHERE
    sex = 'm' 
UNION ALL SELECT 
    *
FROM
    employees
WHERE
    age >= 30;


SELECT 
    employee_id
FROM
    employees 
UNION ALL SELECT 
    employee_id
FROM
    payrolls;


SELECT 
    *
FROM
    employees 
UNION ALL SELECT 
    *
FROM
    payrolls;


SELECT 
    *
FROM
    evaluations 
UNION ALL SELECT 
    *
FROM
    payrolls;


SELECT 
    employee_id, last_name, first_name, sex, rater
FROM
    employees 
UNION ALL SELECT 
    *
FROM
    payrolls;


SELECT 
    *
FROM
    employees
WHERE
    employee_id = 1001 
UNION ALL SELECT 
    *
FROM
    employees
WHERE
    sex = 'w'
GROUP BY sex
ORDER BY employee_id DESC;


-- ケーススタディ演習1解説
USE ecsite;
SELECT * FROM users;
SELECT * FROM order_details;
SELECT * FROM orders;
SELECT * FROM products;
SELECT 
    *
FROM
    users
        LEFT OUTER JOIN
    orders ON users.id = orders.user_id;

-- ANS.
SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    order_details.product_id,
    order_details.amount
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON order_details.order_id = orders.id;

-- ケーススタディ演習2解説
SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    order_details.product_id,
    order_details.amount,
    products.name,
    products.price * order_details.amount AS "合計金額"
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON order_details.order_id = orders.id
		INNER JOIN
	products ON order_details.product_id = products.id
;

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
    order_details.amount * price AS total_fee,
    order_details.amount * price * 1.1 AS tax_included
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON order_details.order_id = orders.id
        INNER JOIN
    products ON order_details.product_id = products.id
ORDER BY users.id;


-- ケーススタディ演習3解説
SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    order_details.product_id,
    order_details.amount,
    products.name,
    order_details.amount * price AS total_fee,
    order_details.amount * price * 1.1 AS tax_included,
    SUM(order_details.amount * price) AS "合計発注額",
    SUM(order_details.amount) AS "合計発注量"
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


-- ケーススタディ演習4解説
SELECT * FROM product_reviews;
show tables;

SELECT 
    products.name, 
    product_reviews.body,
    users.id, 
    users.name
FROM
    products
        RIGHT OUTER JOIN
    product_reviews ON products.id = product_reviews.product_id
        INNER JOIN
    users ON product_reviews.user_id = users.id;
    
-- ANS.
SELECT 
    products.id,
    products.name,
    product_reviews.body,
    product_reviews.user_id,
    users.name
FROM
    products
        LEFT JOIN
    product_reviews ON products.id = product_reviews.product_id
        INNER JOIN
    users ON product_reviews.user_id = users.id;
    

-- ケーススタディ演習5解説
SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    order_details.product_id,
    order_details.amount,
    products.name,
    order_details.amount * price AS total_fee,
    order_details.amount * price * 1.1 AS tax_included
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON order_details.order_id = orders.id
        INNER JOIN
    products ON order_details.product_id = products.id
UNION
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
;


-- ANS.
(SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    order_details.product_id,
    order_details.amount,
    products.name,
    order_details.amount * price AS total_fee,
    order_details.amount * price * 1.1 AS tax_included
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON order_details.order_id = orders.id
        INNER JOIN
    products ON order_details.product_id = products.id) 
UNION ALL 
(SELECT 
    users.id,
    '',
    '',
    '',
    '',
    '',
    '',
    'TOTAL',
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
GROUP BY users.id)
ORDER BY id , total_fee;
