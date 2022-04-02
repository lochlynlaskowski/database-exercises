SELECT DISTINCT emp_no, first_name, last_name 
FROM employees
ORDER BY last_name DESC
LIMIT 10;

 SELECT emp_no, first_name, last_name, hire_date
 FROM employees
 WHERE YEAR(hire_date) 
 BETWEEN '1990'  AND  '1999'
 AND (MONTH(hire_date) = 12)
 AND (DAY(hire_date) =25)
 ORDER BY hire_date, emp_no
 LIMIT 5;
 
 -- Yinghua Dredge, Tina Speek, Jinpo Langford, Jaber Piveteau, Takahira Spataro
 
 SELECT emp_no, first_name, last_name, hire_date
 FROM employees
 WHERE YEAR(hire_date) 
 BETWEEN '1990'  AND  '1999'
 AND (MONTH(hire_date) = 12)
 AND (DAY(hire_date) =25)
 ORDER BY hire_date, emp_no
 LIMIT 5 OFFSET 45;
 
 -- Ramya Peek, Vasilii Emden, Augustine Demos, Manton Huttel, Chris Ferretti
 -- Offest indicates what to skip, limit determines the amount of returns 
 -- offset = (requested page number * limit) - limit
 -- offset = (10*5) - 5
 
 