-- TO Create School database
Create Database School;
Use School;

-- INNER JOIN
SELECT s.StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;

-- LEFT JOIN and RIGHT JOIN
SELECT s.StudentName, e.CourseID
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID;

SELECT s.StudentName, e.CourseID
FROM Students s
RIGHT JOIN Enrollments e
ON s.StudentID = e.StudentID;

-- ROUND()
SELECT ROUND(123.4567, 2) AS Rounded_Value;

-- ABS() & MOD()
SELECT 
    ABS(-250) AS Absolute_Value,
    MOD(25, 4) AS Remainder_Value;

-- CONCAT()
SELECT 
    CONCAT(StudentName, ' from ', City) AS Full_Description
FROM Students;

-- LENGTH()
SELECT 
    StudentName,
    LENGTH(StudentName) AS Name_Length
FROM Students;

-- REPLACE()
SELECT 
    CourseName,
    REPLACE(CourseName, 'SQL', 'Database') AS Updated_CourseName
FROM Courses;

-- SUBSTRING()
SELECT 
    StudentName,
    SUBSTRING(StudentName, 1, 3) AS Code_Prefix
FROM Students;

-- UPPER() & LOWER()
SELECT 
    StudentName,
    UPPER(StudentName) AS UPPER_Name,
    LOWER(StudentName) AS LOWER_Name
FROM Students;

-- DATE FUNCTIONS (NOW, DATEDIFF, DATE_ADD)
-- NOW()
SELECT NOW() AS Current_DateTime;

-- DATEDIFF()
SELECT DATEDIFF('2025-06-01', '2025-05-10') AS Days_Difference;

-- DATE_ADD()
SELECT 
    StudentName,
    EnrollmentDate,
    DATE_ADD(EnrollmentDate, INTERVAL 10 DAY) AS FollowUp_Date
FROM Students;



