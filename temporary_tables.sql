use employees;

CREATE TEMPORARY TABLE jemison_1751.employees_with_departments AS 
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

SELECT * FROM jemison_1751.employees_with_departments;

SHOW CREATE TABLE employees;

ALTER TABLE jemison_1751.employees_with_departments ADD full_name VARCHAR(31);

UPDATE jemison_1751.employees_with_departments
SET full_name = CONCAT(first_name, " ", last_name);

ALTER TABLE jemison_1751.employees_with_departments DROP COLUMN first_name;
ALTER TABLE jemison_1751.employees_with_departments DROP COLUMN last_name;

use sakila;

SHOW CREATE TABLE payment;

CREATE TEMPORARY TABLE jemison_1751.payment
SELECT *
FROM payment;

SELECT * FROM jemison_1751.payment;

ALTER TABLE jemison_1751.payment MODIFY COLUMN amount decimal(6,2);

UPDATE jemison_1751.payment SET amount = amount * 100;

ALTER TABLE jemison_1751.payment MODIFY COLUMN amount INT(4);

use employees;

SELECT AVG(salary) FROM salaries;

CREATE TEMPORARY TABLE jemison_1751.historical_salaries AS (
SELECT AVG(salary) AS avg_salary, STDDEV(salary) AS sd_salary
FROM salaries);

SELECT * FROM jemison_1751.historical_salaries;

SELECT dept_name, avg(salary) AS dept_current_avg_salary 
FROM salaries 
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > CURDATE()
AND salaries.to_date > CURDATE()
GROUP BY dept_name;

CREATE TEMPORARY TABLE jemison_1751.current_info AS (
SELECT dept_name, avg(salary) AS dept_current_avg_salary 
FROM salaries 
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > CURDATE()
AND salaries.to_date > CURDATE()
GROUP BY dept_name
);

SELECT * FROM jemison_1751.current_info;

ALTER TABLE jemison_1751.current_info ADD avg_salary FLOAT(10,2);
ALTER TABLE jemison_1751.current_info ADD sd_salary FLOAT(10,2);
ALTER TABLE jemison_1751.current_info ADD z_score FLOAT(10,2);

SELECT avg_salary FROM jemison_1751.historical_salaries;
SELECT sd_salary FROM jemison_1751.historical_salaries;

UPDATE jemison_1751.current_info
SET avg_salary = (SELECT avg_salary FROM jemison_1751.historical_salaries);

UPDATE jemison_1751.current_info
SET sd_salary = (SELECT sd_salary FROM jemison_1751.historical_salaries);

SELECT * FROM jemison_1751.current_info;

UPDATE jemison_1751.current_info
SET z_score = (dept_current_avg_salary - avg_salary) / (sd_salary);

SELECT * FROM jemison_1751.current_info
ORDER BY z_score DESC;















