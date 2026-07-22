mysql> use da3;
Database changed
mysql> create table products(
    -> id int,
    -> name varchar(100),
    -> price int ,
    -> quantity int);
Query OK, 0 rows affected (0.19 sec)

mysql> desc products;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int          | YES  |     | NULL    |       |
| name     | varchar(100) | YES  |     | NULL    |       |
| price    | int          | YES  |     | NULL    |       |
| quantity | int          | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
4 rows in set (0.07 sec)

mysql> insert products values (1,'pen',10,100), (2,'notebook',25.00,50),(3,'pencil',5.00,200),4,'eraser',3.00,300),(5,'market',15.00,80));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '4,'eraser',3.00,300),(5,'market',15.00,80))' at line 1
mysql> insert products values (1,'pen',10,100), (2,'notebook',25.00,50),(3,'pencil',5.00,200),(4,'eraser',3.00,300),(5,'market',15.00,80));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> insert products values (1,'pen',10,100), (2,'notebook',25.00,50),(3,'pencil',5.00,200),(4,'eraser',3.00,300),(5,'market',15.00,80);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from products;
+------+----------+-------+----------+
| id   | name     | price | quantity |
+------+----------+-------+----------+
|    1 | pen      |    10 |      100 |
|    2 | notebook |    25 |       50 |
|    3 | pencil   |     5 |      200 |
|    4 | eraser   |     3 |      300 |
|    5 | market   |    15 |       80 |
+------+----------+-------+----------+
5 rows in set (0.00 sec)

mysql> select name , price, price+(price * 0.12) as price_with_tax frpm products;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'frpm products' at line 1
mysql> select name , price, price+(price * 0.12) as price_with_tax from products;
+----------+-------+----------------+
| name     | price | price_with_tax |
+----------+-------+----------------+
| pen      |    10 |          11.20 |
| notebook |    25 |          28.00 |
| pencil   |     5 |           5.60 |
| eraser   |     3 |           3.36 |
| market   |    15 |          16.80 |
+----------+-------+----------------+
5 rows in set (0.00 sec)

mysql> select * from products;
+------+----------+-------+----------+
| id   | name     | price | quantity |
+------+----------+-------+----------+
|    1 | pen      |    10 |      100 |
|    2 | notebook |    25 |       50 |
|    3 | pencil   |     5 |      200 |
|    4 | eraser   |     3 |      300 |
|    5 | market   |    15 |       80 |
+------+----------+-------+----------+
5 rows in set (0.00 sec)

mysql> select name , price, price-5 as discount_price from products;
+----------+-------+----------------+
| name     | price | discount_price |
+----------+-------+----------------+
| pen      |    10 |              5 |
| notebook |    25 |             20 |
| pencil   |     5 |              0 |
| eraser   |     3 |             -2 |
| market   |    15 |             10 |
+----------+-------+----------------+
5 rows in set (0.00 sec)

mysql> select name , price, quantity , price * quantity as total_inventory_value from products;
+----------+-------+----------+-----------------------+
| name     | price | quantity | total_inventory_value |
+----------+-------+----------+-----------------------+
| pen      |    10 |      100 |                  1000 |
| notebook |    25 |       50 |                  1250 |
| pencil   |     5 |      200 |                  1000 |
| eraser   |     3 |      300 |                   900 |
| market   |    15 |       80 |                  1200 |
+----------+-------+----------+-----------------------+
5 rows in set (0.00 sec)

mysql> 
mysql> mysql> select name , price, quantity , price * quantity as price_for_10_units from products;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql> select name , price, quantity , price * quantity as price_for_10_units fr' at line 1
mysql>  select name , price, quantity , price * quantity as price_for_10_units from products;
+----------+-------+----------+--------------------+
| name     | price | quantity | price_for_10_units |
+----------+-------+----------+--------------------+
| pen      |    10 |      100 |               1000 |
| notebook |    25 |       50 |               1250 |
| pencil   |     5 |      200 |               1000 |
| eraser   |     3 |      300 |                900 |
| market   |    15 |       80 |               1200 |
+----------+-------+----------+--------------------+
5 rows in set (0.00 sec)

mysql> select * from products where quantity % 50 != 0;
+------+--------+-------+----------+
| id   | name   | price | quantity |
+------+--------+-------+----------+
|    5 | market |    15 |       80 |
+------+--------+-------+----------+
1 row in set (0.00 sec)

