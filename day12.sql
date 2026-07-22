Date Functions:
=================
mysql> use da;
Database changed
mysql> -- curdate() : return the current date yyyy-mm-dd
mysql> select curdate() as cur_date;
+------------+
| cur_date   |
+------------+
| 2026-07-06 |
+------------+
1 row in set (0.00 sec)

mysql> -- curtime() : returns current time\
mysql> select curtime() as cur_time;
+----------+
| cur_time |
+----------+
| 09:17:02 |
+----------+
1 row in set (0.00 sec)

mysql> -- now() : return the current date and time
mysql> select now()as current_date_time;
+---------------------+
| current_date_time   |
+---------------------+
| 2026-07-06 09:17:39 |
+---------------------+
1 row in set (0.00 sec)

mysql> -- date() : extract date part
mysql> select date('2024-11-28 14:32:45')as extracted_date;
+----------------+
| extracted_date |
+----------------+
| 2024-11-28     |
+----------------+
1 row in set (0.03 sec)

mysql> -- time() : extract time
mysql> select time(now())as extract_time;
+--------------+
| extract_time |
+--------------+
| 09:19:37     |
+--------------+
1 row in set (0.00 sec)

mysql> -- year()
mysql> select year(now())as year_part;
+-----------+
| year_part |
+-----------+
|      2026 |
+-----------+
1 row in set (0.00 sec)

mysql> -- month()
mysql> select month(now())as month_part;
+------------+
| month_part |
+------------+
|          7 |
+------------+
1 row in set (0.00 sec)

mysql> -- day() or dayofmonth() : which it returns the day of month
mysql> select day(curdate())as day_part;
+----------+
| day_part |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)

mysql> -- to get the current date in a particular week
mysql> select week(now())as week_number;
+-------------+
| week_number |
+-------------+
|          27 |
+-------------+
1 row in set (0.00 sec)

mysql> -- dayofweek(): retuens the day of week (1-7)
mysql> select dayofweek(now())as day_of_week;
+-------------+
| day_of_week |
+-------------+
|           2 |
+-------------+
1 row in set (0.03 sec)

mysql> select dayofmonth(now())as day_of_month;
+--------------+
| day_of_month |
+--------------+
|            6 |
+--------------+
1 row in set (0.00 sec)

mysql> -- date_Add()
mysql> select date_add(now(),interval 20 day)as new_date;
+---------------------+
| new_date            |
+---------------------+
| 2026-07-26 09:29:24 |
+---------------------+
1 row in set (0.00 sec)

mysql> select date_add(now(),interval 100 day)as new_date;
+---------------------+
| new_date            |
+---------------------+
| 2026-10-14 09:29:54 |
+---------------------+
1 row in set (0.00 sec)

mysql> select date_sub(now(),interval 30 day)as new_date;
+---------------------+
| new_date            |
+---------------------+
| 2026-06-06 09:30:25 |
+---------------------+
1 row in set (0.00 sec)

mysql> to know the difference between the two dates
    -> ^C
mysql> select datediff(now(),'2000-05-23')as days_diff;
+-----------+
| days_diff |
+-----------+
|      9540 |
+-----------+
1 row in set (0.00 sec)

mysql> select datediff(now(),'2000-05-30')as days_diff;
+-----------+
| days_diff |
+-----------+
|      9533 |
+-----------+
1 row in set (0.00 sec)

mysql> -- to now the last day of the month
mysql> select last_Day(now())as last_day_of_month;
+-------------------+
| last_day_of_month |
+-------------------+
| 2026-07-31        |
+-------------------+
1 row in set (0.00 sec)

mysql> select makedate(2026,60)as result_date;
+-------------+
| result_date |
+-------------+
| 2026-03-01  |
+-------------+
1 row in set (0.00 sec)

mysql> select maketime(18,24,45)as result_time;
+-------------+
| result_time |
+-------------+
| 18:24:45    |
+-------------+
1 row in set (0.00 sec)

mysql> select monthname(now())as month_name;
+------------+
| month_name |
+------------+
| July       |
+------------+
1 row in set (0.03 sec)

mysql> select dayname(now())as day_name;
+----------+
| day_name |
+----------+
| Monday   |
+----------+
1 row in set (0.00 sec)

