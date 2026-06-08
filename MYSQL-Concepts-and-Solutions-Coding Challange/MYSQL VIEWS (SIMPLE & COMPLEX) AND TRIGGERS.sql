-- To Create CompanyDB Database
Create Database CompanyDB;
Use CompanyDB;


--  1.SIMPLE VIEW: EmployeeBasicView
CREATE VIEW EmployeeBasicView AS
SELECT EmpName, DeptID, Salary
FROM Employees;

SELECT * FROM EmployeeBasicView;


-- 2.COMPLEX VIEW: EmployeeDepartmentView
CREATE VIEW EmployeeDepartmentView AS
SELECT 
    e.EmpName,
    d.DeptName,
    d.Location,
    e.Salary
FROM Employees e
JOIN Departments d
ON e.DeptID = d.DeptID;

SELECT * FROM EmployeeDepartmentView;


-- 3.COMPLEX VIEW WITH AGGREGATION
CREATE VIEW DeptSalaryStats AS
SELECT 
    d.DeptName,
    AVG(e.Salary) AS AvgSalary,
    COUNT(e.EmpID) AS TotalEmployees
FROM Employees e
JOIN Departments d
ON e.DeptID = d.DeptID
GROUP BY d.DeptName;

SELECT * FROM DeptSalaryStats;


-- 4.UPDATE USING VIEW
UPDATE EmployeeBasicView
SET Salary = Salary + 5000;

SELECT EmpName, Salary AS Updated_Salary
FROM Employees;


-- 5.DROP VIEW
DROP VIEW DeptSalaryStats;


-- 6.TRIGGER (BEFORE INSERT)
-- Prevent Salary < 30000
DELIMITER $$

CREATE TRIGGER check_min_salary
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    IF NEW.Salary < 30000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be at least 30000';
    END IF;
END$$

DELIMITER ;


INSERT INTO Employees(EmpID, EmpName, DeptID, Salary)
VALUES (101, 'Arun', 1, 25000);


-- 7.TRIGGER (AFTER INSERT – Audit Log)
-- Create Audit Table
CREATE TABLE EmployeeAudit (
    EmpID INT,
    EmpName VARCHAR(100),
    Action VARCHAR(50),
    ActionDate DATETIME
);

-- Create Trigger
DELIMITER $$

CREATE TRIGGER log_employee_insert
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeAudit
    VALUES (
        NEW.EmpID,
        NEW.EmpName,
        'INSERT',
        NOW()
    );
END$$

DELIMITER ;

INSERT INTO Employees(EmpID, EmpName, DeptID, Salary)
VALUES (102, 'Meena', 2, 45000);

SELECT * FROM EmployeeAudit;


-- 8.TRIGGER (AFTER UPDATE – Salary Change Log)
-- Create Salary Log Table
CREATE TABLE SalaryLog (
    EmpID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME
);

-- Create Trigger
DELIMITER $$

CREATE TRIGGER log_salary_change
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF OLD.Salary <> NEW.Salary THEN
        INSERT INTO SalaryLog
        VALUES (
            NEW.EmpID,
            OLD.Salary,
            NEW.Salary,
            NOW()
        );
    END IF;
END$$

DELIMITER ;

UPDATE Employees
SET Salary = 60000
WHERE EmpID = 102;

SELECT * FROM SalaryLog;


-- 9.TRIGGER (BEFORE DELETE – Block Action)
-- Prevent deleting IT department employees
DELIMITER $$

CREATE TRIGGER prevent_it_delete
BEFORE DELETE ON Employees
FOR EACH ROW
BEGIN
    IF OLD.DeptID = (
        SELECT DeptID
        FROM Departments
        WHERE DeptName = 'IT'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete employees from IT department';
    END IF;
END$$

DELIMITER ;

DELETE FROM Employees
WHERE EmpID = 102;


-- 10.TRIGGER (AFTER DELETE – Archive Record)
-- Create Archive Table
CREATE TABLE EmployeeArchive (
    EmpID INT,
    EmpName VARCHAR(100),
    DeptID INT,
    Salary DECIMAL(10,2),
    ExitDate DATETIME
);

-- Create Trigger
DELIMITER $$

CREATE TRIGGER archive_deleted_employee
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeArchive
    VALUES (
        OLD.EmpID,
        OLD.EmpName,
        OLD.DeptID,
        OLD.Salary,
        NOW()
    );
END$$

DELIMITER ;

DELETE FROM Employees
WHERE EmpID = 103;

SELECT * FROM EmployeeArchive;


