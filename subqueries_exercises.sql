SELECT hire_date FROM employees 
WHERE emp_no = '101010';

SELECT first_name, last_name, hire_date
FROM employees
JOIN dept_emp AS de using (emp_no)
WHERE hire_date = (SELECT hire_date FROM employees 
WHERE emp_no = '101010')
AND de.to_date > CURDATE();

SELECT title, first_name
FROM employees 
JOIN titles AS t using (emp_no)
WHERE first_name = 'Aamod'
AND t.to_date > CURDATE();







