mysql> use pfs3
Database changed
mysql> SELECT * FROM EMPLOYEES;
Empty set (0.09 sec)

mysql> SHOW TABLES;
+----------------+
| Tables_in_pfs3 |
+----------------+
| company_staff  |
| employees      |
+----------------+
2 rows in set (0.12 sec)

mysql> DESC EMPLOYEES;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| EMPID     | char(5)     | YES  |     | NULL    |       |
| FIRSTNAME | varchar(30) | YES  |     | NULL    |       |
| LASTNAME  | varchar(30) | YES  |     | NULL    |       |
| AGE       | int         | YES  |     | NULL    |       |
| DOJ       | date        | YES  |     | NULL    |       |
| ADDRESS   | tinytext    | YES  |     | NULL    |       |
| DEPT      | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.04 sec)

mysql> INSERT INTO EMPLOYEE(EMPID, FIRSTNAME, LASTNAME, AGE, DOJ, ADDRESS, DEPT)
    -> VALUES
    -> ('E001','SRAVYA','SRI',22,'2026-06-27','VIJ','IT');
ERROR 1146 (42S02): Table 'pfs3.employee' doesn't exist
mysql> INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, LASTNAME, AGE, DOJ, ADDRESS, DEPT)
    -> VALUES
    -> ('E001','SRAVYA','SRI',22,'2026-06-27','VIJ','IT');
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT |
+-------+-----------+----------+------+------------+---------+------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT   |
+-------+-----------+----------+------+------------+---------+------+
1 row in set (0.00 sec)

mysql> INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, LASTNAME, AGE, DOJ, ADDRESS, DEPT)
    -> VALUES
    -> ('E002','RAJANA','SRI',21,'2026-06-27','VIJ','RABOTICS');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, LASTNAME, AGE, DOJ, ADDRESS, DEPT)
    -> VALUES
    -> ('E003','NISSI','KAKARA',22,'2026-06-27','VIJ','SALES');;
Query OK, 1 row affected (0.01 sec)

ERROR: 
No query specified

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
+-------+-----------+----------+------+------------+---------+----------+
3 rows in set (0.00 sec)

mysql> DESC COMPANY_STAFF;
+---------------+----------------------------------------------------+------+-----+---------+-------+
| Field         | Type                                               | Null | Key | Default | Extra |
+---------------+----------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME  | varchar(100)                                       | YES  |     | NULL    |       |
| EMP_ID        | int                                                | YES  |     | NULL    |       |
| AGE           | tinyint                                            | YES  |     | NULL    |       |
| EXPERIENCE    | smallint                                           | YES  |     | NULL    |       |
| GENDER        | char(1)                                            | YES  |     | NULL    |       |
| EMPLOYEE_NAME | varchar(50)                                        | YES  |     | NULL    |       |
| QUALIFICATION | varchar(100)                                       | YES  |     | NULL    |       |
| ADDRESS       | tinytext                                           | YES  |     | NULL    |       |
| SALARY        | decimal(10,2)                                      | YES  |     | NULL    |       |
| BONUS         | decimal(10,2)                                      | YES  |     | NULL    |       |
| DEPARTMENT    | enum('HR','IT','SALES','FINANCE','SUPPORT')        | YES  |     | NULL    |       |
| STATUS        | varchar(100)                                       | YES  |     | NULL    |       |
| SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMMUNICATION') | YES  |     | NULL    |       |
| JOINING_DATE  | date                                               | YES  |     | NULL    |       |
| EMAIL         | varchar(100)                                       | YES  |     | NULL    |       |
| PHONE_NUMBER  | int                                                | YES  |     | NULL    |       |
+---------------+----------------------------------------------------+------+-----+---------+-------+
16 rows in set (0.00 sec)
mysql> INSERT INTO EMPLOYEES(COMPANY_NAME, EMP_ID, AGE, EXPERIENCE, GENDER, EMPLOYEE_NAME, QUALIFICATION, ADDRESS, SALARY, BONUS, DEPARTMENT, STATUS, SKILLS, JOINING_DATE, EMAIL, PHONE_NUMBER)^C
mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
+-------+-----------+----------+------+------------+---------+----------+
3 rows in set (0.00 sec)


