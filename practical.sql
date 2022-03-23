CREATE DATABASE `practicaldb`;
-- Create table employee
CREATE TABLE `employee` (
  `eno` CHAR(3) NOT NULL,
  `edname` VARCHAR(50) NOT NULL,
  `job_type` VARCHAR(50) NOT NULL,
  `hire_date` DATE NOT NULL,
  `supervisionENO` VARCHAR(50),
  `dno` INT,
  `commission` DECIMAL(65),
  `salary` DECIMAL(65) NOT NULL,
  PRIMARY KEY (`eno`),
  FOREIGN KEY (`dno`) REFERENCES `department`(`dno`)
);
-- Create data into department table
CREATE TABLE `department` (
  `dno` INT NOT NULL,
  `dname` VARCHAR(50),
  `location` VARCHAR(50) DEFAULT 'New Delhi',
  PRIMARY KEY (`dno`)
);
-- INSERT data into employee table
INSERT INTO
  employee
VALUES(
    101,
    'manish2',
    'manager',
    '2021-10-01',
    101,
    10,
    10000,
    10000000
  );
-- INSERT INTO department
INSERT INTO
  department
VALUES(10, 'manishBisht', 'Mexico');
-- 1. Query to display Employee Name, Job, Hire Date, Employee Number; for each employee with the Employee Number appearing first.
select
  edname,
  job_type,
  hire_date,
  eno
FROM
  employee;
-- 2. Query to display unique Jobs from the Employee Table.
select
  distinct(job_type)
from
  employee;
-- 3. Query to display the Employee Name concatenated by a Job separated by a comma
select
  concat(edname, ',', job_type) as seperate_jobs
from
  employee;
-- 4. Query to display all the data from the Employee Table. Separate each Column by a command name the said column as THE_OUTPUT.
select
  concat(
    eno,
    ",",
    edname,
    ",",
    job_type,
    ",",
    supervisionENO,
    ",",
    hire_date,
    ",",
    dno,
    ",",
    commission,
    ",",
    salary
  ) as THE_OUTPUT
from
  employee;
-- 5. Query to display the Employee Name and Salary of all the employees earning more than$2850.
select
  edname,
  salary
from
  employee
where
  salary > 2850;
-- 6. Query to display Employee Name and Department Number for the Employee No= 79.
select
  edname,
  dno
from
  employee
where
  eno = '79';
-- 7. Query to display Employee Name and Salary for all employees whose salary is not in the range of $1500 and $2850.
select
  edname,
  salary
from
  employee
where
  salary not between 1500
  and 2850;
-- 8. Query to display Employee Name and Department No. of all the employees in Dept 10 and Dept 30 in the alphabetical order by name.
select
  edname,
  dno
from
  employee
where
  dno in(10, 30)
order by
  edname;
-- 9. Query to display Name and Hire Date of every Employee who was hired in 1981.
select
  edname,
  hire_date
from
  employee
where
  hire_date like '1981%';
-- 10. Query to display Name and Job of all employees who have not assigned a supervisor
select
  edname,
  job_type
from
  employee
where
  supervisionENO is NULL;
-- 11. Query to display the Name, Salary and Commission for all the employees who earn commission.
select
  edname,
  salary,
  commission
from
  employee
where
  commission is not null;
-- 12. Sort the data in descending order of Salary and Commission
select
  *
from
  employee
order by
  salary
  and commission desc;
-- 13. Query to display Name of all the employees where the third letter of their name is ‘A’.
select
  edname
from
  employee
where
  edname like '__A%';
-- 14. Query to display Name of all employees either have two ‘R’s or have two ‘A’s in their name and are either in Dept No = 30 or their Manger’s Employee No = 778.
select
  edname
from
  employee
where(
    edname like "%r%r%"
    or edname like "%a%a%"
  )
  and (
    dno = 30
    or supervisionENO = 778
  );
-- 15. Query to display Name, Salary and Commission for all employees whose Commission amount is greater than their Salary increased by 5%.
select
  edname,
  salary,
  commission
from
  employee
where(1.05 * salary) < commission;
-- 16. display currdate along with dayname
select
  curdate() as currentdate,
  dayname(curdate()) as currentday;