clauses in MySQL:
================
in MySQL clauses are used to control how data is selected , filtered , grouped, sorted ir modified in sql queries. they make sql statments are more meaningful and powerful
think of clauses like instructions given to a database .

where clause:
=============
filter records based on specified conditions the where clause can b e use comparison operator logical operator and etc operators.

syntax:
=======
select c1,c2.....
from table
where condition.

group by clause:
==============
the group by clause is used to group rows having the same values in one or more columns, It is commonly used with aggregate functions such as 
sum(),max(),min(), count(), avg().

syntax:
======
select column-name ,aggregate_func(column-name)
from table -name 
group by column - name 

having clause:
============
the having clause is used to filter grouped records after group by clause .It is similar to where but it works on grouped instead of individual rows.

syntax:
=======
select column-name ,
aggregate_func(column-name)
from table-name
group by column-name
having condition.

order of clause:
==============
the order of clause is used to sortr the result sewt in ascending (ASC) or desending(DSC) order.
asc  -- ascending order by defeault 
desc --- descending order 

syntax:
========
select column-name 
from table-name
order by column-name asc;



















mysql> use da3
Database changed
mysql> CREATE TABLE STUDENTS (
    ->     StudentID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Name VARCHAR(50),
    ->     Age INT,
    ->     Department VARCHAR(30),
    ->     Marks INT,
    ->     City VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.20 sec)

mysql> 
mysql>  Insert Sample Data (without StudentID)
    -> INSERT INTO STUDENTS (Name, Age, Department, Marks, City) VALUES
    -> ('Anil', 20, 'CSE', 85, 'Hyderabad'),
    -> ('Sneha', 22, 'ECE', 75, 'Mumbai'),
    -> ('Ravi', 20, 'CSE', NULL, 'Hyderabad'),
    -> ('Divya', 23, 'MECH', 65, NULL),
    -> ('Kiran', 22, 'ECE', 75, 'Pune'),
    -> ('Varun', 21, 'CSE', 92, 'Chennai'),
    -> ('Priya', 20, 'EEE', 88, 'Delhi'),
    -> ('John', 22, 'MECH', 55, 'Mumbai'),
    -> ('Rekha', 21, 'ECE', 75, 'Pune'),
    -> ('Ramesh', 23, 'EEE', NULL, 'Delhi');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Data (without StudentID)