APPROACH 2:
============
INSERT INTO TABLE-NAME VALUES(VALUE1,VALUE2,VALUE3......VALUESN);


mysql> INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, LASTNAME, AGE, DOJ, ADDRESS, DEPT)
    -> VALUES
    -> ('E004','rani','pappu',22,'2026-06-27','VIJ','java'),
    -> ('E005','mani','mercy',23,'2026-06-27','VIJ','python'),
    -> ('E006','rama','laxmi',23,'2026-06-27','VIJ','c'),
    -> ('E007','ravana','chigadam',23,'2026-06-27','VIJ','c');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java     |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python   |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c        |
| E007  | ravana    | chigadam |   23 | 2026-06-27 | VIJ     | c        |
+-------+-----------+----------+------+------------+---------+----------+
7 rows in set (0.00 sec)

APPROACH 3:
===========
 INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, AGE, ADDRESS, DEPT)
    -> VALUES
    -> ('E009','NARAYANA',23,'VIJ','c');
GIVES NULL VALUES 


APPROCH 4:

=========
 INSERT INTO EMPLOYEES SET VALUES=VALUES;



mysql> INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, LASTNAME, DOJ, ADDRESS)
    -> VALUES
    -> ('E008','PRABHAKAR','RAJANA''2026-06-27','VIJ');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, LASTNAME, DOJ, ADDRESS)
    -> VALUES
    -> ('E008','PRABHAKAR','RAJANA','2026-06-27','VIJ');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java     |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python   |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c        |
| E007  | ravana    | chigadam |   23 | 2026-06-27 | VIJ     | c        |
| E008  | PRABHAKAR | RAJANA   | NULL | 2026-06-27 | VIJ     | NULL     |
+-------+-----------+----------+------+------------+---------+----------+
8 rows in set (0.00 sec)

mysql> INSERT INTO EMPLOYEES(EMPID, FIRSTNAME, AGE, ADDRESS, DEPT)
    -> VALUES
    -> ('E009','NARAYANA',23,'VIJ','c');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java     |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python   |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c        |
| E007  | ravana    | chigadam |   23 | 2026-06-27 | VIJ     | c        |
| E008  | PRABHAKAR | RAJANA   | NULL | 2026-06-27 | VIJ     | NULL     |
| E009  | NARAYANA  | NULL     |   23 | NULL       | VIJ     | c        |
+-------+-----------+----------+------+------------+---------+----------+
9 rows in set (0.00 sec)

mysql> INSERT INTO EMPLOYEES SET EMPID='E010',FIRSTNAME='ROHITH',LASTNAME='KUMAR',AGE=19,DOJ='2026-06-27',ADDRESS='VIJ',DEPT='CSE';
Query OK, 1 row affected (0.01 sec)

mysql> 
mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java     |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python   |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c        |
| E007  | ravana    | chigadam |   23 | 2026-06-27 | VIJ     | c        |
| E008  | PRABHAKAR | RAJANA   | NULL | 2026-06-27 | VIJ     | NULL     |
| E009  | NARAYANA  | NULL     |   23 | NULL       | VIJ     | c        |
| E010  | ROHITH    | KUMAR    |   19 | 2026-06-27 | VIJ     | CSE      |
+-------+-----------+----------+------+------------+---------+----------+
10 rows in set (0.00 sec)

UPDATE:
=======
SYNTAX:
UPDATE TABLE-NAME SET COLUMN-NAME = VALUE WHARE CONDITION;

