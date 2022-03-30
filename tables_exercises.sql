use employees;
show tables;
describe employees;


-- Which table(s) do you think contain a numeric type column?
-- salaries

-- Which table(s) do you think contain a string type column? 
-- all tables within

-- Which table(s) do you think contain a date type column? 
-- dept_emp, dept_manager, employyes, salaries, titles

-- What is the relationship between the employees and the departments tables?


-- Show the SQL Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.

show create table employees;

-- 'CREATE TABLE `employees` (
--   `emp_no` int NOT NULL,
--   `birth_date` date NOT NULL,
--   `first_name` varchar(14) NOT NULL,
--   `last_name` varchar(16) NOT NULL,
--   `gender` enum(''M'',''F'') NOT NULL,
--   `hire_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1'
