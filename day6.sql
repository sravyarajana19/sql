mysql> use pfs3;
Database changed
mysql> CREATE TABLE STUDENT(
    -> SID INT,
    -> SNAME VARCHAR(30),
    -> MOBILE VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.22 sec)

mysql> INSERT INTO STUDENT VALUES
    -> (111, 'MAJILI', ,9346753873'),
    '> (112, 'JULIET', ,6281709346');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',9346753873'),
(112, 'JULIET', ,6281709346')' at line 2
mysql> INSERT INTO STUDENT VALUES
    -> (111, 'MAJILI', 9346753873'),
    '> (112, 'JULIET', 6281709346');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''),
(112, 'JULIET', 6281709346')' at line 2
mysql> INSERT INTO STUDENT VALUES
    -> (111, 'MAJILI', '9346753873'),
    -> (112, 'JULIET', '6281709346');
Query OK, 2 rows affected (0.05 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT *FROM STUDENT;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | MAJILI | 9346753873 |
|  112 | JULIET | 6281709346 |
+------+--------+------------+
2 rows in set (0.01 sec)

mysql> CREATE USER JULIET IDENTIFIED BY 'JULIET26';
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE USER MAJILI IDENTIFIED BY 'MAJILI19';
Query OK, 0 rows affected (0.02 sec)

mysql> GRANT SELECT, UPDATE ON STUDENTS TO JULIET;
ERROR 1146 (42S02): Table 'pfs3.STUDENTS' doesn't exist
mysql> GRANT SELECT, UPDATE ON STUDENT TO JULIET;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT INSERT ,SELECT, UPDATE, DELETE ON STUDENTS TO JULIET;
ERROR 1146 (42S02): Table 'pfs3.STUDENTS' doesn't exist
mysql> GRANT INSERT ,SELECT, UPDATE, DELETE ON STUDENT TO JULIET;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT SELECTON STUDENT TO JULIET;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'STUDENT TO JULIET' at line 1
mysql> GRANT SELECT ON STUDENT TO JULIET;
Query OK, 0 rows affected (0.01 sec)











TRANSACTION:
===========
a transaction is a sequence of one or more sql operations executed as a single logical unit of work. It ensures that either all operations are completely successfully or none of them are applied to the database


interview one --line--answer:
---------------
a transaction is a logical unit of work consisting one or more sql statements that follows the acid properties to maintain data integrity and consistency.

ACID properties:
----------------
A = atomicity --- either all operations happens or none happen.
C = consistency -- the database remains in a valid state before and after the transaction
I = isolation -- concurrent transaction do no interface with each other.
D = durability --- once committed changes are permanent even if the system crashes.

tcl commands:
------------
1. commit 
2. rollback
3.save point



mysql> select * frome student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'frome student' at line 1
mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | MAJILI | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update student set sname = sharma where sid = 111;
ERROR 1054 (42S22): Unknown column 'sharma' in 'field list'
mysql> update student set sname = 'SHARMA' where sid = 111;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | SHARMA | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | MAJILI | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql> update student set sname = 'SHARMA' where sid = 111;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | SHARMA | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | SHARMA | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into student values(444,'suma','7075127799');
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | SHARMA | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
|  444 | suma   | 7075127799 |
+------+--------+------------+
4 rows in set (0.00 sec)

mysql> update student set sname = 'mahesh' where sid = 111;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | mahesh | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
|  444 | suma   | 7075127799 |
+------+--------+------------+
4 rows in set (0.00 sec)

mysql> delete from student where sid = 112;
Query OK, 1 row affected (0.00 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | mahesh | 9346753873 |
|  113 | RAM    | 9876543210 |
|  444 | suma   | 7075127799 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | SHARMA | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into student values(444,'suma','7075127799');
Query OK, 1 row affected (0.01 sec)

mysql> update student set sname = 'mahesh' where sid = 111;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> savepoint sp1;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from student where sid = 112;
Query OK, 1 row affected (0.00 sec)

mysql> rollback to sp1;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | mahesh | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
|  444 | suma   | 7075127799 |
+------+--------+------------+
4 rows in set (0.00 sec)

mysql> delete from student where sid = 444;
Query OK, 1 row affected (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from student;
+------+--------+------------+
| SID  | SNAME  | MOBILE     |
+------+--------+------------+
|  111 | mahesh | 9346753873 |
|  112 | JULIET | 6281709346 |
|  113 | RAM    | 9876543210 |
+------+--------+------------+
3 rows in set (0.00 sec)

mysql>
mysql> --lock
    -> --set transaction isolation level read commited
    -> ^C
mysql> SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
Query OK, 0 rows affected (0.01 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM STUDENT WHERE SID = 113 FOR UPDATE;
+------+-------+------------+
| SID  | SNAME | MOBILE     |
+------+-------+------------+
|  113 | RAM   | 9876543210 |
+------+-------+------------+
1 row in set (0.01 sec)

mysql> UPDATE STUDENT SET SNAME = 'ARUNKUMAR' WHERE SID = 113;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> COMMIT;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM STUDENT WHERE SID = 113 FOR ;







mysql> Terminal close -- exit!
mysql> use pfs3;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_pfs3  |
+-----------------+
| backupemployees |
| company_staff   |
| employees       |
| products        |
| student         |
+-----------------+
5 rows in set (0.16 sec)

mysql> desc student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| SID    | int         | YES  |     | NULL    |       |
| SNAME  | varchar(30) | YES  |     | NULL    |       |
| MOBILE | varchar(30) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.04 sec)

mysql> insert into student (111, 'arjun',70);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '111, 'arjun',70)' at line 1
mysql> insert into student values(111,'arjun',70);
Query OK, 1 row affected (0.05 sec)

mysql> select * from student;
+------+-----------+------------+
| SID  | SNAME     | MOBILE     |
+------+-----------+------------+
|  111 | mahesh    | 9346753873 |
|  112 | JULIET    | 6281709346 |
|  113 | ARUNKUMAR | 9876543210 |
|  111 | arjun     | 70         |
+------+-----------+------------+
4 rows in set (0.01 sec)

mysql> insert into student values(222,'arun',40);
Query OK, 1 row affected (0.01 sec)

mysql> create table orders(
    -> id int(5),
    -> ordernumber int(10),
    -> orderdate datetime default now());
Query OK, 0 rows affected, 2 warnings (0.10 sec)

mysql> insert into order (id, ordernumber) values (12345, 563743578);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order (id, ordernumber) values (12345, 563743578)' at line 1
mysql> insert into orders(id, ordernumber) values (12345, 563743578);
Query OK, 1 row affected (0.03 sec)

mysql> select * from orders;
+-------+-------------+---------------------+
| id    | ordernumber | orderdate           |
+-------+-------------+---------------------+
| 12345 |   563743578 | 2026-06-30 09:54:58 |
+-------+-------------+---------------------+
1 row in set (0.07 sec)

mysql> insert into orders(id, ordernumber) values (54763, 39864729);
Query OK, 1 row affected (0.04 sec)

mysql> select * from orders;
+-------+-------------+---------------------+
| id    | ordernumber | orderdate           |
+-------+-------------+---------------------+
| 12345 |   563743578 | 2026-06-30 09:54:58 |
| 54763 |    39864729 | 2026-06-30 10:07:24 |
+-------+-------------+---------------------+
2 rows in set (0.00 sec)

mysql> create table school(
    -> sno int(3),
    -> sname varchar(100),
    -> marks int(3),
    -> primary key (sno)
    -> );
Query OK, 0 rows affected, 2 warnings (0.15 sec)

mysql> create table library(
    -> book_name varchar(10),
    -> sno int(3) foreign key references school(sno)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'foreign key references school(sno)
)' at line 3
mysql> create table library(
    -> sno int(3),
    -> book_name varchar(30),
    -> foreign key(sno) references school(sno)
    -> );
Query OK, 0 rows affected, 1 warning (0.12 sec)

mysql> insert into school values (111, 'malli', 90),(222, 'mahi', 56),(333, 'arun',87);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from school;
+-----+-------+-------+
| sno | sname | marks |
+-----+-------+-------+
| 111 | malli |    90 |
| 222 | mahi  |    56 |
| 333 | arun  |    87 |
+-----+-------+-------+
3 rows in set (0.00 sec)

mysql> insert into library values (222, 'c++');
Query OK, 1 row affected (0.03 sec)

mysql> insert into library values (111, 'java');
Query OK, 1 row affected (0.01 sec)

mysql> select * from library;
+------+-----------+
| sno  | book_name |
+------+-----------+
|  222 | c++       |
|  111 | java      |
+------+-----------+
2 rows in set (0.00 sec)

mysql> insert into library values (444, 'c');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`pfs3`.`library`, CONSTRAINT `library_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `school` (`sno`))
mysql> delete from school where sno = 333;
Query OK, 1 row affected (0.03 sec)

mysql> select * from school;
+-----+-------+-------+
| sno | sname | marks |
+-----+-------+-------+
| 111 | malli |    90 |
| 222 | mahi  |    56 |
+-----+-------+-------+
2 rows in set (0.00 sec)

mysql> delete from school where sno = 111;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`pfs3`.`library`, CONSTRAINT `library_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `school` (`sno`))
mysql> update school set sno = 555 where sno = 222;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`pfs3`.`library`, CONSTRAINT `library_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `school` (`sno`))
mysql> delete from library where sno = 222;
Query OK, 1 row affected (0.01 sec)

mysql> select * from library;
+------+-----------+
| sno  | book_name |
+------+-----------+
|  111 | java      |
+------+-----------+
1 row in set (0.00 sec)

mysql> update library set sno = 555 where sno = 111;
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`pfs3`.`library`, CONSTRAINT `library_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `school` (`sno`))
mysql> show tables;
+-----------------+
| Tables_in_pfs3  |
+-----------------+
| backupemployees |
| company_staff   |
| employees       |
| library         |
| orders          |
| products        |
| school          |
| student         |
+-----------------+
8 rows in set (0.10 sec)

mysql> drop database pfs3;
Query OK, 8 rows affected (0.38 sec)

mysql> create database da3;
Query OK, 1 row affected (0.01 sec)

mysql> use da3;
Database changed
mysql> create table departments(
    -> dept_id int primary key,
    -> dept_name varchar(30)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> create table employees(
    -> emp_id int primary key,
    -> name varchar(100),
    -> dept_id int,
    -> foreign key(dept_id)
    -> references department(dept_id)
    -> on delete cascade, on update cascade
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'on update cascade
)' at line 7
mysql> CREATE TABLE employees (
    ->     emp_id INT PRIMARY KEY,
    ->     name VARCHAR(100),
    ->     dept_id INT,
    ->     FOREIGN KEY (dept_id)
    ->         REFERENCES department(dept_id)
    ->         ON DELETE CASCADE
    ->         ON UPDATE CASCADE
    -> ^C
mysql> CREATE TABLE employees (
    -> emp_id int primary key,
    -> name varchar(100),
    -> dept_id int,
    -> foreign key (dept_id)
    -> references department(dept_id)
    -> on delete cascade
    -> on update cascade
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'department'
mysql> CREATE TABLE employees (
    -> emp_id int primary key,
    -> name VARCHAR(100),
    -> foreign key (dept_id)
    -> references departments(dept_id)
    -> on delete cascade
    -> on update cascade
    -> );
ERROR 1072 (42000): Key column 'dept_id' doesn't exist in table
mysql> CREATE TABLE employees (
    ->  emp_id INT PRIMARY KEY,
    ->  name VARCHAR(100),
    ->  dept_id INT,
    ->  FOREIGN KEY (dept_id)
    -> REFERENCES departments(dept_id)
    ->  ON DELETE CASCADE
    ->  ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> insert into  departments values (1, 'it') , (2, 'hr'), (3, ' fianance');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from departments;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | it        |
|       2 | hr        |
|       3 |  fianance |
+---------+-----------+
3 rows in set (0.01 sec)

mysql> insert into  departments values(1, 'IT'),(2, 'HR'),(3, 'Fianance');
ERROR 1062 (23000): Duplicate entry '1' for key 'departments.PRIMARY'
mysql> select * from employees;
Empty set (0.01 sec)

mysql> insert into employees values(101, 'Ravi'),(102, 'Rahul'),(103, 'Arjun');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into employees values(101, 'Ravi',1),(102, 'Rahul',2),(103, 'Arjun',3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employees;
+--------+-------+---------+
| emp_id | name  | dept_id |
+--------+-------+---------+
|    101 | Ravi  |       1 |
|    102 | Rahul |       2 |
|    103 | Arjun |       3 |
+--------+-------+---------+
3 rows in set (0.00 sec)

mysql> delete from departments where dept_id = 2;
Query OK, 1 row affected (0.01 sec)

mysql> update departments set dept_id = 5 where dept_id = 3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employees;
+--------+-------+---------+
| emp_id | name  | dept_id |
+--------+-------+---------+
|    101 | Ravi  |       1 |
|    103 | Arjun |       5 |
+--------+-------+---------+
2 rows in set (0.00 sec)