mysql> UPDATE EMPLOYEES SET DOJ='20-06-28' WHERE LASTNAME='CHIGADAM';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java     |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python   |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c        |
| E007  | ravana    | chigadam |   23 | 2020-06-28 | VIJ     | c        |
| E008  | PRABHAKAR | RAJANA   |   30 | 2026-06-27 | VIJ     | NULL     |
| E009  | NARAYANA  | CHIGADAM |   23 | 2020-06-28 | VIJ     | c        |
| E010  | ROHITH    | KUMAR    |   19 | 2026-06-27 | VIJ     | CSE      |
+-------+-----------+----------+------+------------+---------+----------+
10 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEES SET DEPT='IT' WHERE EMPID='E008';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java     |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python   |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c        |
| E007  | ravana    | chigadam |   23 | 2020-06-28 | VIJ     | c        |
| E008  | PRABHAKAR | RAJANA   |   30 | 2026-06-27 | VIJ     | IT       |
| E009  | NARAYANA  | CHIGADAM |   23 | 2020-06-28 | VIJ     | c        |
| E010  | ROHITH    | KUMAR    |   19 | 2026-06-27 | VIJ     | CSE      |
+-------+-----------+----------+------+------------+---------+----------+
10 rows in set (0.00 sec)

DELETE:
======
SYNTAX:
DELECT FROM TABLE-NAME WHERE CONDITION;


mysql> DELECT FROM EMPLOYEES WHERE EMPID='EO10';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DELECT FROM EMPLOYEES WHERE EMPID='EO10'' at line 1
mysql> DELETE FROM EMPLOYEES
    -> WHERE EMPID = 'E010';
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+----------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT     |
+-------+-----------+----------+------+------------+---------+----------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT       |
| E002  | RAJANA    | SRI      |   21 | 2026-06-27 | VIJ     | RABOTICS |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES    |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java     |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python   |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c        |
| E007  | ravana    | chigadam |   23 | 2020-06-28 | VIJ     | c        |
| E008  | PRABHAKAR | RAJANA   |   30 | 2026-06-27 | VIJ     | IT       |
| E009  | NARAYANA  | CHIGADAM |   23 | 2020-06-28 | VIJ     | c        |
+-------+-----------+----------+------+------------+---------+----------+
9 rows in set (0.01 sec)

mysql> DELECT FROM EMPLOYEES WHERE EMPID='E002';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DELECT FROM EMPLOYEES WHERE EMPID='E002'' at line 1
mysql> DELETE FROM EMPLOYEES
    -> WHERE EMPID = 'E002';
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+----------+------+------------+---------+--------+
| EMPID | FIRSTNAME | LASTNAME | AGE  | DOJ        | ADDRESS | DEPT   |
+-------+-----------+----------+------+------------+---------+--------+
| E001  | SRAVYA    | SRI      |   22 | 2026-06-27 | VIJ     | IT     |
| E003  | NISSI     | KAKARA   |   22 | 2026-06-27 | VIJ     | SALES  |
| E004  | rani      | pappu    |   22 | 2026-06-27 | VIJ     | java   |
| E005  | mani      | mercy    |   23 | 2026-06-27 | VIJ     | python |
| E006  | rama      | laxmi    |   23 | 2026-06-27 | VIJ     | c      |
| E007  | ravana    | chigadam |   23 | 2020-06-28 | VIJ     | c      |
| E008  | PRABHAKAR | RAJANA   |   30 | 2026-06-27 | VIJ     | IT     |
| E009  | NARAYANA  | CHIGADAM |   23 | 2020-06-28 | VIJ     | c      |
+-------+-----------+----------+------+------------+---------+--------+
8 rows in set (0.00 sec)

mysql> TRUNCATE TABLE EMPLOYEES;
Query OK, 0 rows affected (0.20 sec)

mysql> SELECT * FROM EMPLOYEES;
Empty set (0.02 sec)

