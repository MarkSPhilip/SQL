


-----------------------------------X-----------------------------------

-- creating a db:

CREATE DATABASE org;

-- to view whats inside a db:
SHOW DATABASES;

-- we use it , so that it can know where every next command should execute :
USE org;

-- creating a table :
create table WORKER(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

 -- Inserting  multiple values in a table:
INSERT INTO WORKER 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(1,'Mark', 'Philip', 1000, '2020-02-14 19:00:00', 'HR'),
		(2,'Hanok', 'Philip', 10000, '2020-03-14 19:00:00', 'Admin'),
		(3,'Sheelu', 'Philip', 10000, '2020-12-14 19:00:00', 'HR'),
		(4,'Titus', 'Philip', 10000, '2020-02-14 19:00:00', 'Admin'),
		(5,'Mama', 'Philip', 1000, '2020-02-14 19:00:00', 'HR');
        
SELECT * FROM WORKER WHERE SALARY BETWEEN 1000 AND 10000;
SELECT * FROM WORKER;


-- inserting single value at a time :
INSERT INTO WORKER VALUES(6, 'AAA' ,'Philip' ,1,'2020-02-14 19:00:00', 'HR');

-- creating a table :
CREATE TABLE BONUS (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WORKER(WORKER_ID)
		
);

 -- Inserting values in a table:
INSERT INTO BONUS
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(1, 5000,'17-04-20'),
		(2, 2000,'12-02-11'),
		(3, 3000,'22-03-11'),
		(4, 4000,'13-03-21'),
		(5, 6000,'16-12-22');

-- inserting single value at a time:
INSERT INTO BONUS VALUES (6, NULL,'16-12-22');
        
-- creating a table :
CREATE TABLE TITLE (
	WORKER_REF_ID INT, 
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WORKER(WORKER_ID)
		ON DELETE CASCADE
);

 -- Inserting values in a table:
INSERT INTO TITLE
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
		(001,'Manager', '2026-02-20 00:00:00'),
		(005,'Executive', '2026-02-11 00:00:00'),
		(004,'Manager', '2026-02-20 00:00:00'),
		(002,'Lead', '2026-02-20 00:00:00'),
		(003,'Manager', '2026-02-20 00:00:00');

-- deleting multiple values:
DELETE FROM TITLE WHERE (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) IN (
    (1, 'Manager', '2026-02-20 00:00:00'),
    (5, 'Executive', '2026-02-11 00:00:00'),
    (4, 'Manager', '2026-02-20 00:00:00'),
    (2, 'Lead', '2026-02-20 00:00:00')
);

-- delete only one:
DELETE FROM TITLE WHERE WORKER_REF_ID = 3 AND WORKER_TITLE = 'Manager' AND AFFECTED_FROM = '2026-02-20 00:00:00';

-- see all:
select * from WORKER;

-- use of WHERE : 
SELECT * FROM WORKER WHERE SALARY > 1000;

-- use of BETWEEN :
SELECT * FROM WORKER WHERE SALARY BETWEEN 1000 AND 10000;

-- use of OR :
SELECT * FROM WORKER WHERE DEPARTMENT = 'HR' OR DEPARTMENT ='Admin';

-- use of IN :
SELECT * FROM WORKER WHERE FIRST_NAME IN ('Mark', 'Hanok', 'Titus');

-- NOT IN :
SELECT * FROM WORKER WHERE DEPARTMENT NOT IN ('HR');

-- IS NULL :
SELECT * FROM BONUS WHERE BONUS_AMOUNT IS NULL;

-- wildcard:
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a';

-- sorting using order by :
SELECT * FROM WORKER  ORDER BY SALARY ;
SELECT * FROM WORKER ORDER BY SALARY DESC;


-- Distinct :
SELECT DISTINCT SALARY FROM WORKER;


-- GROUP BY :
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;

-- Aggregation :
-- 1. COUNT : 
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;

--- 2. SUM:
SELECT DEPARTMENT, SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;

--- 3.  AVG:
SELECT DEPARTMENT, AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- 4. MIN :
SELECT DEPARTMENT ,MIN(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- 5. MAX:
SELECT DEPARTMENT ,MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- GROUP BY HAVING :
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)=2;

-- SELECT can also work without FROM
SELECT WORKER_REF_ID FROM TITLE;
select 44+10;
select now();
select lcase('MARK');
select ucase('mark');

-- delete complete db/table :
drop database org;
drop table M;

-- deleting all row at once:
truncate table TITLE;


CREATE TABLE M (
    id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE, -- UNIQUE
    worker_id INT,
    WORKER_REF_ID INT,
    balance INT(10),
    age INT DEFAULT 15, -- DEFAULT
    CONSTRAINT check_balance CHECK(balance>1000), -- CHECK
    FOREIGN KEY (worker_id) REFERENCES WORKER(WORKER_ID), -- FOREIGN KEY
    FOREIGN KEY (WORKER_REF_ID) REFERENCES TITLE(WORKER_REF_ID)
);

INSERT INTO M (id, name, worker_id, WORKER_REF_ID, balance) VALUES
 (1,'m',1,1,10000),
 (2,'a',2,2,22222);
 


-- ADD new column:
ALTER TABLE  M ADD sex char(1);

-- MODIFY:
ALTER TABLE M MODIFY sex VARCHAR(1) DEFAULT 0;

-- to see all the details of the column in a table;
DESC Details;

-- CHANGE COLUMN name:
ALTER TABLE M CHANGE COLUMN sex S char(1);

-- DROP COLUMN;
ALTER TABLE M DROP COLUMN S;

-- RENAME TABLE:
ALTER TABLE D RENAME TO Details;

-- INSERTing ways:
-- 1.
INSERT INTO Details (id,name,worker_id,WORKER_REF_ID,balance,age)
VALUES (1,'m',1,1,10000,12),
		(2,'a',2,2,12332,20);
    
-- 2.
INSERT INTO Details (id,name,worker_id,WORKER_REF_ID,balance,age)
VALUES (3,'d',3,3,222332,22);

-- 3.
INSERT INTO Details VALUES (8,'ugg',4,5,100000,50);

-- 4.
INSERT INTO Details (id,name)
VALUES (5,'dd');

select * from details;

-- UPDATE:
UPDATE Details SET Worker_id = 5,WORKER_REF_ID=5, balance=11111 WHERE id =5;

-- UPDATE multiple rows:
SET SQL_SAFE_UPDATES=0;
UPDATE Details SET age=100;
UPDATE Details SET age=100+100;

-- DELETE single or multiple rows:
DELETE FROM Details WHERE age = 50;

-- DELETE all rows:
DELETE FROM Details;

-- DELETE Constraints: 
-- (1) ON DELETE CASCADE: when deleting from parent,those inherited values will also get deleted from child.
CREATE TABLE A(
id INT PRIMARY KEY,
age INT DEFAULT 100
);

INSERT INTO A(id,age) VALUES 
(1,12),
(2,23);

SELECT * FROM A;

CREATE TABLE B(
b_id INT,
age INT DEFAULT 100,
FOREIGN KEY(b_id) references A(id) ON DELETE CASCADE
);

INSERT INTO B(b_id,age) VALUES 
(1,122),
(2,223);

SELECT * FROM B;

DELETE FROM A WHERE id = 1; -- values referencing this foreign key value will also get deleted.


-- (2) ON DELETE SET NULL: when deleting from parent,those inherited values will become 0 in  child.

CREATE TABLE C(
id INT PRIMARY KEY,
age INT DEFAULT 100
);

INSERT INTO C(id,age) VALUES 
(1,12),
(2,23);

SELECT * FROM C;

CREATE TABLE D(
d_id INT,
age INT DEFAULT 100,
FOREIGN KEY(d_id) references C(id) ON DELETE SET NULL
);


INSERT INTO D(d_id,age) VALUES 
(1,122),
(2,223);

SELECT * FROM D;

DELETE FROM C WHERE id = 1; -- values referencing this foreign key value will get changed to NULL.

-- REPLACE:
-- (1) If Data already present, it will REPLACE:
REPLACE INTO C( id,age) VALUES(1,99); -- we already had entry with id as 1 , so replaced
REPLACE INTO C SET id = 1, age = 9999; 

-- (2) If Data not present, it will INSERT:
REPLACE INTO C(id) VALUES (0); -- re didn't had entry with id as 0 , so inserted
REPLACE INTO C SET id = 5; 


-- JOINS: JOINS are used to fetch data using established relations.

-- INNER JOIN:
CREATE TABLE A1(
a_id INT PRIMARY KEY,
First_name VARCHAR(255)
);

INSERT INTO A1 (a_id,First_name) VALUES
(1,'mark'),
(2,'Hanok');

CREATE TABLE B1(
b_id INT PRIMARY KEY,
Last_name VARCHAR(255)
);

INSERT INTO B1 (b_id,Last_name) VALUES
(1,'philip'),
(2,'philip'),
(3,'philip'),
(4,'philip'),
(5,'philip'),
(6,'philip'),
(7,'philip'),
(8,'philip');

SELECT A1.*,B1.* FROM A1 INNER JOIN B1 ON A1.a_id = B1.b_id;


-- ALIAS:
SELECT a_id,First_name FROM A1 AS a;

-- LEFT JOIN:
SELECT A1.*,B1.* FROM A1 LEFT JOIN B1 ON A1.a_id = B1.b_id;
SELECT a_id as id, First_name, Last_name FROM A1 LEFT JOIN B1 ON A1.a_id = B1.b_id;


-- RIGHT JOIN:
SELECT A1.*, B1.* FROM A1 AS a RIGHT JOIN B1 AS b ON A1.a_id = B1.b_id;

-- FULL JOIN:
-- (1) UNION:
SELECT A1.*,B1.* FROM A1 LEFT JOIN B1 ON A1.a_id = B1.b_id 
UNION 
SELECT A1.*,B1.* FROM A1 RIGHT JOIN B1 ON A1.a_id = B1.b_id;

-- (1) UNION ALL:
SELECT A1.*,B1.* FROM A1 LEFT JOIN B1 ON A1.a_id = B1.b_id 
UNION ALL
SELECT A1.*,B1.* FROM A1 RIGHT JOIN B1 ON A1.a_id = B1.b_id;

-- CROSS JOIN:
SELECT A1.*,B1.* FROM A1 CROSS JOIN B1;

-- SELF JOIN:
SELECT A1.*,B1.* FROM A1 INNER JOIN B1 on A1.a_id = B1.b_id;

-- JOIN without using INNER JOIN:
SELECT * FROM A1 AS a, B1 AS b WHERE A1.a_id = B1.b_id;

-- -----------------------------------------------
-- SET OPERATIONS:

CREATE TABLE table1 (
col1 CHAR(1),
col2 int
);

CREATE TABLE table2 (
col1 CHAR(1),
col2 int
);

INSERT INTO table1 (col1,col2) VALUES
('A',1),
('B',2),
('C',3);

INSERT INTO table2 (col1,col2) VALUES
('A',1),
('B',1),
('D',3);

-- (1)UNION:
SELECT* FROM table1 UNION SELECT* FROM table2;

-- (2)INTERSECT:
SELECT DISTINCT* FROM table1 INNER JOIN table2 WHERE table1.col1 = table2.col1;
SELECT DISTINCT col1 FROM table1 INNER JOIN table2  USING(col1);

-- (3)MINUS:
SELECT table1.* FROM table1 LEFT JOIN table2 USING(col1) WHERE table2.col1 IS NULL;

-- Sub Queries:
-- Basic:
SELECT * FROM table1 WHERE col1 IN (SELECT col1 FROM table2 WHERE col2=1);
SELECT *FROM table1 WHERE col1 IN (SELECT col1 FROM table2 WHERE col2 = 1) AND col1 != 'A';

-- Subquery using FROM clause:
SELECT col1 FROM(SELECT * FROM table2 WHERE col2 = 3) AS unique_values;

-- Subquery using SELECT:
SELECT (SELECT col1 FROM table2 WHERE col2 = 1 AND col1 = table1.col1) AS col1  FROM table1;

-- Corelated Subquery:
-- Lets find value which is 3rd largest :
SELECT * FROM table1 t1 WHERE 3 = (SELECT COUNT(t2.col1) FROM table1 t2 WHERE t2.col1 >= t1.col1);

-- Creating a VIEW:
CREATE VIEW name_list AS SELECT col1 FROM table1;

-- Viewing the VIEW:
SELECT * FROM name_list;

-- Altering the VIEW:
ALTER VIEW name_list AS SELECT col1,col2 FROM table1;

-- Droping the VIEW:
DROP VIEW IF EXISTS name_list;


----------------------------------X---------------------------------------