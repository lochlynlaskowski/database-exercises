SELECT hire_date FROM employees 
WHERE emp_no = '101010';

SELECT first_name, last_name, hire_date
FROM employees
JOIN dept_emp AS de using (emp_no)
WHERE hire_date = (SELECT hire_date FROM employees 
WHERE emp_no = '101010')
AND de.to_date > CURDATE();

SELECT DISTINCT title, first_name
FROM employees 
JOIN titles AS t using (emp_no)
WHERE first_name = 'Aamod'
AND t.to_date > CURDATE();

SELECT COUNT(*) FROM employees
WHERE emp_no NOT IN
(SELECT emp_no FROM dept_emp
WHERE to_date > CURDATE());

-- 59,900

SELECT first_name, last_name, gender
FROM employees
JOIN dept_manager AS de USING (emp_no)
WHERE de.to_date > CURDATE()
AND gender = 'F';

-- Isamu Legietner, Karsten Sigstam, Leon DasSarma, Hilay Kambil

SELECT AVG(salary) AS average_salary FROM salaries;

SELECT COUNT(*)
FROM employees
JOIN salaries AS s USING(emp_no)
WHERE salary > (SELECT AVG(salary) AS average_salary FROM salaries)
AND s.to_date > CURDATE();

SELECT MAX(salary) FROM salaries WHERE to_date > CURDATE();

SELECT STDDEV(salary) FROM salaries WHERE to_date > CURDATE();

SELECT COUNT(*)
FROM salaries
WHERE to_date > CURDATE()
AND salary > (
(SELECT MAX(salary) FROM salaries WHERE to_date > CURDATE())
-(SELECT STDDEV(salary) FROM salaries WHERE to_date > CURDATE()));

SELECT COUNT(*) FROM salaries WHERE to_date > CURDATE();

SELECT((SELECT COUNT(*)
FROM salaries
WHERE to_date > CURDATE()
AND salary > (
(SELECT MAX(salary) FROM salaries WHERE to_date > CURDATE()) - 
(SELECT STDDEV(salary) FROM salaries WHERE to_date > CURDATE())
))/(SELECT COUNT(*)
FROM salaries 
WHERE to_date > now())) * 100 AS 'percentage of salaries';