mysql> DROP TABLE EMPLOYESS;
ERROR 1051 (42S02): Unknown table 'pfs3.employess'
mysql> DROP TABLE EMPLOYEES;
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE EMPLOYEES(
    -> EMPID INT AUTO_INCREMENT,
    -> NAME VARCHAR(100),
    -> DEPARTMENT VARCHAR(50)
    -> );
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> CREATE TABLE EMPLOYEES(
    -> EMPID INT AUTO_INCREMENT PRIMARY KEY,
    -> NAME VARCHAR(100),
    -> DEPARTMENT VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO EMPLOYEES (NAME, DEPARTMENT)
    -> VALUES
    -> ('MALLI','IT'),
    -> ('INDU','HR');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPLOYEES;
+-------+-------+------------+
| EMPID | NAME  | DEPARTMENT |
+-------+-------+------------+
|     1 | MALLI | IT         |
|     2 | INDU  | HR         |
+-------+-------+------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO EMPLOYEES (NAME, DEPARTMENT)
    -> VALUES
    -> ('PRABHAKAR','ROBOTICS'),
    -> ('SRAVYA','ROBOTICS');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPLOYEES;
+-------+-----------+------------+
| EMPID | NAME      | DEPARTMENT |
+-------+-----------+------------+
|     1 | MALLI     | IT         |
|     2 | INDU      | HR         |
|     3 | PRABHAKAR | ROBOTICS   |
|     4 | SRAVYA    | ROBOTICS   |
+-------+-----------+------------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE BACKUP EMPLOYEES AS SELECT * FROM EMPLOYEES
    -> ^C
mysql> CREATE TABLE BACKUPEMPLOYEES AS
    -> SELECT * FROM EMPLOYEES;
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> DESC BACKUPEMPLOYEES;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| EMPID      | int          | NO   |     | 0       |       |
| NAME       | varchar(100) | YES  |     | NULL    |       |
| DEPARTMENT | varchar(50)  | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> SELECT * FROM BACKUPEMPLOYEES;
+-------+-----------+------------+
| EMPID | NAME      | DEPARTMENT |
+-------+-----------+------------+
|     1 | MALLI     | IT         |
|     2 | INDU      | HR         |
|     3 | PRABHAKAR | ROBOTICS   |
|     4 | SRAVYA    | ROBOTICS   |
+-------+-----------+------------+
4 rows in set (0.00 sec)

mysql> CREATE TBLE PRODUCTS(
    -> PRODUCT_ID INT PRIMARY KEY,
    -> PRICE DECIMAL(10,2),
    -> QUANTITY INT,
    -> TOTAL_AMOUNT DECIMAL(10,2) GENERATED ALWAYS AS (PRICE * QUANTITY) STORED
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TBLE PRODUCTS(
PRODUCT_ID INT PRIMARY KEY,
PRICE DECIMAL(10,2),
QUANTITY INT,
TO' at line 1
mysql> CREATE TABLE PRODUCTS(
    -> PRODUCTID INT PRIMARY KEY,
    -> PRICE DECIMAL(10,2),
    -> QUANTITY INT,
    -> TOTALAMOUNT DECIMAL(10,2) GENERATED ALWAYS AS (PRICE * QUANTITY) STORED
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM PRODUCTS;
Empty set (0.04 sec)

mysql> INSERT INTO PRODUCTS(PRODUCTID, PRICE, QUANTITY)
    -> VALUES
    -> (1,50,3),
    -> (2,200.35,6);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM PRODUCTS;
+-----------+--------+----------+-------------+
| PRODUCTID | PRICE  | QUANTITY | TOTALAMOUNT |
+-----------+--------+----------+-------------+
|         1 |  50.00 |        3 |      150.00 |
|         2 | 200.35 |        6 |     1202.10 |
+-----------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql> UPDATE PRODUCTS SET PRICE=500 WHERE PRODUCTID=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM PRODUCTS;
+-----------+--------+----------+-------------+
| PRODUCTID | PRICE  | QUANTITY | TOTALAMOUNT |
+-----------+--------+----------+-------------+
|         1 | 500.00 |        3 |     1500.00 |
|         2 | 200.35 |        6 |     1202.10 |
+-----------+--------+----------+-------------+
2 rows in set (0.00 sec)

mysql>



COMPUTED COLUMNS
================


mysql> Terminal close -- exit!
