CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Amit', 'Sharma', 'IT', 60000, '2021-05-10', 'Ahmedabad'),
(2, 'Priya', 'Patel', 'HR', 45000, '2020-03-15', 'Surat'),
(3, 'Rahul', 'Mehta', 'Finance', 70000, '2019-07-22', 'Vadodara'),
(4, 'Sneha', 'Joshi', 'IT', 80000, '2022-01-12', 'Ahmedabad'),
(5, 'Karan', 'Desai', 'Sales', 50000, '2021-09-18', 'Rajkot'),
(6, 'Neha', 'Verma', 'HR', 48000, '2018-11-25', 'Surat'),
(7, 'Vikas', 'Singh', 'Finance', 75000, '2020-06-30', 'Ahmedabad'),
(8, 'Pooja', 'Kapoor', 'IT', 65000, '2023-02-05', 'Mumbai');



-- 1. Show employees whose salary is greater than the average salary.
SELECT first_name AS name,
       salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2. Find the department with the highest average salary.
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

-- 3. Show the second highest salary employee.
SELECT first_name,
       salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

-- 4. Count how many employees are in each city.
SELECT city,
       COUNT(emp_id) AS total_employees
FROM employees
GROUP BY city;

-- 5. Show employees hired before 2021 and earning more than 50,000.
SELECT first_name,
       hire_date,
       salary
FROM employees
WHERE salary > 50000
AND hire_date < '2021-01-01';

-- 6. Find departments having more than 2 employees.
SELECT department,
       COUNT(emp_id) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(emp_id) > 2;

-- 7. Show employees whose first name starts with 'P'.
SELECT first_name
FROM employees
WHERE first_name LIKE 'P%';

-- 8. Find total salary paid department-wise.
SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 9. Show employees earning between 50,000 and 75,000.
SELECT first_name,
       salary
FROM employees
WHERE salary BETWEEN 50000 AND 75000;

-- 10. Find employees from Ahmedabad working in IT department.
SELECT first_name
FROM employees
WHERE city = 'Ahmedabad'
AND department = 'IT';

-- 11. Find the highest salary in each department
SELECT department, MAX(salary) as highest_salary
FROM employees
GROUP BY department;

-- 12.Show employees who were hired in the same year as 2021
SELECT first_name, hire_date
FROM employees
WHERE YEAR(hire_date) = 2021;

-- 13. Find the total number of employees whose salary is above 60,000
SELECT COUNT(emp_id) as total_employee
FROM employees
WHERE salary>60000;
