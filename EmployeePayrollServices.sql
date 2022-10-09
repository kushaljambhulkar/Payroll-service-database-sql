
UC 1
-Ability to create a payroll service database

create database payroll_service;

Query OK, 1 row affected (0.0142 sec)

show databases;

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

 use payroll_service;

 Default schema set to `payroll_service`.
Fetching table and column names from `payroll_service` for auto-completion... Press ^C to stop.

UC 2
-Ability to create a employee payroll table
in the payroll service database to
manage employee payrolls

create table employee_payroll(ID int auto_increment primary key, Name varchar(255),Salary float, StartDate date);
Query OK, 0 rows affected (0.0810 sec)

+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.0042 sec)

insert into employee_payroll(Name, Salary, StartDate) values("kushcool", 1550000.00, '2022-04-03'),("amit", 450000.00, '2022-05-14'),("Kiran", 45000.00, '2022-06-15'),("Sangita", 440000.00, '2022-07-15'),("Zoya", 650000.00, '2022-08-19');

desc employee_payroll;

+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| ID        | int          | NO   | PRI | NULL    | auto_increment |
| Name      | varchar(255) | YES  |     | NULL    |                |
| Salary    | float        | YES  |     | NULL    |                |
| StartDate | date         | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
4 rows in set (0.0047 sec)