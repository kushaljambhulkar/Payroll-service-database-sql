
UC 1
-Ability to create a payroll service database

create database payroll_service;

Query OK, 1 row affected (0.0142 sec)

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > show databases;

+--------------------+
| Database           |
+--------------------+
| fullstack          |
| information_schema |
| kushcool           |
| learn              |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+

  MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > use payroll_service;

 Default schema set to `payroll_service`.
Fetching table and column names from `payroll_service` for auto-completion... Press ^C to stop.

UC 2
-Ability to create a employee payroll table
in the payroll service database to
manage employee payrolls

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > create table employee_payroll(ID int auto_increment primary key, 
Name varchar(255),Salary float, StartDate date);
Query OK, 0 rows affected (0.0810 sec)

+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.0042 sec)

insert into employee_payroll(Name, Salary, StartDate) values("kushcool", 1550000.00, '2022-04-03'),
("amit", 450000.00, '2022-05-14'),("Kiran", 45000.00, '2022-06-15'),("Sangita", 440000.00, '2022-07-15'),
("Zoya", 650000.00, '2022-08-19');

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > desc employee_payroll;

+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| ID        | int          | NO   | PRI | NULL    | auto_increment |
| Name      | varchar(255) | YES  |     | NULL    |                |
| Salary    | float        | YES  |     | NULL    |                |
| StartDate | date         | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
4 rows in set (0.0047 sec)

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select * from employee_payroll;

+----+----------+---------+------------+
| ID | Name     | Salary  | StartDate  |
+----+----------+---------+------------+
|  1 | kushcool | 1550000 | 2022-04-03 |
|  2 | amit     |  450000 | 2022-05-14 |
|  3 | Kiran    |   45000 | 2022-06-15 |
|  4 | Sangita  |  440000 | 2022-07-15 |
|  5 | Zoya     |  650000 | 2022-08-19 |
+----+----------+---------+------------+
5 rows in set (0.0128 sec)

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select Salary from employee_payroll where Name="kushcool";

+---------+
| Salary  |
+---------+
| 1550000 |
+---------+
1 row in set (0.0390 sec)

  MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select * from employee_payroll where StartDate between cast('2022-06-15' as date)
 and DATE(now());

+----+---------+--------+------------+
| ID | Name    | Salary | StartDate  |
+----+---------+--------+------------+
|  3 | Kiran   |  45000 | 2022-06-15 |
|  4 | Sangita | 440000 | 2022-07-15 |
|  5 | Zoya    | 650000 | 2022-08-19 |
+----+---------+--------+------------+
3 rows in set (0.0440 sec)

-update the gender field in the table

update employee_payroll set gender= 'M' where Name = "kushcool" or Name = "amit", or Name = "Kiran";
update employee_payroll set gender= 'F' where Name = "Sangita" or Name = "Zoya";

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select * from employee_payroll;

+----+----------+--------+---------+------------+
| ID | Name     | gender | Salary  | StartDate  |
+----+----------+--------+---------+------------+
|  1 | kushcool | M      | 1550000 | 2022-04-03 |
|  2 | amit     | M      |  450000 | 2022-05-14 |
|  3 | Kiran    | M      |   45000 | 2022-06-15 |
|  4 | Sangita  | F      |  440000 | 2022-07-15 |
|  5 | Zoya     | F      |  650000 | 2022-08-19 |
+----+----------+--------+---------+------------+
5 rows in set (0.0010 sec)


-Ability to find Sum, Average, Min, Max and Number of male and female employees

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select sum(Salary), gender from employee_payroll group by gender;

+-------------+--------+
| sum(Salary) | gender |
+-------------+--------+
|     2045000 | M      |
|     1090000 | F      |
+-------------+--------+
2 rows in set (0.0429 sec)

  MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select avg(Salary), gender from employee_payroll group by gender;

+-------------------+--------+
| avg(Salary)       | gender |
+-------------------+--------+
| 681666.6666666666 | M      |
|            545000 | F      |
+-------------------+--------+
2 rows in set (0.0377 sec)

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select max(Salary), gender from employee_payroll group by Gender;

+-------------+--------+
| max(Salary) | gender |
+-------------+--------+
|     1550000 | M      |
|      650000 | F      |
+-------------+--------+
2 rows in set (0.0380 sec)

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select min(Salary), gender from employee_payroll group by Gender;
+-------------+--------+
| min(Salary) | gender |
+-------------+--------+
|       45000 | M      |
|      440000 | F      |
+-------------+--------+
2 rows in set (0.0011 sec)

 MySQL  127.0.0.1:33060+ ssl  payroll_service  SQL > select count(Name), gender from employee_payroll group by Gender;
+-------------+--------+
| count(Name) | gender |
+-------------+--------+
|           3 | M      |
|           2 | F      |
+-------------+--------+
2 rows in set (0.0008 sec)