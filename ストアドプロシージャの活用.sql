-- ストアドプロシージャの活用
USE ecsite;

DELIMITER $$
CREATE PROCEDURE avg_price()
BEGIN
SELECT AVG(price) FROM products;
END$$
DELIMITER ;

CALL avg_price;
CALL avg_price();

DROP PROCEDURE avg_price;

DELIMITER $$
CREATE PROCEDURE avg_price(IN input INT)
BEGIN
SELECT * FROM users WHERE id = input;
END$$
DELIMITER ;

CALL avg_price; -- error
CALL avg_price(5);

DROP PROCEDURE avg_price;

DELIMITER $$
CREATE PROCEDURE users_info(IN input INT, OUT output varchar(255) )
BEGIN
SELECT email INTO output FROM users WHERE id = input;
END$$
DELIMITER ;

call users_info(1, @output);
SELECT @output;


-- パラメーターの活用
USE ecsite;

DELIMITER $$

CREATE PROCEDURE avg_price()

BEGIN

SELECT AVG(price) FROM products;

END$$

DELIMITER ;



CALL avg_price;

CALL avg_price();



DROP PROCEDURE avg_price;


DELIMITER $$

CREATE PROCEDURE avg_price(IN input INT)

BEGIN

SELECT * FROM users WHERE id = input;

END$$

DELIMITER ;



CALL avg_price;
-- error

CALL avg_price(5);

DROP PROCEDURE avg_price;

DELIMITER $$

CREATE PROCEDURE users_info(IN input INT, OUT output varchar(255) )

BEGIN

SELECT email INTO output FROM users WHERE id = input;

END$$

DELIMITER ;

call users_info(1, @output);

SELECT @output;


-- ストアドファンクションの活用
DELIMITER $$
CREATE FUNCTION zei_sum(input INT) RETURNS FLOAT(10,2) DETERMINISTIC
BEGIN
DECLARE zei FLOAT(3,2);
SET zei = 1.10;
RETURN input * zei;
END$$
DELIMITER ;

SELECT zei_sum(1300);

SELECT zei_sum(price) FROM products;

DELIMITER $$
CREATE FUNCTION zei_sum(input INT) RETURNS FLOAT(10,2) DETERMINISTIC
BEGIN
DECLARE zei FLOAT(3,2);
SET zei = 1.10;

SELECT price FROM products
WHERE id = input;

RETURN price * zei;
END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION zei_sum(input INT) RETURNS FLOAT(10,2) DETERMINISTIC
BEGIN
DECLARE p_price INT(5);
DECLARE zei FLOAT(3,2);
SET zei = 1.10;

SELECT price INTO p_price FROM products
WHERE id = input;

RETURN p_price * zei;
END$$
DELIMITER ;