mysql> tee c:/mysql/day4.txt
Logging to file 'c:/mysql/day4.txt'



mysql> desc employee;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| empId   | char(5)      | YES  |     | NULL    |       |
| fname   | varchar(100) | YES  |     | NULL    |       |
| lname   | varchar(30)  | YES  |     | NULL    |       |
| age     | int          | YES  |     | NULL    |       |
| doj     | date         | YES  |     | NULL    |       |
| address | tinytext     | YES  |     | NULL    |       |
| dept    | varchar(20)  | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> --ALTER
    -> ^C
mysql> -- Alter
mysql> -- Modify the fname column in employee table to varchar(70)
mysql> -- syntax: alter table table-name modify column-name datatype size.
mysql> alter table employee modify fname varchar(70);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| empId   | char(5)     | YES  |     | NULL    |       |
| fname   | varchar(70) | YES  |     | NULL    |       |
| lname   | varchar(30) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| doj     | date        | YES  |     | NULL    |       |
| address | tinytext    | YES  |     | NULL    |       |
| dept    | varchar(20) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table employee modify lname varchar(80);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| empId   | char(5)     | YES  |     | NULL    |       |
| fname   | varchar(70) | YES  |     | NULL    |       |
| lname   | varchar(80) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| doj     | date        | YES  |     | NULL    |       |
| address | tinytext    | YES  |     | NULL    |       |
| dept    | varchar(20) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> -- Add a new column named with location of type tiny text to the employee table.
mysql> -- Syntax: alter table tablename add columnname datatype(size)
mysql> alter table employee add location tinytext;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| empId    | char(5)     | YES  |     | NULL    |       |
| fname    | varchar(70) | YES  |     | NULL    |       |
| lname    | varchar(80) | YES  |     | NULL    |       |
| age      | int         | YES  |     | NULL    |       |
| doj      | date        | YES  |     | NULL    |       |
| address  | tinytext    | YES  |     | NULL    |       |
| dept     | varchar(20) | YES  |     | NULL    |       |
| location | tinytext    | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> -- to add a column after a particular column
mysql> -- syntax: alter table table-name add column-name after specified-column-name
mysql> alter table employee add pfid after address;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'after address' at line 1
mysql> alter table employee add pfid int after address;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| empId    | char(5)     | YES  |     | NULL    |       |
| fname    | varchar(70) | YES  |     | NULL    |       |
| lname    | varchar(80) | YES  |     | NULL    |       |
| age      | int         | YES  |     | NULL    |       |
| doj      | date        | YES  |     | NULL    |       |
| address  | tinytext    | YES  |     | NULL    |       |
| pfid     | int         | YES  |     | NULL    |       |
| dept     | varchar(20) | YES  |     | NULL    |       |
| location | tinytext    | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> -- rename the fname column to first name in the employee table
mysql> -- syntax: alter table table-name change existing column-name new column-name datatype(size)
mysql> alter table employee change column fname firstname varchar(30);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empId     | char(5)     | YES  |     | NULL    |       |
| firstname | varchar(30) | YES  |     | NULL    |       |
| lname     | varchar(80) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| doj       | date        | YES  |     | NULL    |       |
| address   | tinytext    | YES  |     | NULL    |       |
| pfid      | int         | YES  |     | NULL    |       |
| dept      | varchar(20) | YES  |     | NULL    |       |
| location  | tinytext    | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> alter table employee change column lname lastname varchar(30);
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empId     | char(5)     | YES  |     | NULL    |       |
| firstname | varchar(30) | YES  |     | NULL    |       |
| lastname  | varchar(30) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| doj       | date        | YES  |     | NULL    |       |
| address   | tinytext    | YES  |     | NULL    |       |
| pfid      | int         | YES  |     | NULL    |       |
| dept      | varchar(20) | YES  |     | NULL    |       |
| location  | tinytext    | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> -- how to drop a column
mysql> -- syntax: alter table table-name drop column column-name
mysql> alter table employee drop column pfid;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empId     | char(5)     | YES  |     | NULL    |       |
| firstname | varchar(30) | YES  |     | NULL    |       |
| lastname  | varchar(30) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| doj       | date        | YES  |     | NULL    |       |
| address   | tinytext    | YES  |     | NULL    |       |
| dept      | varchar(20) | YES  |     | NULL    |       |
| location  | tinytext    | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> alter table employee drop column location;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empId     | char(5)     | YES  |     | NULL    |       |
| firstname | varchar(30) | YES  |     | NULL    |       |
| lastname  | varchar(30) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| doj       | date        | YES  |     | NULL    |       |
| address   | tinytext    | YES  |     | NULL    |       |
| dept      | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> -- how to change table-name
mysql> -- syntax: alter table table-name rename to new table-name
mysql> alter table employee rename to codegnan_emp;
Query OK, 0 rows affected (0.06 sec)

