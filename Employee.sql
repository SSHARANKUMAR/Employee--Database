create database employee;
use employee;
create table employee(employee_id int,first_name varchar(15),last_name varchar(5),salary int,joining_date varchar(20),department varchar(20),primary key (employee_id));
insert into employee(employee_id,first_name,last_name,salary,joining_date,department)values(1,'Venkatesh','S',10000,'08/28/2015','Banking'),
(2,'Ragul','P',75000,'08/28/2015','Business'),
(3,'Gopinath','C',50000,'03/02/2016','Pharma'),
(4,'Dinesh','G',50000,'03/02/2016','Insurence'),
(5,'Saibabu','E',40000,'07/08/2017','Software'),
(6,'Hasan','S',29000,'07/08/2017','Manufacturing'),
(7,'Divya','P',33000,'07/08/2016','Healthcare'),
(8,'Aravindan','R',40000,'07/08/2016','Healthcare'),
(9,'Sathish','MD',450000,'03/02/2016','Automobile'),
(10,'Prasanth','PKP',34000,'03/02/2016','Insurence'),
(11,'Vijay','R',25681,'03/02/2016','Business'),
(12,'Sivakumar','K',54789,'03/02/2016','Software');

select*from employee;

create table incentives(employee_ref_id int,incentive_date varchar(30),incentive_amount int, foreign key(employee_ref_id) references employee (employee_id));
insert into incentives(employee_ref_id,incentive_date,incentive_amount)values(1,'01-FEB-16',5000),
(2,'01-FEB-16',3000),
(3,'01-FEB-17',4000),
(1,'01-JAN-17',4500),
(2,'01-JAn-17',3500);

select*from incentives;

-- 1. get all employee datails from the employee table
select*from employee;

-- 2.get first_name,last_name from employee table
select first_name,last_name from employee;

-- 3.get first_name from employee table using alias name "employee name"
select first_name  Employee_Name from employee;

-- 4.get first_name from employee table in upper case
select upper(first_name) from employee;

-- 5.get first_name from employee table in lower case
Select lower(first_name) from employee;

-- 6.get unique Department from employee table
select distinct department from employee;

-- 7.select 3 char of first_name from employee
select substring(first_name,1,3) as first_name from employee;

-- 8.get position of 'a' in name 'raghul' from employee table
select position('a' in first_name) position_of_a_raghul from employee where employee_id=2;

-- 9.get first_name from employee table after removing white spaces from right side;
select rtrim(first_name) first_name from employee;



-- 10.get first_name from employee table after removing white spaces left side
select ltrim(first_name) first_name from employee;

-- 11.get length of first_name from employee
select length(first_name) length_of_a_first_name from employee;
 
-- 12.get first_name from employee table after replacing 'a' with'$'
select replace(first_name,"a","$") from employee;

-- 13.get first_name and last_name as single column from employee table separated by a '_'
select concat(first_name," ",last_name)full_name from employee;

-- 14. get first_name,joining year,joining monthamd joining date from employee table
select
    FIRST_NAME,
    SUBSTRING_INDEX(JOINING_DATE, '/', -1) AS JOINING_YEAR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(JOINING_DATE, '/', 2), '/', -1) AS JOINING_DATE,
    SUBSTRING_INDEX(JOINING_DATE, '/', 1) AS JOINING_MONTH
from
    Employee;
    
    -- 15.get all employee details from the employee table order by first_name ascending
    select*from employee order by first_name asc;
    
    -- 16.get all employee details from the employee table order by first_name desending
    select*from employee order by first_name desc;
    
    -- 17.get all employee deatils from the employee table order by first_name ascending and salary desending
    select* from employee order by first_name asc,salary desc;
    
    -- 18.get employe details from the employee table whose employee name is 'dinesh'
    select*from employee where first_name ='dinesh';
    
    -- 19.get employee details from the employee table whose employee name is 'dinesh'and 'roy'
    select*from employee where first_name='dinesh' or first_name='roy';
    
    -- 20.get employee details from the employee table whose employee name is not 'dinesh' and 'roy'
    select*from employee where first_name !='dinesh' or first_name !='roy';
    
    -- 21.get employee details from the employee table whose first_name starts with'S'
    select*from employee where first_name like'S%';
    
    -- 22.get employee details from the employee table whose first_name contains'v'
    select*from employee where first_name like'%V%';
    
    -- 23..get employee details from the employee table whose first_name ends with 'n'
     select*from employee where first_name like'%n';
     
     -- 24.get employee details from the employee table whose first_name ends with 'n'and name contains 4 letters
      select*from employee where first_name like'%n____';
      
      -- 25.get employee details from the employee table whose first_name startswith 'j'and name contains 4 letters
      select*from employee where first_name like'J____%';
      
      -- 26.get employee details from the employee table who's salary greater than 60000
     select*from employee where salary>60000;
     
     -- 27.get employee details from the employee table who's salary less than 80000
      select*from employee where salary<80000;
      
      -- 28. get employee details from the employee table who's salary between 50000 and 80000
       select*from employee where salary>50000 and salary<80000;
       
       -- 29. get employee details from the employee table who's name in venkatesh and ragavi
        select*from employee where first_name='venkatesh' or first_name='ragul';
        
        -- 30.get employee details from the employee table who's has '%' in last_name.tip:escape for special char in query
        select*from employee where last_name ='%';
        
        -- 31.get department and total salary with respect to dep in employee table 
        select department,sum(salary) as total_salary from employee group by department;
        
        -- 32 GET DEPARTMENT AND TOTAL SALARY WITH RESPECT TO DEPARTMENT IN EMPLOYEE TABLE IN DESENDING ORDER OF TOTAL SALARY 
select DEPARTMENT , sum(SALARY) AS TOTAL_SALARY from employee group by DEPARTMENT order by sum(SALARY) desc; 

-- 33 GET DEPARTMENT AND NUMBER EMPLOYEE IN DEPARTMENT AND TOTAL SALARY WITH RESPECT TO DEPARTMENT IN EMPLOYEE TABLE IN DESENDING ORDER OF TOTAL SALARY 
select DEPARTMENT , count(EMPLOYEE_ID),sum(SALARY) AS TOTAL_SALARY from employee group by DEPARTMENT order by sum(SALARY) desc;
        