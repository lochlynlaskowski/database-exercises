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
 
 
 
 
 
 