mysql> desc codegnan_emp;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empId     | char(5)     | YES  |     | NULL    |       |
| firstname | varchar(30) | YES  |     | NULL    |       |
| lastname  | varchar(30) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| doj       | date        | YES  |     | NULL    |       |
| address   | tinytext    | YES  |     | NULL    |       |
| dept      | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> show tables;
+--------------+
| Tables_in_da |
+--------------+
| codegnan_emp |
+--------------+
1 row in set (0.00 sec)

mysql> alter table codegnan_emp rename to employee;
Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
+--------------+
| Tables_in_da |
+--------------+
| employee     |
+--------------+
1 row in set (0.00 sec)

mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empId     | char(5)     | YES  |     | NULL    |       |
| firstname | varchar(30) | YES  |     | NULL    |       |
| lastname  | varchar(30) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| doj       | date        | YES  |     | NULL    |       |
| address   | tinytext    | YES  |     | NULL    |       |
| dept      | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> notee
mysql> create table company_staff;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table company_staff(
    -> EMPID INT,
    -> AGE TINYINT,
    -> EXPERIENCE SMALLINT,
    -> GENDER CHAR(1),
    -> EMP_NAME VARCHAR(50),
    -> ADDRESS TINYTEXT,
    -> SALARY DECIMAL(10,2)
    -> DEPT ENUM('HR','IT','SALES','FINANCE','SUPPORT')
    -> ^C
mysql> CREATE TABLE COMPANY_STAFF(
    -> EMPID INT,
    -> AGE TINYTEXT,
    -> EXPERIENCE SMALLINT,
    -> GENDER CHAR(1),
    -> EMP_NAME VARCHAR(50),
    -> ADDRESS TINYTEXT,
    -> SALARY DECIMAL(10,2),
    -> DEPT ENUM('HR','IT','SALES','FINANCE','SUPPORT'),
    -> SKILLS SET('JAVA','PYTHON','SQL','EXCEL','COMUNICATION'),
    -> DOJ DATE
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> DESC COMPANY_STAFF;
+------------+---------------------------------------------------+------+-----+---------+-------+
| Field      | Type                                              | Null | Key | Default | Extra |
+------------+---------------------------------------------------+------+-----+---------+-------+
| EMPID      | int                                               | YES  |     | NULL    |       |
| AGE        | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
| GENDER     | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
| ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
| SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ        | date                                              | YES  |     | NULL    |       |
+------------+---------------------------------------------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

mysql> SHOW TABLES;
+---------------+
| Tables_in_da  |
+---------------+
| company_staff |
| employee      |
+---------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF ADD EMAIL VARCHAR(30);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+------------+---------------------------------------------------+------+-----+---------+-------+
| Field      | Type                                              | Null | Key | Default | Extra |
+------------+---------------------------------------------------+------+-----+---------+-------+
| EMPID      | int                                               | YES  |     | NULL    |       |
| AGE        | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
| GENDER     | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
| ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
| SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ        | date                                              | YES  |     | NULL    |       |
| EMAIL      | varchar(30)                                       | YES  |     | NULL    |       |
+------------+---------------------------------------------------+------+-----+---------+-------+
11 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF ADD PHONE_NUM INT;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+------------+---------------------------------------------------+------+-----+---------+-------+
| Field      | Type                                              | Null | Key | Default | Extra |
+------------+---------------------------------------------------+------+-----+---------+-------+
| EMPID      | int                                               | YES  |     | NULL    |       |
| AGE        | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
| GENDER     | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
| ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
| SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ        | date                                              | YES  |     | NULL    |       |
| EMAIL      | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM  | int                                               | YES  |     | NULL    |       |
+------------+---------------------------------------------------+------+-----+---------+-------+
12 rows in set (0.00 sec)

mysql> ALTER TABLE COMANY_STAFF ADD BONOUS DECIMAL(10,3);
ERROR 1146 (42S02): Table 'da.comany_staff' doesn't exist
mysql> ALTER TABLE COMPANY_STAFF ADD BONOUS DECIMAL(10,3);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+------------+---------------------------------------------------+------+-----+---------+-------+
| Field      | Type                                              | Null | Key | Default | Extra |
+------------+---------------------------------------------------+------+-----+---------+-------+
| EMPID      | int                                               | YES  |     | NULL    |       |
| AGE        | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
| GENDER     | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
| ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
| SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ        | date                                              | YES  |     | NULL    |       |
| EMAIL      | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM  | int                                               | YES  |     | NULL    |       |
| BONOUS     | decimal(10,3)                                     | YES  |     | NULL    |       |
+------------+---------------------------------------------------+------+-----+---------+-------+
13 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF ADD STATUS VARCHAR(30);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+------------+---------------------------------------------------+------+-----+---------+-------+
| Field      | Type                                              | Null | Key | Default | Extra |
+------------+---------------------------------------------------+------+-----+---------+-------+
| EMPID      | int                                               | YES  |     | NULL    |       |
| AGE        | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
| GENDER     | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
| ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
| SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ        | date                                              | YES  |     | NULL    |       |
| EMAIL      | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM  | int                                               | YES  |     | NULL    |       |
| BONOUS     | decimal(10,3)                                     | YES  |     | NULL    |       |
| STATUS     | varchar(30)                                       | YES  |     | NULL    |       |
+------------+---------------------------------------------------+------+-----+---------+-------+
14 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF ADD COMPANY_NAME VARCHAR(20) FIRST;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+--------------+---------------------------------------------------+------+-----+---------+-------+
| Field        | Type                                              | Null | Key | Default | Extra |
+--------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID        | int                                               | YES  |     | NULL    |       |
| AGE          | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE   | smallint                                          | YES  |     | NULL    |       |
| GENDER       | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME     | varchar(50)                                       | YES  |     | NULL    |       |
| ADDRESS      | tinytext                                          | YES  |     | NULL    |       |
| SALARY       | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT         | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS       | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ          | date                                              | YES  |     | NULL    |       |
| EMAIL        | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM    | int                                               | YES  |     | NULL    |       |
| BONOUS       | decimal(10,3)                                     | YES  |     | NULL    |       |
| STATUS       | varchar(30)                                       | YES  |     | NULL    |       |
+--------------+---------------------------------------------------+------+-----+---------+-------+
15 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF ADD QUALIFICATION VARCHAR(20) AFTER EMP_NAME;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+---------------+---------------------------------------------------+------+-----+---------+-------+
| Field         | Type                                              | Null | Key | Default | Extra |
+---------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID         | int                                               | YES  |     | NULL    |       |
| AGE           | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
| GENDER        | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME      | varchar(50)                                       | YES  |     | NULL    |       |
| QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
| SALARY        | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ           | date                                              | YES  |     | NULL    |       |
| EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM     | int                                               | YES  |     | NULL    |       |
| BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
| STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
+---------------+---------------------------------------------------+------+-----+---------+-------+
16 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF MODIFY EMP_NAME VARCHAR(70);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+---------------+---------------------------------------------------+------+-----+---------+-------+
| Field         | Type                                              | Null | Key | Default | Extra |
+---------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID         | int                                               | YES  |     | NULL    |       |
| AGE           | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
| GENDER        | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME      | varchar(70)                                       | YES  |     | NULL    |       |
| QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
| SALARY        | decimal(10,2)                                     | YES  |     | NULL    |       |
| DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ           | date                                              | YES  |     | NULL    |       |
| EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM     | int                                               | YES  |     | NULL    |       |
| BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
| STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
+---------------+---------------------------------------------------+------+-----+---------+-------+
16 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF MODIFY SALARY DECIMAL(10,4);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+---------------+---------------------------------------------------+------+-----+---------+-------+
| Field         | Type                                              | Null | Key | Default | Extra |
+---------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID         | int                                               | YES  |     | NULL    |       |
| AGE           | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
| GENDER        | char(1)                                           | YES  |     | NULL    |       |
| EMP_NAME      | varchar(70)                                       | YES  |     | NULL    |       |
| QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
| SALARY        | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ           | date                                              | YES  |     | NULL    |       |
| EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM     | int                                               | YES  |     | NULL    |       |
| BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
| STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
+---------------+---------------------------------------------------+------+-----+---------+-------+
16 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF CHANGE COLUMN EMP_NAME EMPLOYEE_NAME VARCHAR(60);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+---------------+---------------------------------------------------+------+-----+---------+-------+
| Field         | Type                                              | Null | Key | Default | Extra |
+---------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID         | int                                               | YES  |     | NULL    |       |
| AGE           | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
| GENDER        | char(1)                                           | YES  |     | NULL    |       |
| EMPLOYEE_NAME | varchar(60)                                       | YES  |     | NULL    |       |
| QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
| SALARY        | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOJ           | date                                              | YES  |     | NULL    |       |
| EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM     | int                                               | YES  |     | NULL    |       |
| BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
| STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
+---------------+---------------------------------------------------+------+-----+---------+-------+
16 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF CHANGE DOJ DATE_OF_JOINING;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> ALTER TABLE COMPANY_STAFF CHANGE COLUMN DOJ DATE_OF_JOINING;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> ALTER TABLE COMPANY_STAFF CHANGE COLUMN DOJ DATE_OF_JOINING DATE;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| Field           | Type                                              | Null | Key | Default | Extra |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID           | int                                               | YES  |     | NULL    |       |
| AGE             | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
| GENDER          | char(1)                                           | YES  |     | NULL    |       |
| EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
| QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
| SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
| EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM       | int                                               | YES  |     | NULL    |       |
| BONOUS          | decimal(10,3)                                     | YES  |     | NULL    |       |
| STATUS          | varchar(30)                                       | YES  |     | NULL    |       |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
16 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN BONUS;
ERROR 1091 (42000): Can't DROP 'BONUS'; check that column/key exists
mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN BONOUS;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| Field           | Type                                              | Null | Key | Default | Extra |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID           | int                                               | YES  |     | NULL    |       |
| AGE             | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
| GENDER          | char(1)                                           | YES  |     | NULL    |       |
| EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
| QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
| SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
| EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
| PHONE_NUM       | int                                               | YES  |     | NULL    |       |
| STATUS          | varchar(30)                                       | YES  |     | NULL    |       |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
15 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN PHONE_NUM;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| Field           | Type                                              | Null | Key | Default | Extra |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID           | int                                               | YES  |     | NULL    |       |
| AGE             | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
| GENDER          | char(1)                                           | YES  |     | NULL    |       |
| EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
| QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
| SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
| EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
| STATUS          | varchar(30)                                       | YES  |     | NULL    |       |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
14 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN STATUS;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE COMPANY_STAFF ADD STATUS VARCHAR(20) AFTER DEPT;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| Field           | Type                                              | Null | Key | Default | Extra |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID           | int                                               | YES  |     | NULL    |       |
| AGE             | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
| GENDER          | char(1)                                           | YES  |     | NULL    |       |
| EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
| QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
| SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| STATUS          | varchar(20)                                       | YES  |     | NULL    |       |
| SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
| EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
14 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF TO STAFF_RECORDS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TO STAFF_RECORDS' at line 1
mysql> ALTER TABLE COMPANY_STAFF RENAME TO STAFF_RECORDS;
Query OK, 0 rows affected (0.07 sec)

mysql> SHOW TABLES;
+---------------+
| Tables_in_da  |
+---------------+
| employee      |
| staff_records |
+---------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE STAFF_RECORDS RENAME TO COMPANY_STAFF;
Query OK, 0 rows affected (0.06 sec)

mysql> SHOW TABLES;
+---------------+
| Tables_in_da  |
+---------------+
| company_staff |
| employee      |
+---------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF ADD DATE_OF_JOINING DATE AFTER SKILLS;
ERROR 1060 (42S21): Duplicate column name 'DATE_OF_JOINING'
mysql> ALTER TABLE COMPANY_STAFF ADD DOF DATE AFTER SKILLS;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| Field           | Type                                              | Null | Key | Default | Extra |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID           | int                                               | YES  |     | NULL    |       |
| AGE             | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
| GENDER          | char(1)                                           | YES  |     | NULL    |       |
| EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
| QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
| SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| STATUS          | varchar(20)                                       | YES  |     | NULL    |       |
| SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DOF             | date                                              | YES  |     | NULL    |       |
| DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
| EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
15 rows in set (0.00 sec)

mysql> ALTER TABLE COMPANY_STAFF DROP DOF;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC COMPANY_STAFF;
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| Field           | Type                                              | Null | Key | Default | Extra |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
| COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
| EMPID           | int                                               | YES  |     | NULL    |       |
| AGE             | tinytext                                          | YES  |     | NULL    |       |
| EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
| GENDER          | char(1)                                           | YES  |     | NULL    |       |
| EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
| QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
| ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
| SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
| DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
| STATUS          | varchar(20)                                       | YES  |     | NULL    |       |
| SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
| DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
| EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
+-----------------+---------------------------------------------------+------+-----+---------+-------+
14 rows in set (0.00 sec)

mysql> Terminal close -- exit!mysql> use pfs3;
Database changed
mysql> mysql> DESC COMPANY_STAFF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql> DESC COMPANY_STAFF' at line 1
mysql> +------------+---------------------------------------------------+------+-----+---------+-------+
    -> | Field      | Type                                              | Null | Key | Default | Extra |
    -> +------------+---------------------------------------------------+------+-----+---------+-------+
    -> | EMPID      | int                                               | YES  |     | NULL    |       |
    -> | AGE        | tinytext                                          | YES  |     | NULL    |       |
    -> | EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
    -> | GENDER     | char(1)                                           | YES  |     | NULL    |       |
    -> | EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
    -> | ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
    -> | SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
    -> | DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    -> | SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    -> | DOJ        | date                                              | YES  |     | NULL    |       |
    -> | EMAIL      | varchar(30)                                       | YES  |     | NULL    |       |
    -> | PHONE_NUM  | int                                               | YES  |     | NULL    |       |
    -> +------------+---------------------------------------------------+------+-----+---------+-------+
    -> 12 rows in set (0.00 sec)
    -> 
    -> mysql> ALTER TABLE COMANY_STAFF ADD BONOUS DECIMAL(10,3);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+------------+---------------------------------------------------+------+-----+-' at line 1
mysql> ERROR 1146 (42S02): Table 'da.comany_staff' doesn't exist
    '> mysql> ALTER TABLE COMPANY_STAFF ADD BONOUS DECIMAL(10,3);
    '> Query OK, 0 rows affected (0.10 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field      | Type                                              | Null | Key | Default | Extra |
    '> +------------+---------------------------------------------------+------+-----+---------+-------+
    '> | EMPID      | int                                               | YES  |     | NULL    |       |
    '> | AGE        | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER     | char(1)                                           | YES  |     | NULL    |       |
    '> | EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
    '> | ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
    '> | DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DOJ        | date                                              | YES  |     | NULL    |       |
    '> | EMAIL      | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM  | int                                               | YES  |     | NULL    |       |
    '> | BONOUS     | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> +------------+---------------------------------------------------+------+-----+---------+-------+
    '> 13 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF ADD STATUS VARCHAR(30);
    '> Query OK, 0 rows affected (0.11 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field      | Type                                              | Null | Key | Default | Extra |
    '> +------------+---------------------------------------------------+------+-----+---------+-------+
    '> | EMPID      | int                                               | YES  |     | NULL    |       |
    '> | AGE        | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER     | char(1)                                           | YES  |     | NULL    |       |
    '> | EMP_NAME   | varchar(50)                                       | YES  |     | NULL    |       |
    '> | ADDRESS    | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY     | decimal(10,2)                                     | YES  |     | NULL    |       |
    '> | DEPT       | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS     | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DOJ        | date                                              | YES  |     | NULL    |       |
    '> | EMAIL      | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM  | int                                               | YES  |     | NULL    |       |
    '> | BONOUS     | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> | STATUS     | varchar(30)                                       | YES  |     | NULL    |       |
    '> +------------+---------------------------------------------------+------+-----+---------+-------+
    '> 14 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF ADD COMPANY_NAME VARCHAR(20) FIRST;
    '> Query OK, 0 rows affected (0.08 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +--------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field        | Type                                              | Null | Key | Default | Extra |
    '> +--------------+---------------------------------------------------+------+-----+---------+-------+
    '> | COMPANY_NAME | varchar(20)                                       | YES  |     | NULL    |       |
    '> | EMPID        | int                                               | YES  |     | NULL    |       |
    '> | AGE          | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE   | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER       | char(1)                                           | YES  |     | NULL    |       |
    '> | EMP_NAME     | varchar(50)                                       | YES  |     | NULL    |       |
    '> | ADDRESS      | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY       | decimal(10,2)                                     | YES  |     | NULL    |       |
    '> | DEPT         | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS       | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DOJ          | date                                              | YES  |     | NULL    |       |
    '> | EMAIL        | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM    | int                                               | YES  |     | NULL    |       |
    '> | BONOUS       | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> | STATUS       | varchar(30)                                       | YES  |     | NULL    |       |
    '> +--------------+---------------------------------------------------+------+-----+---------+-------+
    '> 15 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF ADD QUALIFICATION VARCHAR(20) AFTER EMP_NAME;
    '> Query OK, 0 rows affected (0.10 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field         | Type                                              | Null | Key | Default | Extra |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
    '> | EMPID         | int                                               | YES  |     | NULL    |       |
    '> | AGE           | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER        | char(1)                                           | YES  |     | NULL    |       |
    '> | EMP_NAME      | varchar(50)                                       | YES  |     | NULL    |       |
    '> | QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
    '> | ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY        | decimal(10,2)                                     | YES  |     | NULL    |       |
    '> | DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DOJ           | date                                              | YES  |     | NULL    |       |
    '> | EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM     | int                                               | YES  |     | NULL    |       |
    '> | BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> | STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> 16 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF MODIFY EMP_NAME VARCHAR(70);
    '> Query OK, 0 rows affected (0.12 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field         | Type                                              | Null | Key | Default | Extra |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
    '> | EMPID         | int                                               | YES  |     | NULL    |       |
    '> | AGE           | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER        | char(1)                                           | YES  |     | NULL    |       |
    '> | EMP_NAME      | varchar(70)                                       | YES  |     | NULL    |       |
    '> | QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
    '> | ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY        | decimal(10,2)                                     | YES  |     | NULL    |       |
    '> | DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DOJ           | date                                              | YES  |     | NULL    |       |
    '> | EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM     | int                                               | YES  |     | NULL    |       |
    '> | BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> | STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> 16 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF MODIFY SALARY DECIMAL(10,4);
    '> Query OK, 0 rows affected (0.12 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field         | Type                                              | Null | Key | Default | Extra |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
    '> | EMPID         | int                                               | YES  |     | NULL    |       |
    '> | AGE           | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER        | char(1)                                           | YES  |     | NULL    |       |
    '> | EMP_NAME      | varchar(70)                                       | YES  |     | NULL    |       |
    '> | QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
    '> | ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY        | decimal(10,4)                                     | YES  |     | NULL    |       |
    '> | DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DOJ           | date                                              | YES  |     | NULL    |       |
    '> | EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM     | int                                               | YES  |     | NULL    |       |
    '> | BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> | STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> 16 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF CHANGE COLUMN EMP_NAME EMPLOYEE_NAME VARCHAR(60);
    '> Query OK, 0 rows affected (0.12 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field         | Type                                              | Null | Key | Default | Extra |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> | COMPANY_NAME  | varchar(20)                                       | YES  |     | NULL    |       |
    '> | EMPID         | int                                               | YES  |     | NULL    |       |
    '> | AGE           | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE    | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER        | char(1)                                           | YES  |     | NULL    |       |
    '> | EMPLOYEE_NAME | varchar(60)                                       | YES  |     | NULL    |       |
    '> | QUALIFICATION | varchar(20)                                       | YES  |     | NULL    |       |
    '> | ADDRESS       | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY        | decimal(10,4)                                     | YES  |     | NULL    |       |
    '> | DEPT          | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS        | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DOJ           | date                                              | YES  |     | NULL    |       |
    '> | EMAIL         | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM     | int                                               | YES  |     | NULL    |       |
    '> | BONOUS        | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> | STATUS        | varchar(30)                                       | YES  |     | NULL    |       |
    '> +---------------+---------------------------------------------------+------+-----+---------+-------+
    '> 16 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF CHANGE DOJ DATE_OF_JOINING;
    '> ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
    '> mysql> ALTER TABLE COMPANY_STAFF CHANGE COLUMN DOJ DATE_OF_JOINING;
    '> ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
    '> mysql> ALTER TABLE COMPANY_STAFF CHANGE COLUMN DOJ DATE_OF_JOINING DATE;
    '> Query OK, 0 rows affected (0.06 sec)
    '> Records: 0  Duplicates: 0  Warnings: 0
    '> 
    '> mysql> DESC COMPANY_STAFF;
    '> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    '> | Field           | Type                                              | Null | Key | Default | Extra |
    '> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    '> | COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
    '> | EMPID           | int                                               | YES  |     | NULL    |       |
    '> | AGE             | tinytext                                          | YES  |     | NULL    |       |
    '> | EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
    '> | GENDER          | char(1)                                           | YES  |     | NULL    |       |
    '> | EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
    '> | QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
    '> | ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
    '> | SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
    '> | DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    '> | SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    '> | DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
    '> | EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
    '> | PHONE_NUM       | int                                               | YES  |     | NULL    |       |
    '> | BONOUS          | decimal(10,3)                                     | YES  |     | NULL    |       |
    '> | STATUS          | varchar(30)                                       | YES  |     | NULL    |       |
    '> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    '> 16 rows in set (0.00 sec)
    '> 
    '> mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN BONUS;
    '> ERROR 1091 (42000): Can't DROP 'BONUS'; check that column/key exists
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERROR 1146 (42S02): Table 'da.comany_staff' doesn't exist
mysql> ALTER TABLE COM' at line 1
    -> mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN BONOUS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'that column/key exists
mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN BONOUS' at line 1
mysql> Query OK, 0 rows affected (0.10 sec)
    -> Records: 0  Duplicates: 0  Warnings: 0
    -> 
    -> mysql> DESC COMPANY_STAFF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mys' at line 1
mysql> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | Field           | Type                                              | Null | Key | Default | Extra |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
    -> | EMPID           | int                                               | YES  |     | NULL    |       |
    -> | AGE             | tinytext                                          | YES  |     | NULL    |       |
    -> | EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
    -> | GENDER          | char(1)                                           | YES  |     | NULL    |       |
    -> | EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
    -> | QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
    -> | ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
    -> | SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
    -> | DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    -> | SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    -> | DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
    -> | EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
    -> | PHONE_NUM       | int                                               | YES  |     | NULL    |       |
    -> | STATUS          | varchar(30)                                       | YES  |     | NULL    |       |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> 15 rows in set (0.00 sec)
    -> 
    -> mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN PHONE_NUM;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+-----------------+---------------------------------------------------+------+--' at line 1
mysql> Query OK, 0 rows affected (0.08 sec)
    -> Records: 0  Duplicates: 0  Warnings: 0
    -> 
    -> mysql> DESC COMPANY_STAFF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mys' at line 1
mysql> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | Field           | Type                                              | Null | Key | Default | Extra |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
    -> | EMPID           | int                                               | YES  |     | NULL    |       |
    -> | AGE             | tinytext                                          | YES  |     | NULL    |       |
    -> | EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
    -> | GENDER          | char(1)                                           | YES  |     | NULL    |       |
    -> | EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
    -> | QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
    -> | ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
    -> | SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
    -> | DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    -> | SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    -> | DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
    -> | EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
    -> | STATUS          | varchar(30)                                       | YES  |     | NULL    |       |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> 14 rows in set (0.00 sec)
    -> 
    -> mysql> ALTER TABLE COMPANY_STAFF DROP COLUMN STATUS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+-----------------+---------------------------------------------------+------+--' at line 1
mysql> Query OK, 0 rows affected (0.10 sec)
    -> Records: 0  Duplicates: 0  Warnings: 0
    -> 
    -> mysql> ALTER TABLE COMPANY_STAFF ADD STATUS VARCHAR(20) AFTER DEPT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mys' at line 1
mysql> Query OK, 0 rows affected (0.10 sec)
    -> Records: 0  Duplicates: 0  Warnings: 0
    -> 
    -> mysql> DESC COMPANY_STAFF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mys' at line 1
mysql> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | Field           | Type                                              | Null | Key | Default | Extra |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
    -> | EMPID           | int                                               | YES  |     | NULL    |       |
    -> | AGE             | tinytext                                          | YES  |     | NULL    |       |
    -> | EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
    -> | GENDER          | char(1)                                           | YES  |     | NULL    |       |
    -> | EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
    -> | QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
    -> | ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
    -> | SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
    -> | DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    -> | STATUS          | varchar(20)                                       | YES  |     | NULL    |       |
    -> | SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    -> | DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
    -> | EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> 14 rows in set (0.00 sec)
    -> 
    -> mysql> ALTER TABLE COMPANY_STAFF TO STAFF_RECORDS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+-----------------+---------------------------------------------------+------+--' at line 1
mysql> ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TO STAFF_RECORDS' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERROR 1064 (42000): You have an error in your SQL syntax' at line 1
    -> mysql> ALTER TABLE COMPANY_STAFF RENAME TO STAFF_RECORDS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'the manual that corresponds to your MySQL server version for the right syntax to' at line 1
mysql> Query OK, 0 rows affected (0.07 sec)
    -> 
    -> mysql> SHOW TABLES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.07 sec)

mysql> SHOW TABLES' at line 1
mysql> +---------------+
    -> | Tables_in_da  |
    -> +---------------+
    -> | employee      |
    -> | staff_records |
    -> +---------------+
    -> 2 rows in set (0.00 sec)
    -> 
    -> mysql> ALTER TABLE STAFF_RECORDS RENAME TO COMPANY_STAFF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+---------------+
| Tables_in_da  |
+---------------+
| employee      |
| staff_' at line 1
mysql> Query OK, 0 rows affected (0.06 sec)
    -> 
    -> mysql> SHOW TABLES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.06 sec)

