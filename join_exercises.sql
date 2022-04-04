use join_example_db;

SELECT * FROM users AS u
JOIN roles AS r ON u.role_id = r.id;

SELECT * FROM users AS u
LEFT JOIN roles AS r ON u.role_id = r.id;

SELECT * FROM users AS u
RIGHT JOIN roles AS r ON u.role_id = r.id;

SELECT r.name, u.role_id, COUNT(*) AS number_of_users
FROM users AS u
LEFT JOIN roles AS r ON u.role_id = r.id
GROUP BY u.role_id;

use employees;

SELECT d.dept_name AS 'Department Name', 
CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM dept_manager AS dm
JOIN departments AS d ON dm.dept_no = d.dept_no
JOIN employees AS e on dm.emp_no = e.emp_no
WHERE dm.to_date > CURDATE();

SELECT d.dept_name AS 'Department Name', 
CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM dept_manager AS dm
JOIN departments AS d ON dm.dept_no = d.dept_no
JOIN employees AS e on dm.emp_no = e.emp_no
WHERE dm.to_date > CURDATE()
AND e.gender = 'F';

SELECT t.title AS Title, COUNT(*) AS 'Count'
FROM dept_emp AS de
JOIN titles AS t ON de.emp_no = t.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service'
AND t.to_date > CURDATE()
AND de.to_date > CURDATE()
GROUP BY t.title;

SELECT d.dept_name AS 'Department Name', 
CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
s.salary AS 'Salary'
FROM dept_manager AS dm
JOIN departments AS d ON dm.dept_no = d.dept_no
JOIN employees AS e on dm.emp_no = e.emp_no
JOIN salaries AS s on e.emp_no = s.emp_no
WHERE s.to_date > CURDATE()
AND dm.to_date > CURDATE();

SELECT d.dept_no, d.dept_name, COUNT(emp_no) AS num_employees
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
WHERE de.to_date > CURDATE()
GROUP BY dept_no, dept_name;

SELECT d.dept_name, ROUND(AVG(salary), 2) AS average_salary
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN salaries AS s ON de.emp_no = s.emp_no
WHERE de.to_date > CURDATE()
AND s.to_date > CURDATE()
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

SELECT first_name, last_name
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_emp AS de ON s.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE dept_name = 'Marketing'
AND s.to_date > CURDATE()
AND de.to_date > CURDATE()
ORDER BY s.salary DESC
LIMIT 1;

SELECT first_name, last_name, salary, dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN salaries AS s ON dm.emp_no = s.emp_no
JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date > CURDATE()
AND s.to_date > CURDATE()
ORDER BY salary DESC
LIMIT 1;

SELECT d.dept_name, ROUND(AVG(s.salary),0) AS average_department_salary
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN salaries AS s ON de.emp_no = s.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_department_salary DESC;

