mysql> update products set price = price-5;
Query OK, 5 rows affected (0.01 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> update products set quantity= quantity * 2  where name = 'eraser';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from products;
+------+----------+-------+----------+
| id   | name     | price | quantity |
+------+----------+-------+----------+
|    1 | pen      |     5 |      100 |
|    2 | notebook |    20 |       50 |
|    3 | pencil   |     0 |      200 |
|    4 | eraser   |    -2 |      600 |
|    5 | market   |    10 |       80 |
+------+----------+-------+----------+
5 rows in set (0.00 sec)

mysql> update products set quantity= quantity/2  where name = 'marker';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> -- STEP 1: Create Table
mysql> CREATE TABLE StudentScores (
    ->  id INT,
    ->  name VARCHAR(100),
    ->  subject VARCHAR(50),
    ->  marks INT
    ->  );
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> -- STEP 2: Insert Records
mysql> INSERT INTO StudentScores VALUES
    ->  (1, 'Alice', 'Math', 95),
    ->  (2, 'Bob', 'Math', 76),
    ->  (3, 'Charlie', 'Math', 59),
    ->  (4, 'Diana', 'Math', 88),
    ->  (5, 'Eve', 'Math', 40),
    ->  (6, 'Frank', 'Math', 95),
    ->  (7, 'Grace', 'Science', 67),
    ->  (8, 'Henry', 'Science', 82),
    ->  (9, 'Ivy', 'English', 91),
    ->  (10, 'Jack', 'English', 55),
    ->  (11, 'Kevin', 'Math', 73),
    ->  (12, 'Lily', 'Science', 48),
    ->  (13, 'Mia', 'English', 100),
    ->  (14, 'Noah', 'Math', 64),
    ->  (15, 'Olivia', 'Science', 79);
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    95 |
|    2 | Bob     | Math    |    76 |
|    3 | Charlie | Math    |    59 |
|    4 | Diana   | Math    |    88 |
|    5 | Eve     | Math    |    40 |
|    6 | Frank   | Math    |    95 |
|    7 | Grace   | Science |    67 |
|    8 | Henry   | Science |    82 |
|    9 | Ivy     | English |    91 |
|   10 | Jack    | English |    55 |
|   11 | Kevin   | Math    |    73 |
|   12 | Lily    | Science |    48 |
|   13 | Mia     | English |   100 |
|   14 | Noah    | Math    |    64 |
|   15 | Olivia  | Science |    79 |
+------+---------+---------+-------+
15 rows in set (0.00 sec)

mysql> select * from studentscores where marks>80;
+------+-------+---------+-------+
| id   | name  | subject | marks |
+------+-------+---------+-------+
|    1 | Alice | Math    |    95 |
|    4 | Diana | Math    |    88 |
|    6 | Frank | Math    |    95 |
|    8 | Henry | Science |    82 |
|    9 | Ivy   | English |    91 |
|   13 | Mia   | English |   100 |
+------+-------+---------+-------+
6 rows in set (0.02 sec)

mysql> select * from studentscores where marks>60;
+------+--------+---------+-------+
| id   | name   | subject | marks |
+------+--------+---------+-------+
|    1 | Alice  | Math    |    95 |
|    2 | Bob    | Math    |    76 |
|    4 | Diana  | Math    |    88 |
|    6 | Frank  | Math    |    95 |
|    7 | Grace  | Science |    67 |
|    8 | Henry  | Science |    82 |
|    9 | Ivy    | English |    91 |
|   11 | Kevin  | Math    |    73 |
|   13 | Mia    | English |   100 |
|   14 | Noah   | Math    |    64 |
|   15 | Olivia | Science |    79 |
+------+--------+---------+-------+
11 rows in set (0.01 sec)

mysql> select * from studentscores where marks<50;
+------+------+---------+-------+
| id   | name | subject | marks |
+------+------+---------+-------+
|    5 | Eve  | Math    |    40 |
|   12 | Lily | Science |    48 |
+------+------+---------+-------+
2 rows in set (0.00 sec)

mysql> select * from studentscores where marks=95;
+------+-------+---------+-------+
| id   | name  | subject | marks |
+------+-------+---------+-------+
|    1 | Alice | Math    |    95 |
|    6 | Frank | Math    |    95 |
+------+-------+---------+-------+
2 rows in set (0.00 sec)

mysql> select * from studentscores where marks!=95;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    2 | Bob     | Math    |    76 |
|    3 | Charlie | Math    |    59 |
|    4 | Diana   | Math    |    88 |
|    5 | Eve     | Math    |    40 |
|    7 | Grace   | Science |    67 |
|    8 | Henry   | Science |    82 |
|    9 | Ivy     | English |    91 |
|   10 | Jack    | English |    55 |
|   11 | Kevin   | Math    |    73 |
|   12 | Lily    | Science |    48 |
|   13 | Mia     | English |   100 |
|   14 | Noah    | Math    |    64 |
|   15 | Olivia  | Science |    79 |
+------+---------+---------+-------+
13 rows in set (0.01 sec)

mysql> select * from studentscores where marks<60;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    3 | Charlie | Math    |    59 |
|    5 | Eve     | Math    |    40 |
|   10 | Jack    | English |    55 |
|   12 | Lily    | Science |    48 |
+------+---------+---------+-------+
4 rows in set (0.00 sec)

mysql> update studentscores set marks=marks+10 where marks <50;
Query OK, 2 rows affected (0.02 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    95 |
|    2 | Bob     | Math    |    76 |
|    3 | Charlie | Math    |    59 |
|    4 | Diana   | Math    |    88 |
|    5 | Eve     | Math    |    50 |
|    6 | Frank   | Math    |    95 |
|    7 | Grace   | Science |    67 |
|    8 | Henry   | Science |    82 |
|    9 | Ivy     | English |    91 |
|   10 | Jack    | English |    55 |
|   11 | Kevin   | Math    |    73 |
|   12 | Lily    | Science |    58 |
|   13 | Mia     | English |   100 |
|   14 | Noah    | Math    |    64 |
|   15 | Olivia  | Science |    79 |
+------+---------+---------+-------+
15 rows in set (0.00 sec)

mysql> update studentscores set marks=marks+5 where marks <60;
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    95 |
|    2 | Bob     | Math    |    76 |
|    3 | Charlie | Math    |    64 |
|    4 | Diana   | Math    |    88 |
|    5 | Eve     | Math    |    55 |
|    6 | Frank   | Math    |    95 |
|    7 | Grace   | Science |    67 |
|    8 | Henry   | Science |    82 |
|    9 | Ivy     | English |    91 |
|   10 | Jack    | English |    60 |
|   11 | Kevin   | Math    |    73 |
|   12 | Lily    | Science |    63 |
|   13 | Mia     | English |   100 |
|   14 | Noah    | Math    |    64 |
|   15 | Olivia  | Science |    79 |
+------+---------+---------+-------+
15 rows in set (0.00 sec)

mysql> update studentscores set marks=marks+2 where marks>90;
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    97 |
|    2 | Bob     | Math    |    76 |
|    3 | Charlie | Math    |    64 |
|    4 | Diana   | Math    |    88 |
|    5 | Eve     | Math    |    55 |
|    6 | Frank   | Math    |    97 |
|    7 | Grace   | Science |    67 |
|    8 | Henry   | Science |    82 |
|    9 | Ivy     | English |    93 |
|   10 | Jack    | English |    60 |
|   11 | Kevin   | Math    |    73 |
|   12 | Lily    | Science |    63 |
|   13 | Mia     | English |   102 |
|   14 | Noah    | Math    |    64 |
|   15 | Olivia  | Science |    79 |
+------+---------+---------+-------+
15 rows in set (0.01 sec)

mysql> update studentscores set marks=marks+3 where marks>80;
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |   100 |
|    2 | Bob     | Math    |    76 |
|    3 | Charlie | Math    |    64 |
|    4 | Diana   | Math    |    91 |
|    5 | Eve     | Math    |    55 |
|    6 | Frank   | Math    |   100 |
|    7 | Grace   | Science |    67 |
|    8 | Henry   | Science |    85 |
|    9 | Ivy     | English |    96 |
|   10 | Jack    | English |    60 |
|   11 | Kevin   | Math    |    73 |
|   12 | Lily    | Science |    63 |
|   13 | Mia     | English |   105 |
|   14 | Noah    | Math    |    64 |
|   15 | Olivia  | Science |    79 |
+------+---------+---------+-------+
15 rows in set (0.00 sec)

mysql> update studentscores set marks=marks-1 where marks!=95;
Query OK, 15 rows affected (0.01 sec)
Rows matched: 15  Changed: 15  Warnings: 0

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    99 |
|    2 | Bob     | Math    |    75 |
|    3 | Charlie | Math    |    63 |
|    4 | Diana   | Math    |    90 |
|    5 | Eve     | Math    |    54 |
|    6 | Frank   | Math    |    99 |
|    7 | Grace   | Science |    66 |
|    8 | Henry   | Science |    84 |
|    9 | Ivy     | English |    95 |
|   10 | Jack    | English |    59 |
|   11 | Kevin   | Math    |    72 |
|   12 | Lily    | Science |    62 |
|   13 | Mia     | English |   104 |
|   14 | Noah    | Math    |    63 |
|   15 | Olivia  | Science |    78 |
+------+---------+---------+-------+
15 rows in set (0.00 sec)

mysql> update studentscores set marks=100 where marks=95;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    99 |
|    2 | Bob     | Math    |    75 |
|    3 | Charlie | Math    |    63 |
|    4 | Diana   | Math    |    90 |
|    5 | Eve     | Math    |    54 |
|    6 | Frank   | Math    |    99 |
|    7 | Grace   | Science |    66 |
|    8 | Henry   | Science |    84 |
|    9 | Ivy     | English |   100 |
|   10 | Jack    | English |    59 |
|   11 | Kevin   | Math    |    72 |
|   12 | Lily    | Science |    62 |
|   13 | Mia     | English |   104 |
|   14 | Noah    | Math    |    63 |
|   15 | Olivia  | Science |    78 |
+------+---------+---------+-------+
15 rows in set (0.00 sec)

mysql> delete from studentscores where marks < 50;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    99 |
|    2 | Bob     | Math    |    75 |
|    3 | Charlie | Math    |    63 |
|    4 | Diana   | Math    |    90 |
|    5 | Eve     | Math    |    54 |
|    6 | Frank   | Math    |    99 |
|    7 | Grace   | Science |    66 |
|    8 | Henry   | Science |    84 |
|    9 | Ivy     | English |   100 |
|   10 | Jack    | English |    59 |
|   11 | Kevin   | Math    |    72 |
|   12 | Lily    | Science |    62 |
|   13 | Mia     | English |   104 |
|   14 | Noah    | Math    |    63 |
|   15 | Olivia  | Science |    78 |
+------+---------+---------+-------+
15 rows in set (0.00 sec)

mysql> delete from studentscores where marks < 60;
Query OK, 2 rows affected (0.01 sec)

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    1 | Alice   | Math    |    99 |
|    2 | Bob     | Math    |    75 |
|    3 | Charlie | Math    |    63 |
|    4 | Diana   | Math    |    90 |
|    6 | Frank   | Math    |    99 |
|    7 | Grace   | Science |    66 |
|    8 | Henry   | Science |    84 |
|    9 | Ivy     | English |   100 |
|   11 | Kevin   | Math    |    72 |
|   12 | Lily    | Science |    62 |
|   13 | Mia     | English |   104 |
|   14 | Noah    | Math    |    63 |
|   15 | Olivia  | Science |    78 |
+------+---------+---------+-------+
13 rows in set (0.00 sec)

mysql> delete from studentscores where marks > 90;
Query OK, 4 rows affected (0.01 sec)

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    2 | Bob     | Math    |    75 |
|    3 | Charlie | Math    |    63 |
|    4 | Diana   | Math    |    90 |
|    7 | Grace   | Science |    66 |
|    8 | Henry   | Science |    84 |
|   11 | Kevin   | Math    |    72 |
|   12 | Lily    | Science |    62 |
|   14 | Noah    | Math    |    63 |
|   15 | Olivia  | Science |    78 |
+------+---------+---------+-------+
9 rows in set (0.00 sec)

mysql> delete from studentscores where marks > 80;
Query OK, 2 rows affected (0.01 sec)

mysql> select * from studentscores;
+------+---------+---------+-------+
| id   | name    | subject | marks |
+------+---------+---------+-------+
|    2 | Bob     | Math    |    75 |
|    3 | Charlie | Math    |    63 |
|    7 | Grace   | Science |    66 |
|   11 | Kevin   | Math    |    72 |
|   12 | Lily    | Science |    62 |
|   14 | Noah    | Math    |    63 |
|   15 | Olivia  | Science |    78 |
+------+---------+---------+-------+
7 rows in set (0.00 sec)

mysql> delete from studentscores where marks != 95;
Query OK, 7 rows affected (0.01 sec)

mysql> select * from studentscores;
Empty set (0.00 sec)

mysql> delete from studentscores where marks =76;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from studentscores;
Empty set (0.00 sec)

mysql> 
mysql> CREATE TABLE Employees (
    ->  id INT,
    ->  name VARCHAR(100),
    ->  department VARCHAR(100),
    ->  salary INT,
    ->  isactive BOOLEAN
    ->  );
ERROR 1050 (42S01): Table 'employees' already exists
mysql> 
mysql>  -- STEP 2: Insert Records
mysql> INSERT INTO Employees VALUES
    ->  (1, 'Rahul Sharma', 'IT', 50000, TRUE),
    ->  (2, 'Priya Reddy', 'HR', 30000, TRUE),
    ->  (3, 'Amit Kumar', 'Finance', 45000, FALSE),
    ->  (4, 'Sneha Patel', 'IT', 35000, TRUE),
    ->  (5, 'Vikram Singh', 'Finance', 28000, TRUE),
    ->  (6, 'Anjali Mehta', 'HR', 32000, FALSE),
    ->  (7, 'Kiran Rao', 'IT', 60000, TRUE),
    ->  (8, 'Pooja Verma', 'Marketing', 27000, TRUE),
    ->  (9, 'Ramesh Naidu', 'Sales', 38000, TRUE),
    ->  (10, 'Deepika Joshi', 'Finance', 52000, TRUE),
    ->  (11, 'Suresh Babu', 'Marketing', 29000, FALSE),
    ->  (12, 'Neha Kapoor', 'HR', 41000, TRUE),
    ->  (13, 'Arjun Reddy', 'IT', 55000, FALSE),
    ->  (14, 'Lakshmi Devi', 'Sales', 33000, TRUE),
    ->  (15, 'Nikhil Jain', 'IT', 47000, TRUE);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> drop table employees;
Query OK, 0 rows affected (0.07 sec)

mysql> 
mysql> CREATE TABLE Employees (
    ->  id INT,
    ->  name VARCHAR(100),
    ->  department VARCHAR(100),
    ->  salary INT,
    ->  isactive BOOLEAN
    ->  );
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql>  -- STEP 2: Insert Records
mysql> INSERT INTO Employees VALUES
    ->  (1, 'Rahul Sharma', 'IT', 50000, TRUE),
    ->  (2, 'Priya Reddy', 'HR', 30000, TRUE),
    ->  (3, 'Amit Kumar', 'Finance', 45000, FALSE),
    ->  (4, 'Sneha Patel', 'IT', 35000, TRUE),
    ->  (5, 'Vikram Singh', 'Finance', 28000, TRUE),
    ->  (6, 'Anjali Mehta', 'HR', 32000, FALSE),
    ->  (7, 'Kiran Rao', 'IT', 60000, TRUE),
    ->  (8, 'Pooja Verma', 'Marketing', 27000, TRUE),
    ->  (9, 'Ramesh Naidu', 'Sales', 38000, TRUE),
    ->  (10, 'Deepika Joshi', 'Finance', 52000, TRUE),
    ->  (11, 'Suresh Babu', 'Marketing', 29000, FALSE),
    ->  (12, 'Neha Kapoor', 'HR', 41000, TRUE),
    ->  (13, 'Arjun Reddy', 'IT', 55000, FALSE),
    ->  (14, 'Lakshmi Devi', 'Sales', 33000, TRUE),
    ->  (15, 'Nikhil Jain', 'IT', 47000, TRUE);
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select * from employees;
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  50000 |        1 |
|    2 | Priya Reddy   | HR         |  30000 |        1 |
|    3 | Amit Kumar    | Finance    |  45000 |        0 |
|    4 | Sneha Patel   | IT         |  35000 |        1 |
|    5 | Vikram Singh  | Finance    |  28000 |        1 |
|    6 | Anjali Mehta  | HR         |  32000 |        0 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    8 | Pooja Verma   | Marketing  |  27000 |        1 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        1 |
|   10 | Deepika Joshi | Finance    |  52000 |        1 |
|   11 | Suresh Babu   | Marketing  |  29000 |        0 |
|   12 | Neha Kapoor   | HR         |  41000 |        1 |
|   13 | Arjun Reddy   | IT         |  55000 |        0 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        1 |
|   15 | Nikhil Jain   | IT         |  47000 |        1 |
+------+---------------+------------+--------+----------+
15 rows in set (0.00 sec)

mysql> --display it department employees whose salary is greater than 40000
    -> select * from employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--display it department employees whose salary is greater than 40000
select * fr' at line 1
mysql> select * from employees;
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  50000 |        1 |
|    2 | Priya Reddy   | HR         |  30000 |        1 |
|    3 | Amit Kumar    | Finance    |  45000 |        0 |
|    4 | Sneha Patel   | IT         |  35000 |        1 |
|    5 | Vikram Singh  | Finance    |  28000 |        1 |
|    6 | Anjali Mehta  | HR         |  32000 |        0 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    8 | Pooja Verma   | Marketing  |  27000 |        1 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        1 |
|   10 | Deepika Joshi | Finance    |  52000 |        1 |
|   11 | Suresh Babu   | Marketing  |  29000 |        0 |
|   12 | Neha Kapoor   | HR         |  41000 |        1 |
|   13 | Arjun Reddy   | IT         |  55000 |        0 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        1 |
|   15 | Nikhil Jain   | IT         |  47000 |        1 |
+------+---------------+------------+--------+----------+
15 rows in set (0.00 sec)

mysql> select * from employees where department = 'it' and salary > 40000;
+------+--------------+------------+--------+----------+
| id   | name         | department | salary | isactive |
+------+--------------+------------+--------+----------+
|    1 | Rahul Sharma | IT         |  50000 |        1 |
|    7 | Kiran Rao    | IT         |  60000 |        1 |
|   13 | Arjun Reddy  | IT         |  55000 |        0 |
|   15 | Nikhil Jain  | IT         |  47000 |        1 |
+------+--------------+------------+--------+----------+
4 rows in set (0.03 sec)

mysql> select * from employees where department = 'hr' or salary < 35000;
+------+--------------+------------+--------+----------+
| id   | name         | department | salary | isactive |
+------+--------------+------------+--------+----------+
|    2 | Priya Reddy  | HR         |  30000 |        1 |
|    5 | Vikram Singh | Finance    |  28000 |        1 |
|    6 | Anjali Mehta | HR         |  32000 |        0 |
|    8 | Pooja Verma  | Marketing  |  27000 |        1 |
|   11 | Suresh Babu  | Marketing  |  29000 |        0 |
|   12 | Neha Kapoor  | HR         |  41000 |        1 |
|   14 | Lakshmi Devi | Sales      |  33000 |        1 |
+------+--------------+------------+--------+----------+
7 rows in set (0.00 sec)

mysql> select * from employees where department != 'hr';
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  50000 |        1 |
|    3 | Amit Kumar    | Finance    |  45000 |        0 |
|    4 | Sneha Patel   | IT         |  35000 |        1 |
|    5 | Vikram Singh  | Finance    |  28000 |        1 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    8 | Pooja Verma   | Marketing  |  27000 |        1 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        1 |
|   10 | Deepika Joshi | Finance    |  52000 |        1 |
|   11 | Suresh Babu   | Marketing  |  29000 |        0 |
|   13 | Arjun Reddy   | IT         |  55000 |        0 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        1 |
|   15 | Nikhil Jain   | IT         |  47000 |        1 |
+------+---------------+------------+--------+----------+
12 rows in set (0.01 sec)

mysql> select * from employees where department = 'finance' or salary > 30000 and isactive = 1;
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  50000 |        1 |
|    3 | Amit Kumar    | Finance    |  45000 |        0 |
|    4 | Sneha Patel   | IT         |  35000 |        1 |
|    5 | Vikram Singh  | Finance    |  28000 |        1 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        1 |
|   10 | Deepika Joshi | Finance    |  52000 |        1 |
|   12 | Neha Kapoor   | HR         |  41000 |        1 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        1 |
|   15 | Nikhil Jain   | IT         |  47000 |        1 |
+------+---------------+------------+--------+----------+
10 rows in set (0.00 sec)

mysql> update table employees set salary = salary+2000 where isactive = true and department ='it' and salary <60000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table employees set salary = salary+2000 where isactive = true and department ='' at line 1
mysql> update employees set salary = salary+2000 where isactive = true and department ='it' and salary <60000;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from employees;
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  52000 |        1 |
|    2 | Priya Reddy   | HR         |  30000 |        1 |
|    3 | Amit Kumar    | Finance    |  45000 |        0 |
|    4 | Sneha Patel   | IT         |  37000 |        1 |
|    5 | Vikram Singh  | Finance    |  28000 |        1 |
|    6 | Anjali Mehta  | HR         |  32000 |        0 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    8 | Pooja Verma   | Marketing  |  27000 |        1 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        1 |
|   10 | Deepika Joshi | Finance    |  52000 |        1 |
|   11 | Suresh Babu   | Marketing  |  29000 |        0 |
|   12 | Neha Kapoor   | HR         |  41000 |        1 |
|   13 | Arjun Reddy   | IT         |  55000 |        0 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        1 |
|   15 | Nikhil Jain   | IT         |  49000 |        1 |
+------+---------------+------------+--------+----------+
15 rows in set (0.00 sec)

mysql> select * from employees where department = 'it';
+------+--------------+------------+--------+----------+
| id   | name         | department | salary | isactive |
+------+--------------+------------+--------+----------+
|    1 | Rahul Sharma | IT         |  52000 |        1 |
|    4 | Sneha Patel  | IT         |  37000 |        1 |
|    7 | Kiran Rao    | IT         |  60000 |        1 |
|   13 | Arjun Reddy  | IT         |  55000 |        0 |
|   15 | Nikhil Jain  | IT         |  49000 |        1 |
+------+--------------+------------+--------+----------+
5 rows in set (0.00 sec)

mysql> update employees set salary = salary - salary *0.10 where department = 'finance' or isactive = false;
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from employees;
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  52000 |        1 |
|    2 | Priya Reddy   | HR         |  30000 |        1 |
|    3 | Amit Kumar    | Finance    |  40500 |        0 |
|    4 | Sneha Patel   | IT         |  37000 |        1 |
|    5 | Vikram Singh  | Finance    |  25200 |        1 |
|    6 | Anjali Mehta  | HR         |  28800 |        0 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    8 | Pooja Verma   | Marketing  |  27000 |        1 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        1 |
|   10 | Deepika Joshi | Finance    |  46800 |        1 |
|   11 | Suresh Babu   | Marketing  |  26100 |        0 |
|   12 | Neha Kapoor   | HR         |  41000 |        1 |
|   13 | Arjun Reddy   | IT         |  49500 |        0 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        1 |
|   15 | Nikhil Jain   | IT         |  49000 |        1 |
+------+---------------+------------+--------+----------+
15 rows in set (0.00 sec)

mysql> update employees set isactive = false  where department != 'it';
Query OK, 7 rows affected (0.01 sec)
Rows matched: 10  Changed: 7  Warnings: 0

mysql> select * from employees;
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  52000 |        1 |
|    2 | Priya Reddy   | HR         |  30000 |        0 |
|    3 | Amit Kumar    | Finance    |  40500 |        0 |
|    4 | Sneha Patel   | IT         |  37000 |        1 |
|    5 | Vikram Singh  | Finance    |  25200 |        0 |
|    6 | Anjali Mehta  | HR         |  28800 |        0 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    8 | Pooja Verma   | Marketing  |  27000 |        0 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        0 |
|   10 | Deepika Joshi | Finance    |  46800 |        0 |
|   11 | Suresh Babu   | Marketing  |  26100 |        0 |
|   12 | Neha Kapoor   | HR         |  41000 |        0 |
|   13 | Arjun Reddy   | IT         |  49500 |        0 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        0 |
|   15 | Nikhil Jain   | IT         |  49000 |        1 |
+------+---------------+------------+--------+----------+
15 rows in set (0.00 sec)

mysql> delete from employees where department = 'hr'; 
Query OK, 3 rows affected (0.01 sec)

mysql> select * from employees;
+------+---------------+------------+--------+----------+
| id   | name          | department | salary | isactive |
+------+---------------+------------+--------+----------+
|    1 | Rahul Sharma  | IT         |  52000 |        1 |
|    3 | Amit Kumar    | Finance    |  40500 |        0 |
|    4 | Sneha Patel   | IT         |  37000 |        1 |
|    5 | Vikram Singh  | Finance    |  25200 |        0 |
|    7 | Kiran Rao     | IT         |  60000 |        1 |
|    8 | Pooja Verma   | Marketing  |  27000 |        0 |
|    9 | Ramesh Naidu  | Sales      |  38000 |        0 |
|   10 | Deepika Joshi | Finance    |  46800 |        0 |
|   11 | Suresh Babu   | Marketing  |  26100 |        0 |
|   13 | Arjun Reddy   | IT         |  49500 |        0 |
|   14 | Lakshmi Devi  | Sales      |  33000 |        0 |
|   15 | Nikhil Jain   | IT         |  49000 |        1 |
+------+---------------+------------+--------+----------+
12 rows in set (0.00 sec)

mysql> delete from employees where department = 'finance' or salary < 35000;
Query OK, 6 rows affected (0.01 sec)

mysql> select * from employees;
+------+--------------+------------+--------+----------+
| id   | name         | department | salary | isactive |
+------+--------------+------------+--------+----------+
|    1 | Rahul Sharma | IT         |  52000 |        1 |
|    4 | Sneha Patel  | IT         |  37000 |        1 |
|    7 | Kiran Rao    | IT         |  60000 |        1 |
|    9 | Ramesh Naidu | Sales      |  38000 |        0 |
|   13 | Arjun Reddy  | IT         |  49500 |        0 |
|   15 | Nikhil Jain  | IT         |  49000 |        1 |
+------+--------------+------------+--------+----------+
6 rows in set (0.00 sec)

mysql> delete from employees where department != 'it'; 
Query OK, 1 row affected (0.01 sec)

mysql> select * from employees;
+------+--------------+------------+--------+----------+
| id   | name         | department | salary | isactive |
+------+--------------+------------+--------+----------+
|    1 | Rahul Sharma | IT         |  52000 |        1 |
|    4 | Sneha Patel  | IT         |  37000 |        1 |
|    7 | Kiran Rao    | IT         |  60000 |        1 |
|   13 | Arjun Reddy  | IT         |  49500 |        0 |
|   15 | Nikhil Jain  | IT         |  49000 |        1 |
+------+--------------+------------+--------+----------+
5 rows in set (0.00 sec)

mysql> insert into employees(id,name,salary,isactive) values (16,'malli',60000,false);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employees;
+------+--------------+------------+--------+----------+
| id   | name         | department | salary | isactive |
+------+--------------+------------+--------+----------+
|    1 | Rahul Sharma | IT         |  52000 |        1 |
|    4 | Sneha Patel  | IT         |  37000 |        1 |
|    7 | Kiran Rao    | IT         |  60000 |        1 |
|   13 | Arjun Reddy  | IT         |  49500 |        0 |
|   15 | Nikhil Jain  | IT         |  49000 |        1 |
|   16 | malli        | NULL       |  60000 |        0 |
+------+--------------+------------+--------+----------+
6 rows in set (0.00 sec)

mysql> select * from employees where department = null;
Empty set (0.00 sec)

mysql> select * from employees where department =isnull;
ERROR 1054 (42S22): Unknown column 'isnull' in 'where clause'
mysql> select * from employees where department is null;
+------+-------+------------+--------+----------+
| id   | name  | department | salary | isactive |
+------+-------+------------+--------+----------+
|   16 | malli | NULL       |  60000 |        0 |
+------+-------+------------+--------+----------+
1 row in set (0.00 sec)

mysql> select * from employees where department is not null;
+------+--------------+------------+--------+----------+
| id   | name         | department | salary | isactive |
+------+--------------+------------+--------+----------+
|    1 | Rahul Sharma | IT         |  52000 |        1 |
|    4 | Sneha Patel  | IT         |  37000 |        1 |
|    7 | Kiran Rao    | IT         |  60000 |        1 |
|   13 | Arjun Reddy  | IT         |  49500 |        0 |
|   15 | Nikhil Jain  | IT         |  49000 |        1 |
+------+--------------+------------+--------+----------+
5 rows in set (0.00 sec)

mysql> Terminal close -- exit!