mysql> SHOW TABLES' at line 1
mysql> +---------------+
    -> | Tables_in_da  |
    -> +---------------+
    -> | company_staff |
    -> | employee      |
    -> +---------------+
    -> 2 rows in set (0.00 sec)
    -> 
    -> mysql> ALTER TABLE COMPANY_STAFF ADD DATE_OF_JOINING DATE AFTER SKILLS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+---------------+
| Tables_in_da  |
+---------------+
| company_staff |
| employ' at line 1
mysql> ERROR 1060 (42S21): Duplicate column name 'DATE_OF_JOINING'
    -> mysql> ALTER TABLE COMPANY_STAFF ADD DOF DATE AFTER SKILLS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERROR 1060 (42S21): Duplicate column name 'DATE_OF_JOINING'
mysql> ALTER TABLE C' at line 1
mysql> Query OK, 0 rows affected (0.10 sec)
    -> Records: 0  Duplicates: 0  Warnings: 0
    -> 
    -> mysql> DESC COMPANY_STAFF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mys' at line 1
mysql> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | Field           | Type                                              | Null | Key | Default | Extra |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
    -> | EMPID           | int                                               | YES  |     | NULL    |       |
    -> | AGE             | tinytext                                          | YES  |     | NULL    |       |
    -> | EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
    -> | GENDER          | char(1)                                           | YES  |     | NULL    |       |
    -> | EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
    -> | QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
    -> | ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
    -> | SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
    -> | DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    -> | STATUS          | varchar(20)                                       | YES  |     | NULL    |       |
    -> | SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    -> | DOF             | date                                              | YES  |     | NULL    |       |
    -> | DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
    -> | EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> 15 rows in set (0.00 sec)
    -> 
    -> mysql> ALTER TABLE COMPANY_STAFF DROP DOF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+-----------------+---------------------------------------------------+------+--' at line 1
