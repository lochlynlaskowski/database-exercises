use titles;

SELECT DISTINCT title FROM titles;

-- there are 7 unique titles

SELECT DISTINCT last_name
FROM employees
WHERE last_name
LIKE 'E%E'
GROUP BY last_name;

SELECT first_name, last_name
FROM employees
WHERE first_name
LIKE '%E'
AND last_name
LIKE '%E'
GROUP BY first_name, last_name;

SELECT last_name
FROM employees
WHERE last_name 
LIKE '%Q%'
AND last_name 
NOT LIKE '%QU%'
GROUP BY last_name;

-- Chleq, Lindqvist, Qiwen

SELECT last_name, COUNT(last_name) same_last_name
FROM employees
WHERE last_name 
LIKE '%Q%'
AND last_name 
NOT LIKE '%QU%'
GROUP BY last_name; 

SELECT gender, first_name, COUNT(gender)
FROM employees
WHERE first_name IN ('Irene' , 'Vidya', 'Maya')
GROUP BY gender , first_name;

SELECT LOWER(CONCAT(
SUBSTR(first_name,1,1),
SUBSTR(last_name,1,4),
"_",
SUBSTR(birth_date,6,2), 
SUBSTR(birth_date,3,2) ))
AS
username,
COUNT(*) number_of_users
FROM employees
GROUP BY username;

SELECT LOWER(CONCAT(
SUBSTR(first_name,1,1),
SUBSTR(last_name,1,4),
"_",
SUBSTR(birth_date,6,2), 
SUBSTR(birth_date,3,2) ))
AS
username,
COUNT(*) number_of_users
FROM employees
GROUP BY username
HAVING number_of_users >1;

-- there are 13,251 duplicate usernames with 4 being used 6 times 