INSERT INTO STUDENTS (Name, Age, Department, Marks, Cit' at line 1
mysql> INSERT INTO STUDENTS (Name, Age, Department, Marks, City) VALUES
    -> ('Anil', 20, 'CSE', 85, 'Hyderabad'),
    -> ('Sneha', 22, 'ECE', 75, 'Mumbai'),
    -> ('Ravi', 20, 'CSE', NULL, 'Hyderabad'),
    -> ('Divya', 23, 'MECH', 65, NULL),
    -> ('Kiran', 22, 'ECE', 75, 'Pune'),
    -> ('Varun', 21, 'CSE', 92, 'Chennai'),
    -> ('Priya', 20, 'EEE', 88, 'Delhi'),
    -> ('John', 22, 'MECH', 55, 'Mumbai'),
    -> ('Rekha', 21, 'ECE', 75, 'Pune'),
    -> ('Ramesh', 23, 'EEE', NULL, 'Delhi');
Query OK, 10 rows affected (0.06 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from students;
+-----------+--------+------+------------+-------+-----------+
| StudentID | Name   | Age  | Department | Marks | City      |
+-----------+--------+------+------------+-------+-----------+
|         1 | Anil   |   20 | CSE        |    85 | Hyderabad |
|         2 | Sneha  |   22 | ECE        |    75 | Mumbai    |
|         3 | Ravi   |   20 | CSE        |  NULL | Hyderabad |
|         4 | Divya  |   23 | MECH       |    65 | NULL      |
|         5 | Kiran  |   22 | ECE        |    75 | Pune      |
|         6 | Varun  |   21 | CSE        |    92 | Chennai   |
|         7 | Priya  |   20 | EEE        |    88 | Delhi     |
|         8 | John   |   22 | MECH       |    55 | Mumbai    |
|         9 | Rekha  |   21 | ECE        |    75 | Pune      |
|        10 | Ramesh |   23 | EEE        |  NULL | Delhi     |
+-----------+--------+------+------------+-------+-----------+
10 rows in set (0.01 sec)

mysql> --1. display all students who belongs to the cse department ?
    -> --1. display all students whose marks grater than 80 ?
    -> --1. display all students whose are 22 years old?
    -> --1. display all students who belogs to mumbai?
    -> --1. display all students whose marks getting 70 anmd 90?
    -> ^C
mysql> select * from students where department = 'cse';
+-----------+-------+------+------------+-------+-----------+
| StudentID | Name  | Age  | Department | Marks | City      |
+-----------+-------+------+------------+-------+-----------+
|         1 | Anil  |   20 | CSE        |    85 | Hyderabad |
|         3 | Ravi  |   20 | CSE        |  NULL | Hyderabad |
|         6 | Varun |   21 | CSE        |    92 | Chennai   |
+-----------+-------+------+------------+-------+-----------+
3 rows in set (0.01 sec)

mysql> select * from students where marks > 80;
+-----------+-------+------+------------+-------+-----------+
| StudentID | Name  | Age  | Department | Marks | City      |
+-----------+-------+------+------------+-------+-----------+
|         1 | Anil  |   20 | CSE        |    85 | Hyderabad |
|         6 | Varun |   21 | CSE        |    92 | Chennai   |
|         7 | Priya |   20 | EEE        |    88 | Delhi     |
+-----------+-------+------+------------+-------+-----------+
3 rows in set (0.01 sec)

mysql> select * from students where age = 22;
+-----------+-------+------+------------+-------+--------+
| StudentID | Name  | Age  | Department | Marks | City   |
+-----------+-------+------+------------+-------+--------+
|         2 | Sneha |   22 | ECE        |    75 | Mumbai |
|         5 | Kiran |   22 | ECE        |    75 | Pune   |
|         8 | John  |   22 | MECH       |    55 | Mumbai |
+-----------+-------+------+------------+-------+--------+
3 rows in set (0.00 sec)

mysql> select * from students where city = mumbai;
ERROR 1054 (42S22): Unknown column 'mumbai' in 'where clause'
mysql> select * from students where city = 'mumbai';
+-----------+-------+------+------------+-------+--------+
| StudentID | Name  | Age  | Department | Marks | City   |
+-----------+-------+------+------------+-------+--------+
|         2 | Sneha |   22 | ECE        |    75 | Mumbai |
|         8 | John  |   22 | MECH       |    55 | Mumbai |
+-----------+-------+------+------------+-------+--------+
2 rows in set (0.00 sec)

mysql> select * from students where marks between 70 and 90;
+-----------+-------+------+------------+-------+-----------+
| StudentID | Name  | Age  | Department | Marks | City      |
+-----------+-------+------+------------+-------+-----------+
|         1 | Anil  |   20 | CSE        |    85 | Hyderabad |
|         2 | Sneha |   22 | ECE        |    75 | Mumbai    |
|         5 | Kiran |   22 | ECE        |    75 | Pune      |
|         7 | Priya |   20 | EEE        |    88 | Delhi     |
|         9 | Rekha |   21 | ECE        |    75 | Pune      |
+-----------+-------+------+------------+-------+-----------+
5 rows in set (0.00 sec)

mysql> -- display the total number of students in each department?
mysql> select department,count(*) as total_count
    -> from student
    -> group by department;
ERROR 1146 (42S02): Table 'da3.student' doesn't exist
mysql> select department,count(*) as total_count
    -> from students
    -> group by department;
+------------+-------------+
| department | total_count |
+------------+-------------+
| CSE        |           3 |
| ECE        |           3 |
| MECH       |           2 |
| EEE        |           2 |
+------------+-------------+
4 rows in set (0.01 sec)

mysql> --display the average marks of the students in each department?
    -> select department , avg(marks) as avg_marks
    -> from students 
    -> group by department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--display the average marks of the students in each department?
select departmen' at line 1
mysql> select department,avg(marks) as avg_marks
    -> from students 
    -> group by department;
+------------+-----------+
| department | avg_marks |
+------------+-----------+
| CSE        |   88.5000 |
| ECE        |   75.0000 |
| MECH       |   60.0000 |
| EEE        |   88.0000 |
+------------+-----------+
4 rows in set (0.01 sec)

mysql> --display the highest marks scored in each department?
    -> -- display the lowest marks scored in each department .
    -> --display the total marks obtained in each department ?
    -> ^C
mysql> select department,max(marks) as max_marks
    -> frpm students
    -> group by department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'frpm students
group by department' at line 2
mysql> select department,max(marks) as max_marks
    -> from students
    -> group by department;
+------------+-----------+
| department | max_marks |
+------------+-----------+
| CSE        |        92 |
| ECE        |        75 |
| MECH       |        65 |
| EEE        |        88 |
+------------+-----------+
4 rows in set (0.00 sec)

mysql> select department,min(marks) as min_marks
    -> from students
    -> group by department;
+------------+-----------+
| department | min_marks |
+------------+-----------+
| CSE        |        85 |
| ECE        |        75 |
| MECH       |        55 |
| EEE        |        88 |
+------------+-----------+
4 rows in set (0.00 sec)

mysql> select department,total(marks) as total_marks
    -> from students
    -> group by department;
ERROR 1305 (42000): FUNCTION da3.total does not exist
mysql> select department,sum(marks) as total_marks
    -> from students
    -> group by department;
+------------+-------------+
| department | total_marks |
+------------+-------------+
| CSE        |         177 |
| ECE        |         225 |
| MECH       |         120 |
| EEE        |          88 |
+------------+-------------+
4 rows in set (0.00 sec)

mysql> --having clause 
    -> --1. display departments having more than 2 students ?
    -> ^C
mysql> select department, count(*) as total_students
    -> from students
    -> group by department
    -> having total_students > 2;
+------------+----------------+
| department | total_students |
+------------+----------------+
| CSE        |              3 |
| ECE        |              3 |
+------------+----------------+
2 rows in set (0.01 sec)

mysql> select department,avg(marks) as avg_marks
    -> from students
    -> group by department
    -> having avg_marks > 75;
+------------+-----------+
| department | avg_marks |
+------------+-----------+
| CSE        |   88.5000 |
| EEE        |   88.0000 |
+------------+-----------+
2 rows in set (0.00 sec)

mysql> --display cities having more than one students?
    -> -- display departments whose total marks > 150 ?
    -> --display age grouped having more than 2 students?
    -> --display cities whose avg maeks are > 70?
    -> ^C
mysql> select department count(*) as total_students
    -> from students
    -> group by department
    -> having total_students > 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'count(*) as total_students
from students
group by department
having total_studen' at line 1
mysql> select department count(*) as total_stud
    -> from students
    -> group by department
    -> having total_stud > 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'count(*) as total_stud
from students
group by department
having total_stud > 1' at line 1
mysql> select department, count(*) as total_stud
    -> from students
    -> group by department
    -> having total_stud > 1;
+------------+------------+
| department | total_stud |
+------------+------------+
| CSE        |          3 |
| ECE        |          3 |
| MECH       |          2 |
| EEE        |          2 |
+------------+------------+
4 rows in set (0.00 sec)

mysql> select department, sum(marks) as total_marks
    -> from students
    -> group by department
    -> having total_marks > 150;
+------------+-------------+
| department | total_marks |
+------------+-------------+
| CSE        |         177 |
| ECE        |         225 |
+------------+-------------+
2 rows in set (0.00 sec)

mysql> select age , count(*) as total_age
    -> from students
    -> group by age
    -> having total_age > 2;
+------+-----------+
| age  | total_age |
+------+-----------+
|   20 |         3 |
|   22 |         3 |
+------+-----------+
2 rows in set (0.00 sec)

mysql> select department,avg(marks) as avg_marks
    ->     -> from students
    ->     -> group by department
    ->     -> having  > 70;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> from students
    -> group by department
    -> having  > 70' at line 2
mysql> select city,avg(marks) as avg_marks
    -> from students
    -> group by city
    -> having  avg_marks > 70;
+-----------+-----------+
| city      | avg_marks |
+-----------+-----------+
| Hyderabad |   85.0000 |
| Pune      |   75.0000 |
| Chennai   |   92.0000 |
| Delhi     |   88.0000 |
+-----------+-----------+
4 rows in set (0.00 sec)

mysql> select * from students order by name;
+-----------+--------+------+------------+-------+-----------+
| StudentID | Name   | Age  | Department | Marks | City      |
+-----------+--------+------+------------+-------+-----------+
|         1 | Anil   |   20 | CSE        |    85 | Hyderabad |
|         4 | Divya  |   23 | MECH       |    65 | NULL      |
|         8 | John   |   22 | MECH       |    55 | Mumbai    |
|         5 | Kiran  |   22 | ECE        |    75 | Pune      |
|         7 | Priya  |   20 | EEE        |    88 | Delhi     |
|        10 | Ramesh |   23 | EEE        |  NULL | Delhi     |
|         3 | Ravi   |   20 | CSE        |  NULL | Hyderabad |
|         9 | Rekha  |   21 | ECE        |    75 | Pune      |
|         2 | Sneha  |   22 | ECE        |    75 | Mumbai    |
|         6 | Varun  |   21 | CSE        |    92 | Chennai   |
+-----------+--------+------+------------+-------+-----------+
10 rows in set (0.01 sec)

mysql> select * from students order by name asc;
+-----------+--------+------+------------+-------+-----------+
| StudentID | Name   | Age  | Department | Marks | City      |
+-----------+--------+------+------------+-------+-----------+
|         1 | Anil   |   20 | CSE        |    85 | Hyderabad |
|         4 | Divya  |   23 | MECH       |    65 | NULL      |
|         8 | John   |   22 | MECH       |    55 | Mumbai    |
|         5 | Kiran  |   22 | ECE        |    75 | Pune      |
|         7 | Priya  |   20 | EEE        |    88 | Delhi     |
|        10 | Ramesh |   23 | EEE        |  NULL | Delhi     |
|         3 | Ravi   |   20 | CSE        |  NULL | Hyderabad |
|         9 | Rekha  |   21 | ECE        |    75 | Pune      |
|         2 | Sneha  |   22 | ECE        |    75 | Mumbai    |
|         6 | Varun  |   21 | CSE        |    92 | Chennai   |
+-----------+--------+------+------------+-------+-----------+
10 rows in set (0.00 sec)

mysql> select * from students order by name desc;
+-----------+--------+------+------------+-------+-----------+
| StudentID | Name   | Age  | Department | Marks | City      |
+-----------+--------+------+------------+-------+-----------+
|         6 | Varun  |   21 | CSE        |    92 | Chennai   |
|         2 | Sneha  |   22 | ECE        |    75 | Mumbai    |
|         9 | Rekha  |   21 | ECE        |    75 | Pune      |
|         3 | Ravi   |   20 | CSE        |  NULL | Hyderabad |
|        10 | Ramesh |   23 | EEE        |  NULL | Delhi     |
|         7 | Priya  |   20 | EEE        |    88 | Delhi     |
|         5 | Kiran  |   22 | ECE        |    75 | Pune      |
|         8 | John   |   22 | MECH       |    55 | Mumbai    |
|         4 | Divya  |   23 | MECH       |    65 | NULL      |
|         1 | Anil   |   20 | CSE        |    85 | Hyderabad |
+-----------+--------+------+------------+-------+-----------+
10 rows in set (0.00 sec)

mysql> --display all students order by marks in desc.. order?
    -> --display all students order by age?
    -> -- display all students order by department ?
    -> ^C
mysql> select * from students order by marks desc;
+-----------+--------+------+------------+-------+-----------+
| StudentID | Name   | Age  | Department | Marks | City      |
+-----------+--------+------+------------+-------+-----------+
|         6 | Varun  |   21 | CSE        |    92 | Chennai   |
|         7 | Priya  |   20 | EEE        |    88 | Delhi     |
|         1 | Anil   |   20 | CSE        |    85 | Hyderabad |
|         2 | Sneha  |   22 | ECE        |    75 | Mumbai    |
|         5 | Kiran  |   22 | ECE        |    75 | Pune      |
|         9 | Rekha  |   21 | ECE        |    75 | Pune      |
|         4 | Divya  |   23 | MECH       |    65 | NULL      |
|         8 | John   |   22 | MECH       |    55 | Mumbai    |
|         3 | Ravi   |   20 | CSE        |  NULL | Hyderabad |
|        10 | Ramesh |   23 | EEE        |  NULL | Delhi     |
+-----------+--------+------+------------+-------+-----------+
10 rows in set (0.00 sec)

mysql> select * from students order by age;
+-----------+--------+------+------------+-------+-----------+
| StudentID | Name   | Age  | Department | Marks | City      |
+-----------+--------+------+------------+-------+-----------+
|         1 | Anil   |   20 | CSE        |    85 | Hyderabad |
|         3 | Ravi   |   20 | CSE        |  NULL | Hyderabad |
|         7 | Priya  |   20 | EEE        |    88 | Delhi     |
|         6 | Varun  |   21 | CSE        |    92 | Chennai   |
|         9 | Rekha  |   21 | ECE        |    75 | Pune      |
|         2 | Sneha  |   22 | ECE        |    75 | Mumbai    |
|         5 | Kiran  |   22 | ECE        |    75 | Pune      |
|         8 | John   |   22 | MECH       |    55 | Mumbai    |
|         4 | Divya  |   23 | MECH       |    65 | NULL      |
|        10 | Ramesh |   23 | EEE        |  NULL | Delhi     |
+-----------+--------+------+------------+-------+-----------+
10 rows in set (0.00 sec)

mysql> select * from students order by department;
+-----------+--------+------+------------+-------+-----------+
| StudentID | Name   | Age  | Department | Marks | City      |
+-----------+--------+------+------------+-------+-----------+
|         1 | Anil   |   20 | CSE        |    85 | Hyderabad |
|         3 | Ravi   |   20 | CSE        |  NULL | Hyderabad |
|         6 | Varun  |   21 | CSE        |    92 | Chennai   |
|         2 | Sneha  |   22 | ECE        |    75 | Mumbai    |
|         5 | Kiran  |   22 | ECE        |    75 | Pune      |
|         9 | Rekha  |   21 | ECE        |    75 | Pune      |
|         7 | Priya  |   20 | EEE        |    88 | Delhi     |
|        10 | Ramesh |   23 | EEE        |  NULL | Delhi     |
|         4 | Divya  |   23 | MECH       |    65 | NULL      |
|         8 | John   |   22 | MECH       |    55 | Mumbai    |
+-----------+--------+------+------------+-------+-----------+
10 rows in set (0.00 sec)

mysql> select  department, avg(marks) as average_marks 
    -> from students
    -> where age > 20
    -> group by department
    -> having average_marks > 70
    -> order by average_marks desc;
+------------+---------------+
| department | average_marks |
+------------+---------------+
| CSE        |       92.0000 |
| ECE        |       75.0000 |
+------------+---------------+
2 rows in set (0.00 sec)

mysql> -- display the total no.of students in each city considering only students whose marks are > 70 . show cities having more than one stdents and sort by total students?
mysql> ^C
mysql> select department, count(*) as total_students
    -> from students
    -> ^C
mysql> select city, count(*) as total_students
    -> from students
    -> group by city
    -> ^C
mysql> select city, count(*) as total_students
    -> from students
    -> where marks > 70
    -> group by city
    -> having total_students > 1
    -> order by total_students;
+------+----------------+
| city | total_students |
+------+----------------+
| Pune |              2 |
+------+----------------+
1 row in set (0.01 sec)

mysql> --display the total marks of each dept consideriung only std from hyd and pune .show department whose total ,arks are > 100 nd order by total marks?
    -> ^C
mysql> select department, sum(marks) as total_students
    -> from students
    -> where city = 'hydrebad' and 'pune'
    -> ^C
mysql> select department, sum(marks) as total_students
    -> from students
    -> where city in ('hydrebad','pune')
    -> group by department
    -> having total_students > 100
    -> order by total_students desc;
+------------+----------------+
| department | total_students |
+------------+----------------+
| ECE        |            150 |
+------------+----------------+
1 row in set (0.01 sec)

mysql> -- display the highest marks obtained in each city considering only std from the ece dept. show cities whose highest marks are > 70 nd order by highest marks?
mysql> select city, max(marks) as highest_marks
    -> from students
    -> where department = 'ece'
    -> group by city
    -> having highest_marks > 70
    -> order by highest_marks desc;
+--------+---------------+
| city   | highest_marks |
+--------+---------------+
| Mumbai |            75 |
| Pune   |            75 |
+--------+---------------+
2 rows in set (0.01 sec)

mysql> --display the avg age of student in each department considering only students whose city is not null . shoe department whose avg age is > 20 nd sort alphabitecally?
    -> ^C
mysql> 
mysql> selct department, avg(age) as avg_age
    -> from students
    -> where city is not null
    -> group by department
    -> having avg(age) > 20
    -> order by department asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selct department, avg(age) as avg_age
from students
where city is not null
group' at line 1
mysql> select department, avg(age) as avg_age
    -> from students
    -> group by department
    -> having avg(age) > 20
    -> order by department asc;
+------------+---------+
| department | avg_age |
+------------+---------+
| CSE        | 20.3333 |
| ECE        | 21.6667 |
| EEE        | 21.5000 |
| MECH       | 22.5000 |
+------------+---------+
4 rows in set (0.03 sec)

mysql> CREATE TABLE sales (
    ->    sale_id INT PRIMARY KEY,
    ->    product VARCHAR(50),
    ->    category VARCHAR(50),
    ->    units_sold INT,
    ->    unit_price INT,
    ->    region VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> 
mysql> INSERT INTO sales (sale_id, product, category, units_sold, unit_price, region) VALUES
    -> (1,  'Keyboard',    'Electronics', 10, 1200,  'North'),
    -> (2,  'Monitor',     'Electronics', 5,  7000,  'South'),
    -> (3,  'Chair',       'Furniture',   15, 2500,  'North'),
    -> (4,  'Desk',        'Furniture',   7,  4500,  'West'),
    -> (5,  'Mouse',       'Electronics', 20, 800,   'East'),
    -> (6,  'Sofa',        'Furniture',   3,  15000, 'South'),
    -> (7,  'Headphones',  'Electronics', 8,  1800,  'North'),
    -> (8,  'Laptop',      'Electronics', 6,  55000, 'West'),
    -> (9,  'Table',       'Furniture',   12, 6000,  'East'),
    -> (10, 'Fan',         'HomeAppliance', 18, 3000, 'South'),
    -> (11, 'AC',          'HomeAppliance', 4, 35000, 'North'),
    -> (12, 'Cupboard',    'Furniture',   5, 12000, 'West'),
    -> (13, 'Printer',     'Electronics', 9, 9000,  'East'),
    -> (14, 'Bed',         'Furniture',   2, 25000, 'South'),
    -> (15, 'Mobile',      'Electronics', 14, 20000, 'North');
Query OK, 15 rows affected (0.02 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select * from sales;
+---------+------------+---------------+------------+------------+--------+
| sale_id | product    | category      | units_sold | unit_price | region |
+---------+------------+---------------+------------+------------+--------+
|       1 | Keyboard   | Electronics   |         10 |       1200 | North  |
|       2 | Monitor    | Electronics   |          5 |       7000 | South  |
|       3 | Chair      | Furniture     |         15 |       2500 | North  |
|       4 | Desk       | Furniture     |          7 |       4500 | West   |
|       5 | Mouse      | Electronics   |         20 |        800 | East   |
|       6 | Sofa       | Furniture     |          3 |      15000 | South  |
|       7 | Headphones | Electronics   |          8 |       1800 | North  |
|       8 | Laptop     | Electronics   |          6 |      55000 | West   |
|       9 | Table      | Furniture     |         12 |       6000 | East   |
|      10 | Fan        | HomeAppliance |         18 |       3000 | South  |
|      11 | AC         | HomeAppliance |          4 |      35000 | North  |
|      12 | Cupboard   | Furniture     |          5 |      12000 | West   |
|      13 | Printer    | Electronics   |          9 |       9000 | East   |
|      14 | Bed        | Furniture     |          2 |      25000 | South  |
|      15 | Mobile     | Electronics   |         14 |      20000 | North  |
+---------+------------+---------------+------------+------------+--------+
15 rows in set (0.00 sec)

mysql> --total units sold per category where total units > 20?
    -> --total revenue per region where revenue > 50000?
    -> --count of products per category with more than 2 products?
    -> --avg unit price per changes < 5000
    -> --region with more than 1 electronics product?
    -> ^C
mysql> select category, count(*) as total_units
    -> from sales
    -> group by category
    -> having total_units > 20;
Empty set (0.00 sec)

mysql> select category, sum(unit_sold) as total_units 
    -> from sales
    -> group by category
    -> having total_units > 20;
ERROR 1054 (42S22): Unknown column 'unit_sold' in 'field list'
mysql> select region, sum (units_sold * unit_price) as total_revenue
    -> from sales
    -> group by region
    -> having total_revenue > 50000;
ERROR 1630 (42000): FUNCTION da3.sum does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> select region, sum(units_sold * unit_price) as total_revenue
    -> from sales
    -> group by region
    -> having total_revenue > 50000;
+--------+---------------+
| region | total_revenue |
+--------+---------------+
| North  |        483900 |
| South  |        184000 |
| West   |        421500 |
| East   |        169000 |
+--------+---------------+
4 rows in set (0.04 sec)

mysql> select category, count(*) as products
    -> from sales
    -> group by category
    -> having products > 2;
+-------------+----------+
| category    | products |
+-------------+----------+
| Electronics |        7 |
| Furniture   |        6 |
+-------------+----------+
2 rows in set (0.02 sec)

mysql> select category, region
    -> from sales
    -> where units_sold > 1
    -> group by category
    -> having region;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'da3.sales.region' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> ^C
mysql> 
mysql> select category, avg(unit_price) as products
    -> from sales 
    -> where category = 'electronics'
    -> group by category
    -> having products < 5000;
Empty set (0.01 sec)

mysql> select category, count(*) as region
    -> from sales
    -> ^C
mysql> select category, avg(unit_price) as products
    -> from sales 
    -> group by category
    -> having products < 5000;
Empty set (0.01 sec)

mysql> select category, count(*) as region
    -> from sales 
    -> where category = 'electronics'
    -> group by category
    -> having region > 1;
+-------------+--------+
| category    | region |
+-------------+--------+
| Electronics |      7 |
+-------------+--------+
1 row in set (0.00 sec)

mysql> select region, count(*) as total_products
    -> from sales 
    -> where category = 'electronics'
    -> group by region
    -> having total_products > 1;
+--------+----------------+
| region | total_products |
+--------+----------------+
| North  |              3 |
| East   |              2 |
+--------+----------------+
2 rows in set (0.01 sec)

mysql> SELECT category, SUM(units_sold) AS total_units
    -> FROM sales
    -> GROUP BY category
    -> HAVING total_units > 20;
+---------------+-------------+
| category      | total_units |
+---------------+-------------+
| Electronics   |          72 |
| Furniture     |          44 |
| HomeAppliance |          22 |
+---------------+-------------+
3 rows in set (0.01 sec)

mysql> Terminal close -- exit!
