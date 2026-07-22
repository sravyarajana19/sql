mysql> use da3;
Database changed

mysql> create orders(
    -> ^C
mysql> create table oders(
    -> id int,
    -> 

    -> order_date date,
    -> total_amount(10,2),
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(10,2),
)' at line 5
mysql> CREATE TABLE orders (
    ->     id INT,
    ->     customer_name VARCHAR(100),
    ->     order_date DATE,
    ->     total_amount DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO Orders VALUES
    ->  (1, 'Alice', '2024-03-01', 1500.00),
    ->  (2, 'Bob', '2024-03-05', 450.00),
    ->  (3, 'Charlie', '2024-03-10', 2500.00),
    ->  (4, 'Diana', '2024-03-15', 800.00),
    ->  (5, 'Eve', '2024-03-20', 1200.00),
    ->  (6, 'Frank', '2024-03-25', 3000.00),
    ->  (7, 'Grace', '2024-04-02', 1800.00),
    ->  (8, 'Henry', '2024-04-08', 950.00),
    ->  (9, 'Ivy', '2024-04-12', 2750.00),
    ->  (10, 'Jack', '2024-04-18', 650.00),
    ->  (11, 'Kevin', '2024-04-22', 4200.00),
    ->  (12, 'Lily', '2024-05-01', 1350.00),
    ->  (13, 'Michael', '2024-05-08', 5000.00),
    ->  (14, 'Nancy', '2024-05-15', 2250.00),
    ->  (15, 'Oliver', '2024-05-25', 900.00);
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select*from orders;
+------+---------------+------------+--------------+
| id   | customer_name | order_date | total_amount |
+------+---------------+------------+--------------+
|    1 | Alice         | 2024-03-01 |      1500.00 |
|    2 | Bob           | 2024-03-05 |       450.00 |
|    3 | Charlie       | 2024-03-10 |      2500.00 |
|    4 | Diana         | 2024-03-15 |       800.00 |
|    5 | Eve           | 2024-03-20 |      1200.00 |
|    6 | Frank         | 2024-03-25 |      3000.00 |
|    7 | Grace         | 2024-04-02 |      1800.00 |
|    8 | Henry         | 2024-04-08 |       950.00 |
|    9 | Ivy           | 2024-04-12 |      2750.00 |
|   10 | Jack          | 2024-04-18 |       650.00 |
|   11 | Kevin         | 2024-04-22 |      4200.00 |
|   12 | Lily          | 2024-05-01 |      1350.00 |
|   13 | Michael       | 2024-05-08 |      5000.00 |
|   14 | Nancy         | 2024-05-15 |      2250.00 |
|   15 | Oliver        | 2024-05-25 |       900.00 |
+------+---------------+------------+--------------+
15 rows in set (0.00 sec)

mysql> select *from orders where order_date between '2024-03-03' and '2024-03-10';
+------+---------------+------------+--------------+
| id   | customer_name | order_date | total_amount |
+------+---------------+------------+--------------+
|    2 | Bob           | 2024-03-05 |       450.00 |
|    3 | Charlie       | 2024-03-10 |      2500.00 |
+------+---------------+------------+--------------+
2 rows in set (0.01 sec)

mysql> UPDATE ORDERS SET TOTAL_AMOUNT =TOTAL_AMOUNT+1000 WHERE ORDER_DATE BETWEEN '2024-03-04' AND '2024-03-10;
    '> UPDATE ORDERS SET TOTAL_AMOUNT =TOTAL_AMOUNT+1000 WHERE ORDER_DATE BETWEEN '2024-03-04' AND '2024-03-10';
    '> ^C
mysql> UPDATE ORDERS
    -> SET TOTAL_AMOUNT = TOTAL_AMOUNT + 1000
    -> WHERE ORDER_DATE BETWEEN '2024-03-04' AND '2024-03-10';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT *FROM ORDERS WHERE ORDER_DATE BETWEEN '2024=03-04' AND '2024-03-10';
+------+---------------+------------+--------------+
| id   | customer_name | order_date | total_amount |
+------+---------------+------------+--------------+
|    2 | Bob           | 2024-03-05 |      1450.00 |
|    3 | Charlie       | 2024-03-10 |      3500.00 |
+------+---------------+------------+--------------+
2 rows in set, 15 warnings (0.00 sec)

mysql> SELECT *FROM ORDERS;
+------+---------------+------------+--------------+
| id   | customer_name | order_date | total_amount |
+------+---------------+------------+--------------+
|    1 | Alice         | 2024-03-01 |      1500.00 |
|    2 | Bob           | 2024-03-05 |      1450.00 |
|    3 | Charlie       | 2024-03-10 |      3500.00 |
|    4 | Diana         | 2024-03-15 |       800.00 |
|    5 | Eve           | 2024-03-20 |      1200.00 |
|    6 | Frank         | 2024-03-25 |      3000.00 |
|    7 | Grace         | 2024-04-02 |      1800.00 |
|    8 | Henry         | 2024-04-08 |       950.00 |
|    9 | Ivy           | 2024-04-12 |      2750.00 |
|   10 | Jack          | 2024-04-18 |       650.00 |
|   11 | Kevin         | 2024-04-22 |      4200.00 |
|   12 | Lily          | 2024-05-01 |      1350.00 |
|   13 | Michael       | 2024-05-08 |      5000.00 |
|   14 | Nancy         | 2024-05-15 |      2250.00 |
|   15 | Oliver        | 2024-05-25 |       900.00 |
+------+---------------+------------+--------------+
15 rows in set (0.00 sec)

mysql> DELETE FROM ORDERS WHERE ORDER_DATE BETWEEN '2024-03-10' AND '2024-03-20';
Query OK, 3 rows affected (0.01 sec)

mysql> SELECT *FROM ORDERS;
+------+---------------+------------+--------------+
| id   | customer_name | order_date | total_amount |
+------+---------------+------------+--------------+
|    1 | Alice         | 2024-03-01 |      1500.00 |
|    2 | Bob           | 2024-03-05 |      1450.00 |
|    6 | Frank         | 2024-03-25 |      3000.00 |
|    7 | Grace         | 2024-04-02 |      1800.00 |
|    8 | Henry         | 2024-04-08 |       950.00 |
|    9 | Ivy           | 2024-04-12 |      2750.00 |
|   10 | Jack          | 2024-04-18 |       650.00 |
|   11 | Kevin         | 2024-04-22 |      4200.00 |
|   12 | Lily          | 2024-05-01 |      1350.00 |
|   13 | Michael       | 2024-05-08 |      5000.00 |
|   14 | Nancy         | 2024-05-15 |      2250.00 |
|   15 | Oliver        | 2024-05-25 |       900.00 |
+------+---------------+------------+--------------+
12 rows in set (0.00 sec)


ysql> CREATE TABLE Emp (
    ->  id INT,
    ->  name VARCHAR(100),
    ->  dept VARCHAR(20),
    ->  salary INT
    ->  );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO Emp VALUES
    ->  (1, 'Alice', 'HR', 35000),
    ->  (2, 'Bob', 'IT', 50000),
    ->  (3, 'Charlie', 'Finance', 45000),
    ->  (4, 'Diana', 'Marketing', 40000),
    ->  (5, 'Eve', 'IT', 55000),
    ->  (6, 'Frank', 'Finance', 48000),
    ->  (7, 'Grace', 'Sales', 37000),
    ->  (8, 'Henry', 'Admin', 42000),
    ->  (9, 'Ivy', 'HR', 39000),
    ->  (10, 'Jack', 'Sales', 46000),
    ->  (11, 'Kevin', 'IT', 60000),
    ->  (12, 'Lily', 'Marketing', 41000),
    ->  (13, 'Michael', 'Admin', 38000),
    ->  (14, 'Nancy', 'Finance', 52000),
    ->  (15, 'Oliver', 'HR', 43000);
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select*from Emp;
+------+---------+-----------+--------+
| id   | name    | dept      | salary |
+------+---------+-----------+--------+
|    1 | Alice   | HR        |  35000 |
|    2 | Bob     | IT        |  50000 |
|    3 | Charlie | Finance   |  45000 |
|    4 | Diana   | Marketing |  40000 |
|    5 | Eve     | IT        |  55000 |
|    6 | Frank   | Finance   |  48000 |
|    7 | Grace   | Sales     |  37000 |
|    8 | Henry   | Admin     |  42000 |
|    9 | Ivy     | HR        |  39000 |
|   10 | Jack    | Sales     |  46000 |
|   11 | Kevin   | IT        |  60000 |
|   12 | Lily    | Marketing |  41000 |
|   13 | Michael | Admin     |  38000 |
|   14 | Nancy   | Finance   |  52000 |
|   15 | Oliver  | HR        |  43000 |
+------+---------+-----------+--------+
15 rows in set (0.00 sec)

mysql> select *from emp where dept in('hr','finance');
+------+---------+---------+--------+
| id   | name    | dept    | salary |
+------+---------+---------+--------+
|    1 | Alice   | HR      |  35000 |
|    3 | Charlie | Finance |  45000 |
|    6 | Frank   | Finance |  48000 |
|    9 | Ivy     | HR      |  39000 |
|   14 | Nancy   | Finance |  52000 |
|   15 | Oliver  | HR      |  43000 |
+------+---------+---------+--------+
6 rows in set (0.00 sec)

mysql> update UPDATE ORDERS
    ->     -> SET TOTAL_AMOUNT = TOTAL_AMOUNT + 1000
    ->     -> WHERE ORDER_DATE BETWEEN '2024-03-04' AND '2024-03-10';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UPDATE ORDERS
    -> SET TOTAL_AMOUNT = TOTAL_AMOUNT + 1000
    -> WHERE ORDER_D' at line 1
mysql> update UPDATE ORDERS
    -> ^C
mysql> update UPDATE emp
    -> set salary=salary+2000
    -> where in 'hr' or'marketing;
    '> where in 'hr' or'marketing';
    '> update UPDATE emp
    '> set salary=salary+2000
    '> where in ('hr','finance');
    '> ^C
mysql> UPDATE emp
    -> SET salary = salary + 2000
    -> WHERE department IN ('HR', 'Marketing');
ERROR 1054 (42S22): Unknown column 'department' in 'where clause'
mysql> UPDATE emp
    -> SET salary = salary + 2000
    -> WHERE depat IN ('HR', 'Marketing');
ERROR 1054 (42S22): Unknown column 'depat' in 'where clause'
mysql> UPDATE emp
    -> SET salary = salary + 2000
    -> WHERE dept IN ('HR', 'Marketing');
Query OK, 5 rows affected (0.01 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> select*from emp;
+------+---------+-----------+--------+
| id   | name    | dept      | salary |
+------+---------+-----------+--------+
|    1 | Alice   | HR        |  37000 |
|    2 | Bob     | IT        |  50000 |
|    3 | Charlie | Finance   |  45000 |
|    4 | Diana   | Marketing |  42000 |
|    5 | Eve     | IT        |  55000 |
|    6 | Frank   | Finance   |  48000 |
|    7 | Grace   | Sales     |  37000 |
|    8 | Henry   | Admin     |  42000 |
|    9 | Ivy     | HR        |  41000 |
|   10 | Jack    | Sales     |  46000 |
|   11 | Kevin   | IT        |  60000 |
|   12 | Lily    | Marketing |  43000 |
|   13 | Michael | Admin     |  38000 |
|   14 | Nancy   | Finance   |  52000 |
|   15 | Oliver  | HR        |  45000 |
+------+---------+-----------+--------+
15 rows in set (0.00 sec)

mysql> delete from emp where dept in('marketing','finance');
Query OK, 5 rows affected (0.01 sec)

mysql> select*from emp;
+------+---------+-------+--------+
| id   | name    | dept  | salary |
+------+---------+-------+--------+
|    1 | Alice   | HR    |  37000 |
|    2 | Bob     | IT    |  50000 |
|    5 | Eve     | IT    |  55000 |
|    7 | Grace   | Sales |  37000 |
|    8 | Henry   | Admin |  42000 |
|    9 | Ivy     | HR    |  41000 |
|   10 | Jack    | Sales |  46000 |
|   11 | Kevin   | IT    |  60000 |
|   13 | Michael | Admin |  38000 |
|   15 | Oliver  | HR    |  45000 |
+------+---------+-------+--------+
10 rows in set (0.00 sec)

mysql> drop table emp;
Query OK, 0 rows affected (0.02 sec)

mysql>mysql> CREATE TABLE Emp (
    ->  id INT,
    ->  name VARCHAR(100),
    ->  dept VARCHAR(20),
    ->  salary INT
    ->  );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> -- STEP 2: Insert Records
mysql> INSERT INTO Emp VALUES
    ->  (1, 'Rahul', 'IT', 50000),
    ->  (2, 'Ramesh', 'HR', 35000),
    ->  (3, 'Karan', 'Finance', 45000),
    ->  (4, 'Mahesh', 'Marketing', 40000),
    ->  (5, 'Suresh', 'IT', 55000),
    ->  (6, 'Arjun', 'Sales', 38000),
    ->  (7, 'Manish', 'Admin', 42000),
    ->  (8, 'Ganesh', 'Finance', 47000),
    ->  (9, 'Naresh', 'HR', 39000),
    ->  (10, 'Rohan', 'IT', 52000),
    ->  (11, 'Mohan', 'Sales', 41000),
    ->  (12, 'Kishan', 'Marketing', 43000),
    ->  (13, 'Dinesh', 'Admin', 46000),
    ->  (14, 'Rajesh', 'Finance', 51000),
    ->  (15, 'Kiran', 'IT', 48000);
Query OK, 15 rows affected (0.00 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql>
mysql> select*from emp;
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    1 | Rahul  | IT        |  50000 |
|    2 | Ramesh | HR        |  35000 |
|    3 | Karan  | Finance   |  45000 |
|    4 | Mahesh | Marketing |  40000 |
|    5 | Suresh | IT        |  55000 |
|    6 | Arjun  | Sales     |  38000 |
|    7 | Manish | Admin     |  42000 |
|    8 | Ganesh | Finance   |  47000 |
|    9 | Naresh | HR        |  39000 |
|   10 | Rohan  | IT        |  52000 |
|   11 | Mohan  | Sales     |  41000 |
|   12 | Kishan | Marketing |  43000 |
|   13 | Dinesh | Admin     |  46000 |
|   14 | Rajesh | Finance   |  51000 |
|   15 | Kiran  | IT        |  48000 |
+------+--------+-----------+--------+
15 rows in set (0.00 sec)

mysql> select * from emp where name like '-----h';
Empty set (0.00 sec)

mysql> SELECT * FROM emp WHERE name LIKE 'R%';
+------+--------+---------+--------+
| id   | name   | dept    | salary |
+------+--------+---------+--------+
|    1 | Rahul  | IT      |  50000 |
|    2 | Ramesh | HR      |  35000 |
|   10 | Rohan  | IT      |  52000 |
|   14 | Rajesh | Finance |  51000 |
+------+--------+---------+--------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM emp WHERE name LIKE '%h';
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    2 | Ramesh | HR        |  35000 |
|    4 | Mahesh | Marketing |  40000 |
|    5 | Suresh | IT        |  55000 |
|    7 | Manish | Admin     |  42000 |
|    8 | Ganesh | Finance   |  47000 |
|    9 | Naresh | HR        |  39000 |
|   13 | Dinesh | Admin     |  46000 |
|   14 | Rajesh | Finance   |  51000 |
+------+--------+-----------+--------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM emp WHERE name LIKE '%an%';
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    3 | Karan  | Finance   |  45000 |
|    7 | Manish | Admin     |  42000 |
|    8 | Ganesh | Finance   |  47000 |
|   10 | Rohan  | IT        |  52000 |
|   11 | Mohan  | Sales     |  41000 |
|   12 | Kishan | Marketing |  43000 |
|   15 | Kiran  | IT        |  48000 |
+------+--------+-----------+--------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM emp WHERE name LIKE '_a%';
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    1 | Rahul  | IT        |  50000 |
|    2 | Ramesh | HR        |  35000 |
|    3 | Karan  | Finance   |  45000 |
|    4 | Mahesh | Marketing |  40000 |
|    7 | Manish | Admin     |  42000 |
|    8 | Ganesh | Finance   |  47000 |
|    9 | Naresh | HR        |  39000 |
|   14 | Rajesh | Finance   |  51000 |
+------+--------+-----------+--------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM emp WHERE name LIKE '_____h';
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    2 | Ramesh | HR        |  35000 |
|    4 | Mahesh | Marketing |  40000 |
|    5 | Suresh | IT        |  55000 |
|    7 | Manish | Admin     |  42000 |
|    8 | Ganesh | Finance   |  47000 |
|    9 | Naresh | HR        |  39000 |
|   13 | Dinesh | Admin     |  46000 |
|   14 | Rajesh | Finance   |  51000 |
+------+--------+-----------+--------+
8 rows in set (0.00 sec)

mysql> UPDATE emp
    -> SET salary = salary + 2000
    -> WHERE name LIKE 'R%';
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> SELECT * FROM emp
    -> WHERE name LIKE 'R%';
+------+--------+---------+--------+
| id   | name   | dept    | salary |
+------+--------+---------+--------+
|    1 | Rahul  | IT      |  52000 |
|    2 | Ramesh | HR      |  37000 |
|   10 | Rohan  | IT      |  54000 |
|   14 | Rajesh | Finance |  53000 |
+------+--------+---------+--------+
4 rows in set (0.00 sec)

mysql> update emp
    -> set salary = salary + 3000
    -> where name like '%sh';
Query OK, 8 rows affected (0.01 sec)
Rows matched: 8  Changed: 8  Warnings: 0

mysql> select * from emp
    -> where name like '%sh';
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    2 | Ramesh | HR        |  40000 |
|    4 | Mahesh | Marketing |  43000 |
|    5 | Suresh | IT        |  58000 |
|    7 | Manish | Admin     |  45000 |
|    8 | Ganesh | Finance   |  50000 |
|    9 | Naresh | HR        |  42000 |
|   13 | Dinesh | Admin     |  49000 |
|   14 | Rajesh | Finance   |  56000 |
+------+--------+-----------+--------+
8 rows in set (0.00 sec)

mysql> update emp set salary = salary + 1000 where name like '%ar%';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from emp where name like '%ar%;
    '> ^C
mysql> select * from emp where name like '%ar%';
+------+--------+---------+--------+
| id   | name   | dept    | salary |
+------+--------+---------+--------+
|    3 | Karan  | Finance |  46000 |
|    6 | Arjun  | Sales   |  39000 |
|    9 | Naresh | HR      |  43000 |
+------+--------+---------+--------+
3 rows in set (0.00 sec)

mysql> update emp set salary = salary + 500 where name like '_____';
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from emp where name like '_____';
+------+-------+---------+--------+
| id   | name  | dept    | salary |
+------+-------+---------+--------+
|    1 | Rahul | IT      |  52500 |
|    3 | Karan | Finance |  46500 |
|    6 | Arjun | Sales   |  39500 |
|   10 | Rohan | IT      |  54500 |
|   11 | Mohan | Sales   |  41500 |
|   15 | Kiran | IT      |  48500 |
+------+-------+---------+--------+
6 rows in set (0.00 sec)

mysql> update emp set salary = salary + 500 where name like '_a%';
Query OK, 8 rows affected (0.00 sec)
Rows matched: 8  Changed: 8  Warnings: 0

mysql> select * from emp where name like '_a%';
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    1 | Rahul  | IT        |  53000 |
|    2 | Ramesh | HR        |  40500 |
|    3 | Karan  | Finance   |  47000 |
|    4 | Mahesh | Marketing |  43500 |
|    7 | Manish | Admin     |  45500 |
|    8 | Ganesh | Finance   |  50500 |
|    9 | Naresh | HR        |  43500 |
|   14 | Rajesh | Finance   |  56500 |
+------+--------+-----------+--------+
8 rows in set (0.00 sec)

mysql> update emp set salary = salary + 1000 where name like '_a%';
Query OK, 8 rows affected (0.01 sec)
Rows matched: 8  Changed: 8  Warnings: 0

mysql> select * from emp where name like '_a%';
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    1 | Rahul  | IT        |  54000 |
|    2 | Ramesh | HR        |  41500 |
|    3 | Karan  | Finance   |  48000 |
|    4 | Mahesh | Marketing |  44500 |
|    7 | Manish | Admin     |  46500 |
|    8 | Ganesh | Finance   |  51500 |
|    9 | Naresh | HR        |  44500 |
|   14 | Rajesh | Finance   |  57500 |
+------+--------+-----------+--------+
8 rows in set (0.00 sec)

mysql> select * from emp;
+------+--------+-----------+--------+
| id   | name   | dept      | salary |
+------+--------+-----------+--------+
|    1 | Rahul  | IT        |  54000 |
|    2 | Ramesh | HR        |  41500 |
|    3 | Karan  | Finance   |  48000 |
|    4 | Mahesh | Marketing |  44500 |
|    5 | Suresh | IT        |  58000 |
|    6 | Arjun  | Sales     |  39500 |
|    7 | Manish | Admin     |  46500 |
|    8 | Ganesh | Finance   |  51500 |
|    9 | Naresh | HR        |  44500 |
|   10 | Rohan  | IT        |  54500 |
|   11 | Mohan  | Sales     |  41500 |
|   12 | Kishan | Marketing |  43000 |
|   13 | Dinesh | Admin     |  49000 |
|   14 | Rajesh | Finance   |  57500 |
|   15 | Kiran  | IT        |  48500 |
+------+--------+-----------+--------+
15 rows in set (0.00 sec)

mysql> select min(salary) as minimun_salary from emp;
+----------------+
| minimun_salary |
+----------------+
|          39500 |
+----------------+
1 row in set (0.01 sec)

mysql> select max(salary) as maximum_salary from emp;
+----------------+
| maximum_salary |
+----------------+
|          58000 |
+----------------+
1 row in set (0.00 sec)

mysql> select sum(salary) as total_salary from emp;
+--------------+
| total_salary |
+--------------+
|       722000 |
+--------------+
1 row in set (0.00 sec)

mysql> select count(salary) as emp_count from emp;
+-----------+
| emp_count |
+-----------+
|        15 |
+-----------+
1 row in set (0.00 sec)

mysql> select avg(salary) as avg_salary from emp;
+------------+
| avg_salary |
+------------+
| 48133.3333 |
+------------+
1 row in set (0.00 sec)

mysql>





-------------------------------------------------------------------------------------------

aggregate functions:
==================

aggregate functions performs calculations on multiple rows and return a single column

there are various aggregrate functions . sunch as 

min(): -- returns a min value
max(); -- returns a max value 
count() -- counts the no.of rows 
avg() -- calculate the avg value 
sum () -- calculates the total value
--------------------------------------------------------------------------------------------
system information functions:
===========================
1. curdate() -- returns the current date 
2. curtime () -- return the current time
3.now() -- return the current  date and time
4. database() --  returns the current database name
5.user() -- returns the current logged in user
6.current_user() --  return the authenticated my sql account
7.version() -- returns the MySQL current version
8.sysdate() -- returns the system date and time
9.connection_id ()-- returns the current connection id
10.utc_date() -- {universal time date} returns the current utc date
11. utc_time () -- returns the current utc time 
12. utc_timestamp() -- returns the current utc date and time.


======================================================================================================
mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2026-07-02 |
+------------+
1 row in set (0.01 sec)

mysql> select curtime();
+-----------+
| curtime() |
+-----------+
| 10:37:58  |
+-----------+
1 row in set (0.00 sec)

mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2026-07-02 10:38:12 |
+---------------------+
1 row in set (0.01 sec)

mysql> select database();
+------------+
| database() |
+------------+
| da3        |
+------------+
1 row in set (0.00 sec)

mysql> select user();
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

mysql> select current_user();
+----------------+
| current_user() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.01 sec)

mysql> select version();
+-----------+
| version() |
+-----------+
| 8.0.46    |
+-----------+
1 row in set (0.01 sec)

mysql> select sysdate();
+---------------------+
| sysdate()           |
+---------------------+
| 2026-07-02 10:39:30 |
+---------------------+
1 row in set (0.00 sec)

mysql> select connection_id();
+-----------------+
| connection_id() |
+-----------------+
|               8 |
+-----------------+
1 row in set (0.01 sec)

mysql> select utc_date();
+------------+
| utc_date() |
+------------+
| 2026-07-02 |
+------------+
1 row in set (0.00 sec)

mysql> select utc_time();
+------------+
| utc_time() |
+------------+
| 05:10:28   |
+------------+
1 row in set (0.00 sec)

mysql> select utc_timestand();
ERROR 1305 (42000): FUNCTION da3.utc_timestand does not exist
mysql> select utc_timestamp();
+---------------------+
| utc_timestamp()     |
+---------------------+
| 2026-07-02 05:12:49 |
+---------------------+
1 row in set (0.00 sec)

mysql>




 mysql> Terminal close -- exit!
