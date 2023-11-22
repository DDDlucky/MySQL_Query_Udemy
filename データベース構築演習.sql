CREATE DATABASE hr_data;

SHOW DATABASES;

-- 社員情報テーブル 
USE hr_data;

show tables; 

CREATE TABLE employees 
	(
		employee_id INT(6) PRIMARY KEY,
		last_name VARCHAR(15) NOT NULL,
		first_name VARCHAR(15) NOT NULL,
		sex VARCHAR(1) NOT NULL,
		phone VARCHAR(13) NOT NULL UNIQUE KEY,
		joining_date DATE NOT NULL,
		birthday DATE NOT NULL,
		department VARCHAR(30) NOT NULL DEFAULT 'unassigned'
	)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE INDEX index_name ON employees(last_name);

show tables;


INSERT INTO employees

(employee_id, last_name, first_name, sex, phone, joining_date, birthday, department)

VALUES

(1001,'佐藤','隆','m','060-9783-0193',20180401,19750808,'営業'),
(1002,'遠藤','真紀','w','060-8503-1284',20160401,19740808,'人事'),
(1003,'工藤','孝明','m','060-9874-6382',20100401,19720909,'開発');

SELECT * FROM employees;


-- 人事評価テーブル
CREATE TABLE evaluations
 (
    id INT(6) PRIMARY KEY AUTO_INCREMENT,
    employee_id INT(6) NOT NULL,
    year YEAR NOT NULL,
    rating VARCHAR(1) NOT NULL,
    explanation VARCHAR(1000) NOT NULL,
    FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

SHOW tables;

INSERT INTO evaluations
(employee_id, year, rating, explanation) 
VALUES
(1001,2019, 'A','非常に優秀でした。'),
(1002,2019, 'B','良かったです。'),
(1003,2019, 'E','今後の改善が必要です。');

SELECT * FROM evaluations;


-- 給与情報テーブル
CREATE TABLE payrolls 
(
    id INT(6) PRIMARY KEY AUTO_INCREMENT,
    employee_id INT(6) NOT NULL,
    position VARCHAR(20) NOT NULL,
    decided_date DATE NOT NULL,
    payroll_rate INT(20) NOT NULL,
    FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

SHOW tables;

INSERT INTO payrolls
(employee_id, position, decided_date, payroll_rate) 
VALUES
(1001,'営業担当',20190301,200000), 
(1002,'リーダー',20190301,250000),
(1003,'係長',20190301,300000);

SELECT * FROM payrolls;
