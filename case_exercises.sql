use employees;

SELECT 
emp_no, first_name, last_name, dept_no, hire_date, to_date,
CASE WHEN to_date > CURDATE() THEN 1 ELSE 0 END AS 'is current employee'
FROM dept_emp
JOIN employees using(emp_no)
JOIN departments using(dept_no);

SELECT first_name, last_name,
CASE WHEN last_name LIKE 'A%' OR last_name LIKE 'B%'
OR last_name LIKE 'C%' OR last_name LIKE 'D%' 
OR last_name LIKE 'E%' OR last_name LIKE 'F%'
OR last_name LIKE 'G%' OR last_name LIKE 'H%' THEN 'A-H'
WHEN last_name LIKE 'I%' OR last_name LIKE 'J%'
OR last_name LIKE 'K%' OR last_name LIKE 'M%' 
OR last_name LIKE 'N%' OR last_name LIKE 'O%'
OR last_name LIKE 'P%' OR last_name LIKE 'Q%' THEN 'I-Q'
ELSE 'R-Z'
END AS alpha_group
FROM employees;

SELECT * FROM employees;

SELECT
COUNT(CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN birth_date ELSE NULL END) AS '50s',
COUNT(CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN birth_date ELSE NULL END) AS '60s' 
FROM employees;

SELECT
CASE 
WHEN dept_name = 'research' OR dept_name = 'development' THEN 'R&D'
WHEN dept_name = 'sales' OR dept_name = 'marketing' THEN 'Sales & Marketing'
WHEN dept_name = 'production' OR dept_name = 'quality management' THEN 'Prod & QM'
WHEN dept_name = 'finance' OR dept_name = 'human resources' THEN 'Finance & HR'
WHEN dept_name = 'customer service' THEN 'Customer Service'
END AS 'Department Group',
ROUND(AVG(salary)) AS avg_salary
FROM salaries 
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > CURDATE() AND dept_emp.to_date > CURDATE()
GROUP BY Department_Group;





