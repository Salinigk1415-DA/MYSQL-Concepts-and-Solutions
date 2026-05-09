Use companyDB;
-- Single Row Subquery 
-- 1.Find employees whose salary is greater than the average salary of all employees.
SELECT * FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- 2.Find employees who earn more than Ravi.
SELECT * FROM Employees
WHERE Salary > (
    SELECT Salary
    FROM Employees
    WHERE EmployeeName = 'Ravi'
);
 
-- 3.	Find employees who joined after Meena.
SELECT * FROM Employees
WHERE JoinDate > (
    SELECT JoinDate
    FROM Employees
    WHERE EmployeeName = 'Meena'
);

-- 4.	Find employees whose salary is greater than the average salary of the IT department.
SELECT * FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID
        FROM Departments
        WHERE DepartmentName = 'IT'
    )
);

-- 5.	Find employees whose performance rating is higher than the average performance rating of all employees.
SELECT * FROM Employees
WHERE PerformanceRating > (
    SELECT AVG(PerformanceRating)
    FROM Employees
);

-- Multi Row Subquery 
-- 1.	Find employees who work in departments located in Chennai or Bangalore.
SELECT * FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Departments
    WHERE Location IN ('Chennai', 'Bangalore')
);

-- 2.	Find employees who work in departments located in Pune.
SELECT * FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Departments
    WHERE Location = 'Pune'
);

-- 3.	Find employees whose salary is greater than any employee in the Marketing department.
SELECT * FROM Employees
WHERE Salary > ANY (
    SELECT Salary
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID
        FROM Departments
        WHERE DepartmentName = 'Marketing'
    )
);

-- 4.	Find employees whose salary is greater than all employees in the HR department.
SELECT * FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID
        FROM Departments
        WHERE DepartmentName = 'HR'
    )
);

-- 5.	Find employees who belong to departments that have employees with performance rating = 5.
SELECT * FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Employees
    WHERE PerformanceRating = 5
);

-- Correlated Subquery 
-- 1.	Find employees whose salary is greater than the average salary of their department.
SELECT * FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 2.	Find employees who earn the highest salary in their department.
SELECT * FROM Employees e
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 3.	Find employees whose performance rating is higher than the average performance rating in their department.
SELECT * FROM Employees e
WHERE PerformanceRating > (
    SELECT AVG(PerformanceRating)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 4.	Find employees who joined after the average join date of their department.
SELECT * FROM Employees e
WHERE JoinDate > (
    SELECT AVG(JoinDate)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 5.	Find employees whose salary is less than the maximum salary in their department.
SELECT * FROM Employees e
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 6.	Find employees whose salary is equal to the minimum salary in their department.
SELECT * FROM Employees e
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 7.	Find departments that have employees earning more than 70000.
SELECT * FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
    AND e.Salary > 70000
);

-- 8.	Find employees whose salary is greater than at least one employee in their department.
SELECT * FROM Employees e
WHERE Salary > ANY (
    SELECT Salary
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
    AND EmployeeID <> e.EmployeeID
);

-- 9.	Find employees who are the only employee in their department.
SELECT * FROM Employees e
WHERE 1 = (
    SELECT COUNT(*)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 10.	Find employees whose salary is greater than the average salary of employees who joined after them.
SELECT * FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE JoinDate > e.JoinDate
);
