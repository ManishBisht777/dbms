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
--17 query to display Name, Hire Date,  ans salary review date while is the 1st monday after six month of emloyeement
Select
  ename.hite date,
  adddata(
    six month
    after,
      mod(
        9 - dayofweek(
          six month
          after
        ),
        7
      )
  ) as salary review_date
from
  (
    select
      ename,
      hote date,
      date(
        (
          period_add(
            extract(
              year_month
              from
                hire_date
            ) * 100
          ) + 1
        ) as six_month_after employe
      ) a;
--18 query to display name and calculate the numbe of months between today  and the date on which employee was hired of department "sales";
    Select
      e_name,
      timestampdiff(
        month,
        hire_date,
        currdate() as number_of_months
        from
          employee e,
          department d
        where
          e.dno = d.dno
          and dname = "sales";
--19 Query to display the following for each employee <E-Name> earns < Salary> monthly but wants < 3 * Current Salary >. Label the Column as Dream Salary.
        Select
          concat (
            enmae,
            "ears",
            salary,
            "monthly but wants",(3 * salary)
          ) as "Dream salary"
        from
          employee;
--20. Query to display Name with the 1st letter capitalized and all other letter lower case and length of their name of all the employees whose name starts with ‘J’, ’A’ and ‘M’.
        Select
          concat(UCASE (LEFT(ename, 1)), lower(SUBSTRING(enmae, 2))) as Name,
          length(ename)
        from
          employee
        where
          ename like "j%"
          or ename like "n%" --21 Query to display Name, Hire Date and Day of the week on which the employee started.
        Select
          ename,
          dayname(hire_date),
          dayofweek(hire_date)
        from
          employee;
--22 Query to display Name, Department Name and Department No for all the employees
        select
          ename,
          dname,
          e.dno
        from
          employee e.dapertment d
        where
          e.dno = d.dno;
--23 Query to display Unique Listing of all Jobs that are in Department number 30.
        Select
          distinct (job_type)
        from
          employee
        where
          dno = 30;
--24 Query to display Name, Dept Name of all employees who have an ‘A’ in their name
        Select
          ename,
          dname
        from
          employee e.department d
        where
          e.dno = d.dno
          and ename like "%a%";
--25 Query to display Name, Job, Department No. And Department Name for all the employees working at the Dallas location.
        Select
          ename,
          job_type,
          dname
        from
          employee e.department d
        where
          e.dno = d.dno
          and location = "dallas";
--26  . Query to display Name and Employee no. Along with their supervisor’s Name and the supervisor’s employee no; along with the Employees’ Name who do not have a supervisor.
        Select
          e1.ename,
          e1.eno,
          e1.supervisioneno,
          e2.ename
        from
          employee e1,
          employee e2
        where
          e1.supervisioneno = e2.eno
          or(
            e1.supervisioneno is null
            and e2.supervisioneno is null
          );
--27 . Query to display Name, Dept No. And Salary of any employee whose department No. and salary matches both the department no. And the salary of any employee who earns a commission.
        Select
          e1.ename,
          e1.dno,
          e1.salary,
          e2.ename
        from
          employee e1,
          employee e2
        where
          e1.eno != e2.eno
          and e1.dno = e2.dno
          and e1.salary = e2.salary --28 Query to display Name and Salaries represented by asterisks, where each asterisk (*) signifies $100.
        Select
          ename,
          repeat("* ", salary / 100) as "*=$100"
        from
          employee;
--29 Query to display the Highest, Lowest, Sum and Average Salaries of all the employees
        Select
          mas(salary) as highest,
          min(salary) as lowest,
          sum(salary) as sum,
          avg(salary) as average
        from
          employee;
--30 . Query to display the number of employees performing the same Job type functions.
        Select
          job_type,
          count(*) as no_of_employee
        from
          employee
        group by
          job_type;
--31 Query to display the total number of supervisors without listing their names
        Select
          count(*) as no_of_supervisor
        from
          employee
        where
          eno in (
            select
              supervisioneno
            from
              employee
          );
--32 Query to display the Department Name, Location Name, No. of Employees and the average salary for all employees in that department.
        Select
          dname,
          location,
          count(*) as no_of_employee,
          avg { salary
      ) as average_salary
    from
      employee e,
      department d
    where
      e.dno = d.dno
    group by
      dname;
--33 . Query to display Name and Hire Date for all employees in the same dept. as Blake.
    Select
      ename,
      hire_date
    from
      employee
    where
      dno in (
        select
          dno
        from
          employee
        where
          ename = "blake"
      );
--34 . Query to display the Employee No. And Name for all employees who earn more than the average salary
    Select
      eno,
      ename
    from
      employee
    where
      salary > (
        selct avg(salary)
        from
          employee
      );
--35 Query to display Employee Number and Name for all employees who work in a department with any employee whose name contains a ‘T’.
    Select
      eno,
      ename
    from
      employee
    where
      dno in (
        select
          dno
        from
          employee
        where
          ename like "%t%"
      );
--36 . Query to display the names and salaries of all employees who report to supervisor named ‘King’
    Select
      ename,
      salary
    from
      employee
    where
      supervisioneno =(
        select
          eno
        from
          employee
        where
          ename = "king"
      );
--37 Query to display the department no, name and job for all employees in the Sales department
    Select
      e.dno,
      ename,
      job_type
    from
      employee e.department d
    where
      e.dno = d.no
      and d.dno =(
        select
          dno
        from
          department
        where
          dname = "sales"
      );
--38 Display names of employees along with their department name who have more than 20 years’ experience
    Select
      e.ename,
      d.dname
    from
      employee e.department d
    where
      e.dno = d.dno
      and timestampdiff(year, hire_date, currdate()) > 20;
--39 Display total number of departments at each location
    Select
      location,
      count(*)
    from
      department
    group by
      location;
--40 Find the department name in which at least 5 employees work in.
    Select
      dnmae
    from
      department
    where
      dno in (
        select
          dno
        from
          employee
        group by
          dno
        having
          count(*) > 5
      );
--41   Query to find the employee’ name who is not supervisor and name of supervisor supervising more than 3 employees.
    Select
      ename
    from
      employee
    where
      eno in (
        select
          supervisioneno
        from
          employee
        where
          supervisioneno is not null
        group by
          supervisioneno
        having
          count(*) > 3
      )
      or eno not in (
        select
          supervisioneno
        from
          employee
        where
          supervisioneno is not null
        group by
          supervisioneno
      );
--42. Query to display the job type with maximum and minimum employees
    Select
      job_type
    from
      employee
    group by
      job_type
    having
      count(*) =(
        select
          max(mycount)
        from
          (
            select
              count(*) as mycount
            from
              employee
            group by
              job_type ot count * = (
                select
                  min(mycount)
                from
                  (
                    select
                      count * as mycount
                    from
                      emoployee
                    group by
                      job_type
                  ) a
              );