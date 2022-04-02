use employees;

SELECT * FROM employees;

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 709 records returned

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya' 
OR first_name = 'Maya';

-- OR returned the same amount of records

SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE (first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya')
AND (gender = 'M');

-- 441 records returned

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE 'E%';

-- 7330 employees with the first letter of the last name E 

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE 'E%'
OR last_name
LIKE '%E';

-- 30723 employees that last name starts or ends with 'E' 

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE '%E';

-- 24292 employees last name ends with the letter 'E'

 SELECT emp_no, first_name, last_name, hire_date
 FROM employees
 WHERE YEAR(hire_date) 
 BETWEEN '1990'  AND  '1999';
 
 -- there are 1000 employees born in the 90s
 
 SELECT emp_no, first_name, last_name, hire_date
 FROM employees
 WHERE YEAR(hire_date) 
 BETWEEN '1990'  AND  '1999'
 AND (MONTH(hire_date) = 12)
 AND (DAY(hire_date) =25);
 
 -- there are 346 employees born on christmas in the 90s 
 
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE '%Q%';

-- there are 1873 employees with the letter Q in their last name

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE '%Q%'
'%QU%';
-- need to figure out how to exclude
 
 
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- in order by first_name the first result is Irena Reutenauer,
-- the last name was Vidya Simmen 
 
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- in order by last_name, first_name the first name is Irena Acton
-- the last name is Maya Zyda 

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name 
LIKE 'E%'
AND last_name
LIKE '%E'
ORDER BY emp_no;

-- the first entry is 10021 Ramzi Erde, the last entry is
-- 499648 Tadahior Erde - 899 rows returned

SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE last_name 
LIKE 'E%'
AND last_name
LIKE '%E'
ORDER BY hire_date DESC; 

-- the newest employee with last name starting with E and 
-- ending with E is Teiji Eldridge hire date 1999-11-27  
-- the oldest employee is Sergi Erde hired on 1985-02-02 (899 results)

 SELECT emp_no, first_name, last_name, hire_date
 FROM employees
 WHERE YEAR(hire_date) 
 BETWEEN '1990'  AND  '1999'
 AND (MONTH(hire_date) = 12)
 AND (DAY(hire_date) =25)
 ORDER BY hire_date, emp_no;
 
 -- 346 rows returned, oldest employee Yinghua Dredge
 -- newest employee Steve Strehl assuming employee number is indicative
 -- of time frame hired if the same hire date occured -- 346 results 