mysql> select monthname(5)as month_name;
+------------+
| month_name |
+------------+
| NULL       |
+------------+
1 row in set, 1 warning (0.03 sec)

mysql> select monthname('2026-5-10')as month_name;
+------------+
| month_name |
+------------+
| May        |
+------------+
1 row in set (0.00 sec)

mysql> select sec_to_time(3661)as time_value;
+------------+
| time_value |
+------------+
| 01:01:01   |
+------------+
1 row in set (0.00 sec)

mysql> select time_to_sec('01:01:01')as total_Second;
+--------------+
| total_Second |
+--------------+
|         3661 |
+--------------+
1 row in set (0.00 sec)

mysql> select sysdate() as system_date;
+---------------------+
| system_date         |
+---------------------+
| 2026-07-06 09:38:08 |
+---------------------+
1 row in set (0.00 sec)

mysql> select dayname('2026-5-10')as day_name;
+----------+
| day_name |
+----------+
| Sunday   |
+----------+
1 row in set (0.00 sec)

mysql> CREATE TABLE employee_attendance
    -> (
    -> emp_id INT PRIMARY KEY AUTO_INCREMENT,
    -> emp_name VARCHAR(100),
    -> department VARCHAR(50),
    -> joining_date DATE,
    -> birth_date DATE,
    -> login_time DATETIME,
    -> logout_time DATETIME,
    -> salary DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc employee_attendance;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| emp_id       | int           | NO   | PRI | NULL    | auto_increment |
| emp_name     | varchar(100)  | YES  |     | NULL    |                |
| department   | varchar(50)   | YES  |     | NULL    |                |
| joining_date | date          | YES  |     | NULL    |                |
| birth_date   | date          | YES  |     | NULL    |                |
| login_time   | datetime      | YES  |     | NULL    |                |
| logout_time  | datetime      | YES  |     | NULL    |                |
| salary       | decimal(10,2) | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> INSERT INTO employee_attendance
    -> (emp_name, department, joining_date, birth_date, login_time, logout_time, salary)
    -> VALUES
    -> ('Rahul','IT','2021-06-15','1998-05-10','2024-11-20 09:05:10','2024-11-20 18:15:30',55000),
    -> ('Sneha','HR','2020-03-21','1996-11-18','2024-11-21 08:55:20','2024-11-21 17:45:50',48000),
    -> ('Arjun','Finance','2019-08-10','1994-07-30','2024-11-22 09:15:45','2024-11-22 18:35:20',62000),
    -> ('Priya','IT','2022-01-05','2000-01-25','2024-11-23 09:00:00','2024-11-23 17:55:40',51000),
    -> ('Kiran','Admin','2018-12-11','1992-09-15','2024-11-24 08:40:30','2024-11-24 17:30:00',45000),
    -> ('Anjali','Testing','2023-04-17','1999-12-20','2024-11-25 09:12:10','2024-11-25 18:05:00',47000),
    -> ('Vijay','IT','2021-09-14','1997-04-08','2024-11-26 09:08:15','2024-11-26 18:20:40',59000),
    -> ('Divya','HR','2019-10-19','1995-06-11','2024-11-27 08:50:30','2024-11-27 17:42:15',50000),
    -> ('Ramesh','Finance','2017-07-01','1991-08-14','2024-11-28 09:03:00','2024-11-28 18:12:00',70000),
    -> ('Pooja','Testing','2022-05-09','2001-03-19','2024-11-29 09:18:50','2024-11-29 18:25:10',53000);
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from employee_attendance;
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
| emp_id | emp_name | department | joining_date | birth_date | login_time          | logout_time         | salary   |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
|      1 | Rahul    | IT         | 2021-06-15   | 1998-05-10 | 2024-11-20 09:05:10 | 2024-11-20 18:15:30 | 55000.00 |
|      2 | Sneha    | HR         | 2020-03-21   | 1996-11-18 | 2024-11-21 08:55:20 | 2024-11-21 17:45:50 | 48000.00 |
|      3 | Arjun    | Finance    | 2019-08-10   | 1994-07-30 | 2024-11-22 09:15:45 | 2024-11-22 18:35:20 | 62000.00 |
|      4 | Priya    | IT         | 2022-01-05   | 2000-01-25 | 2024-11-23 09:00:00 | 2024-11-23 17:55:40 | 51000.00 |
|      5 | Kiran    | Admin      | 2018-12-11   | 1992-09-15 | 2024-11-24 08:40:30 | 2024-11-24 17:30:00 | 45000.00 |
|      6 | Anjali   | Testing    | 2023-04-17   | 1999-12-20 | 2024-11-25 09:12:10 | 2024-11-25 18:05:00 | 47000.00 |
|      7 | Vijay    | IT         | 2021-09-14   | 1997-04-08 | 2024-11-26 09:08:15 | 2024-11-26 18:20:40 | 59000.00 |
|      8 | Divya    | HR         | 2019-10-19   | 1995-06-11 | 2024-11-27 08:50:30 | 2024-11-27 17:42:15 | 50000.00 |
|      9 | Ramesh   | Finance    | 2017-07-01   | 1991-08-14 | 2024-11-28 09:03:00 | 2024-11-28 18:12:00 | 70000.00 |
|     10 | Pooja    | Testing    | 2022-05-09   | 2001-03-19 | 2024-11-29 09:18:50 | 2024-11-29 18:25:10 | 53000.00 |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
10 rows in set (0.00 sec)

mysql> -- display employees who joined in the current year
mysql> select * from employee_attendace where joining
    -> ^C
mysql> select * from employee_attendace where year(now())as this_year;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as this_year' at line 1
mysql> SELECT *
    -> FROM employee_attendace
    -> WHERE YEAR(attendance_date) = YEAR(NOW());
ERROR 1146 (42S02): Table 'da.employee_attendace' doesn't exist
mysql> select * from employee_attendance where year(attendace_date)=year(now());
ERROR 1054 (42S22): Unknown column 'attendace_date' in 'where clause'
mysql> select * from employee_attendance where year(joining_date)=year(now());
Empty set (0.00 sec)

mysql> SELECT *
    -> FROM employee_attendance
    -> WHERE YEAR(joining_date) = YEAR(CURDATE());
Empty set (0.00 sec)

mysql> select * from employee_attendance where month(birt_date)=11;
ERROR 1054 (42S22): Unknown column 'birt_date' in 'where clause'
mysql> select * from employee_attendance where month(birth_date)=11;
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
| emp_id | emp_name | department | joining_date | birth_date | login_time          | logout_time         | salary   |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
|      2 | Sneha    | HR         | 2020-03-21   | 1996-11-18 | 2024-11-21 08:55:20 | 2024-11-21 17:45:50 | 48000.00 |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
1 row in set (0.00 sec)

mysql> select * from employee where month(joining_date)=6
    -> ^C
mysql> select * from employee where month(joining_date)=6;
ERROR 1054 (42S22): Unknown column 'joining_date' in 'where clause'
mysql> select * from employee_attendance where month(joining_date)=6;
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
| emp_id | emp_name | department | joining_date | birth_date | login_time          | logout_time         | salary   |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
|      1 | Rahul    | IT         | 2021-06-15   | 1998-05-10 | 2024-11-20 09:05:10 | 2024-11-20 18:15:30 | 55000.00 |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
1 row in set (0.00 sec)

mysql> select * from employee_attendance where month(birth_date)=10;
Empty set (0.00 sec)

mysql> select * from employee_attendance where day(birth_date)=10;
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
| emp_id | emp_name | department | joining_date | birth_date | login_time          | logout_time         | salary   |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
|      1 | Rahul    | IT         | 2021-06-15   | 1998-05-10 | 2024-11-20 09:05:10 | 2024-11-20 18:15:30 | 55000.00 |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
1 row in set (0.00 sec)

mysql> select * from employee_attendance where month(joining_date) between 4 and 6;
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
| emp_id | emp_name | department | joining_date | birth_date | login_time          | logout_time         | salary   |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
|      1 | Rahul    | IT         | 2021-06-15   | 1998-05-10 | 2024-11-20 09:05:10 | 2024-11-20 18:15:30 | 55000.00 |
|      6 | Anjali   | Testing    | 2023-04-17   | 1999-12-20 | 2024-11-25 09:12:10 | 2024-11-25 18:05:00 | 47000.00 |
|     10 | Pooja    | Testing    | 2022-05-09   | 2001-03-19 | 2024-11-29 09:18:50 | 2024-11-29 18:25:10 | 53000.00 |
+--------+----------+------------+--------------+------------+---------------------+---------------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT emp_name,
    ->        TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age_in_years
    -> FROM employee_attendance;
+----------+--------------+
| emp_name | age_in_years |
+----------+--------------+
| Rahul    |           28 |
| Sneha    |           29 |
| Arjun    |           31 |
| Priya    |           26 |
| Kiran    |           33 |
| Anjali   |           26 |
| Vijay    |           29 |
| Divya    |           31 |
| Ramesh   |           34 |
| Pooja    |           25 |
+----------+--------------+
10 rows in set (0.00 sec)

mysql> select emp_name,joining_date from employee_Attendance where timestampdiff(year,birt_date,curdate())>3;
ERROR 1054 (42S22): Unknown column 'birt_date' in 'where clause'
mysql> select emp_name,joining_date from employee_Attendance where timestampdiff(year,joining_date,curdate())>3;
+----------+--------------+
| emp_name | joining_date |
+----------+--------------+
| Rahul    | 2021-06-15   |
| Sneha    | 2020-03-21   |
| Arjun    | 2019-08-10   |
| Priya    | 2022-01-05   |
| Kiran    | 2018-12-11   |
| Vijay    | 2021-09-14   |
| Divya    | 2019-10-19   |
| Ramesh   | 2017-07-01   |
| Pooja    | 2022-05-09   |
+----------+--------------+
9 rows in set (0.03 sec)

mysql> select emp_name,timestamdiff(hour,login_time,logout_time)as total_working_hours from employee_Attendance;
ERROR 1305 (42000): FUNCTION da.timestamdiff does not exist
mysql> select emp_name,timestampdiff(hour,login_time,logout_time)as total_working_hours from employee_Attendance;
+----------+---------------------+
| emp_name | total_working_hours |
+----------+---------------------+
| Rahul    |                   9 |
| Sneha    |                   8 |
| Arjun    |                   9 |
| Priya    |                   8 |
| Kiran    |                   8 |
| Anjali   |                   8 |
| Vijay    |                   9 |
| Divya    |                   8 |
| Ramesh   |                   9 |
| Pooja    |                   9 |
+----------+---------------------+
10 rows in set (0.00 sec)

mysql> select emp_name,timestampdiff(minute,login_time,logout_time)as total_minutes from employee_Attendance;
+----------+---------------+
| emp_name | total_minutes |
+----------+---------------+
| Rahul    |           550 |
| Sneha    |           530 |
| Arjun    |           559 |
| Priya    |           535 |
| Kiran    |           529 |
| Anjali   |           532 |
| Vijay    |           552 |
| Divya    |           531 |
| Ramesh   |           549 |
| Pooja    |           546 |
+----------+---------------+
10 rows in set (0.00 sec)

mysql> select emp_name,login_time from employee_Attendance where time(login_time)<'09:00:00';
+----------+---------------------+
| emp_name | login_time          |
+----------+---------------------+
| Sneha    | 2024-11-21 08:55:20 |
| Kiran    | 2024-11-24 08:40:30 |
| Divya    | 2024-11-27 08:50:30 |
+----------+---------------------+
3 rows in set (0.00 sec)

mysql> select emp_name,login_time from employee_Attendance where time(login_time)>'09:10:00';
+----------+---------------------+
| emp_name | login_time          |
+----------+---------------------+
| Arjun    | 2024-11-22 09:15:45 |
| Anjali   | 2024-11-25 09:12:10 |
| Pooja    | 2024-11-29 09:18:50 |
+----------+---------------------+
3 rows in set (0.00 sec)

mysql> select emp_name,joining_date from employee_attendance where dayname(joining_date)='monday';
+----------+--------------+
| emp_name | joining_date |
+----------+--------------+
| Anjali   | 2023-04-17   |
| Pooja    | 2022-05-09   |
+----------+--------------+
2 rows in set (0.00 sec)

mysql> select emp_name,birth_date from employee_attendance where monthname(birth_date) like 'j%';
+----------+------------+
| emp_name | birth_date |
+----------+------------+
| Arjun    | 1994-07-30 |
| Priya    | 2000-01-25 |
| Divya    | 1995-06-11 |
+----------+------------+
3 rows in set (0.00 sec)

mysql> select emp_name,joining_date from employee_attendance where week(joining_date)=25;
Empty set (0.00 sec)


SET OPERATORS:
===============
1.union:
-------- 
which combines results from two queries and removes duplicates rows. columns must have the same number and type.

2.Union all:
------------
combines results from two queries including duplicate rows and columns must have the same number and type.

3.Intersect:
-------------
returns the rows that are common to both queries columns must have the same number and type
note: MySql doesn't support intersect directly

4.Minus:
--------
retuen the rows from the first query that are not present in the second query columns must have the same umber and type
note: MySql doesn't support minus directly
mysql> CREATE TABLE Course (
    -> course_id INT,
    ->     course_name VARCHAR(100),
    -> instructor VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO Course (course_id, course_name, instructor) VALUES
    -> (1, 'Mathematics', 'Dr. Smith'),
    -> (2, 'Physics', 'Dr. Johnson'),
    -> (3, 'Chemistry', 'Dr. Brown'),
    -> (4, 'Biology', 'Dr. Lee'),
    -> (5, 'History', 'Dr. Martin');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Course_Completed (
    -> course_id INT,
    -> course_name VARCHAR(100),
    -> instructor VARCHAR(100)
    -> ); 
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO Course_Completed (course_id, course_name, instructor) VALUES
    -> (2, 'Physics', 'Dr. Johnson'),
    -> (3, 'Chemistry', 'Dr. Brown'),
    -> (6, 'Computer Science', 'Dr. Walker'),
    -> (7, 'Art', 'Dr. Scott');
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from course;
+-----------+-------------+-------------+
| course_id | course_name | instructor  |
+-----------+-------------+-------------+
|         1 | Mathematics | Dr. Smith   |
|         2 | Physics     | Dr. Johnson |
|         3 | Chemistry   | Dr. Brown   |
|         4 | Biology     | Dr. Lee     |
|         5 | History     | Dr. Martin  |
+-----------+-------------+-------------+
5 rows in set (0.00 sec)

mysql> select * from course_Completed;
+-----------+------------------+-------------+
| course_id | course_name      | instructor  |
+-----------+------------------+-------------+
|         2 | Physics          | Dr. Johnson |
|         3 | Chemistry        | Dr. Brown   |
|         6 | Computer Science | Dr. Walker  |
|         7 | Art              | Dr. Scott   |
+-----------+------------------+-------------+
4 rows in set (0.00 sec)

mysql> -- combine course names from both table removing duplicates
mysql> select course_name from course
    -> union
    -> select course_name from course_completed;
+------------------+
| course_name      |
+------------------+
| Mathematics      |
| Physics          |
| Chemistry        |
| Biology          |
| History          |
| Computer Science |
| Art              |
+------------------+
7 rows in set (0.00 sec)

mysql> -- combine instrctor names from both the table removing duplicates.
mysql> select instructor from course
    -> union
    -> select instructor from course_completed;
+-------------+
| instructor  |
+-------------+
| Dr. Smith   |
| Dr. Johnson |
| Dr. Brown   |
| Dr. Lee     |
| Dr. Martin  |
| Dr. Walker  |
| Dr. Scott   |
+-------------+
7 rows in set (0.00 sec)

mysql> -- combine course name from both table including duplicates
mysql> select course_name from course
    -> union all 
    -> select course_name from course_completed;
+------------------+
| course_name      |
+------------------+
| Mathematics      |
| Physics          |
| Chemistry        |
| Biology          |
| History          |
| Physics          |
| Chemistry        |
| Computer Science |
| Art              |
+------------------+
9 rows in set (0.00 sec)

mysql> select instructor from course
    -> union all
    -> select instructor from course_Completed;
+-------------+
| instructor  |
+-------------+
| Dr. Smith   |
| Dr. Johnson |
| Dr. Brown   |
| Dr. Lee     |
| Dr. Martin  |
| Dr. Johnson |
| Dr. Brown   |
| Dr. Walker  |
| Dr. Scott   |
+-------------+
9 rows in set (0.00 sec)