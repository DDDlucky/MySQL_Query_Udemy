USE ecsite;

CREATE VIEW user_list AS
    SELECT 
        *
    FROM
        users;


SELECT * FROM user_list;


CREATE VIEW order_list AS
    SELECT 
        users.id,
        users.name,
        users.email,
        users.gender,
        users.birthday,
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


SELECT * FROM order_list;

DROP VIEW order_list;