mysql> Query OK, 0 rows affected (0.07 sec)
    -> Records: 0  Duplicates: 0  Warnings: 0
    -> 
    -> mysql> DESC COMPANY_STAFF;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mys' at line 1
mysql> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | Field           | Type                                              | Null | Key | Default | Extra |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> | COMPANY_NAME    | varchar(20)                                       | YES  |     | NULL    |       |
    -> | EMPID           | int                                               | YES  |     | NULL    |       |
    -> | AGE             | tinytext                                          | YES  |     | NULL    |       |
    -> | EXPERIENCE      | smallint                                          | YES  |     | NULL    |       |
    -> | GENDER          | char(1)                                           | YES  |     | NULL    |       |
    -> | EMPLOYEE_NAME   | varchar(60)                                       | YES  |     | NULL    |       |
    -> | QUALIFICATION   | varchar(20)                                       | YES  |     | NULL    |       |
    -> | ADDRESS         | tinytext                                          | YES  |     | NULL    |       |
    -> | SALARY          | decimal(10,4)                                     | YES  |     | NULL    |       |
    -> | DEPT            | enum('HR','IT','SALES','FINANCE','SUPPORT')       | YES  |     | NULL    |       |
    -> | STATUS          | varchar(20)                                       | YES  |     | NULL    |       |
    -> | SKILLS          | set('JAVA','PYTHON','SQL','EXCEL','COMUNICATION') | YES  |     | NULL    |       |
    -> | DATE_OF_JOINING | date                                              | YES  |     | NULL    |       |
    -> | EMAIL           | varchar(30)                                       | YES  |     | NULL    |       |
    -> +-----------------+---------------------------------------------------+------+-----+---------+-------+
    -> 14 rows in set (0.00 sec)
    -> 
    -> ^c
    -> exit
    -> Terminal close -- exit!
