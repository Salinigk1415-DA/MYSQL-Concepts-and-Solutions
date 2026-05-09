
## MYSQL-Concepts-and-Solutions

This repository contains a structured collection of MySQL SQL scripts designed for learning and practising core database concepts. Each file is organized by topic and progressively covers fundamental to advanced MySQL features.
The scripts are suitable for beginners learning SQL as well as intermediate users who want to reinforce their understanding of relational database concepts.

## Topic Breakdown
1.Clauses & Operators — ECommerceDB
Database: ECommerceDB   |   Tables: Product, Sales

Clauses Covered

•	SELECT DISTINCT — retrieve unique values

•	AS — column aliases

•	WHERE — filter rows

•	ORDER BY — sort results

•	LIMIT — restrict row count

Operators Covered

•	=, <>, >, <, >=, <=

•	+, -, *, /

•	AND, OR, NOT

•	IN, NOT IN, BETWEEN, NOT BETWEEN, LIKE, NOT LIKE, IS NULL, IS NOT NULL


2.Aggregate Functions, GROUP BY & Window Functions — ECommerceDB

Aggregate Functions

•	COUNT(*) — total rows

•	SUM() — total of a column

•	AVG() — average value

•	MAX() / MIN() — highest and lowest values

GROUP BY & HAVING

Groups rows by a column and filters groups using HAVING (equivalent of WHERE for aggregated data).

Window Functions

RANK() OVER (ORDER BY ...) — assigns a rank to each row without collapsing the result set.
SELECT product_id, product_name, price,
       RANK() OVER (ORDER BY price DESC) AS product_rank
FROM Product;

3.DDL Commands — Hospital Database
Database: Hospital   |   Table: Patients / Patient_Info

Commands Demonstrated

•	CREATE DATABASE / CREATE TABLE — with data types and PRIMARY KEY

•	ALTER TABLE ADD — add a new column (DoctorAssigned)

•	ALTER TABLE MODIFY — change column data type or size

•	RENAME TABLE — rename Patients to Patient_Info

•	TRUNCATE TABLE — remove all rows but keep structure

•	DROP TABLE — completely remove a table

4.DML & Constraints — Online Bookstore
Database: Bookstore   |   Tables: Books, Orders

DML Operations

•	INSERT INTO — add new records

•	UPDATE SET — modify existing records

•	DELETE FROM — remove specific records

•	TRUNCATE — clear all data from a table

Constraints Used

•	PRIMARY KEY — unique row identifier

•	NOT NULL — prevents empty values

•	UNIQUE — ensures no duplicate values (e.g., ISBN)

•	CHECK — enforces a condition (Price > 0, Quantity > 0)

•	FOREIGN KEY — links Orders.BookID to Books.BookID

5.Joins & Built-in Functions — School Database
Database: School   |   Tables: Students, Enrollments, Courses

Join Types

•	INNER JOIN — only matching rows from both tables

•	LEFT JOIN — all rows from left + matched rows from right

•	RIGHT JOIN — all rows from right + matched rows from left

Built-in Functions

•	ROUND(), ABS(), MOD()

•	CONCAT(), LENGTH(), REPLACE(), SUBSTRING(), UPPER(), LOWER()

•	NOW(), DATEDIFF(), DATE_ADD()

6.Subqueries — CompanyDB
Database: CompanyDB   |   Tables: Employees, Departments

Subquery Types

•	Single Row Subquery — returns one value (used with =, >, <)

•	Multi Row Subquery — returns multiple values (used with IN, ANY, ALL)

•	Correlated Subquery — references the outer query; re-runs for each row

Special Keywords

•	EXISTS — checks whether a subquery returns any rows

•	ANY — true if any comparison in the subquery is satisfied

•	ALL — true only if all comparisons in the subquery are satisfied


7.Views & Triggers — CompanyDB
Database: CompanyDB   |   Tables: Employees, Departments + Audit/Log tables

Views

•	Simple View — selects from a single table (EmployeeBasicView)

•	Complex View — joins multiple tables (EmployeeDepartmentView)

•	Aggregated View — uses GROUP BY + JOIN (DeptSalaryStats)

•	Updatable View — UPDATE through a view reflects to the base table

•	DROP VIEW — removes a view definition

Triggers

•	BEFORE INSERT — validate salary >= 30,000 before inserting

•	AFTER INSERT — log new employee to EmployeeAudit table

•	AFTER UPDATE — log salary changes to SalaryLog table

•	BEFORE DELETE — block deletion of IT department employees

•	AFTER DELETE — archive deleted employees to EmployeeArchive table


## How to Run the Scripts
Prerequisites

•	MySQL Server 8.0 or higher installed

•	MySQL Workbench, DBeaver, or any MySQL-compatible client

•	Basic familiarity with running SQL scripts

Steps

•	Open your MySQL client and connect to your server.

•	Open any .sql file from this project.

•	Run the CREATE DATABASE and USE statements first to set up the target database.

•	Execute the remaining statements in order from top to bottom.

•	For Subqueries and Views & Triggers files, ensure the CompanyDB tables (Employees, Departments) are populated with data first.


## Key SQL Concepts Quick Reference
DDL vs DML

•	CREATE, ALTER, DROP, TRUNCATE, RENAME — define structure

•	INSERT, UPDATE, DELETE, SELECT — manipulate data

Joins vs Subqueries

•	combine rows from two or more tables horizontally

•	nest a SELECT inside another query for filtered or computed values

Views vs Triggers

•	virtual tables based on a SELECT query; simplify complex queries

•	automatic actions that fire on INSERT, UPDATE, or DELETE events


## Tags
#MySQL #Database #DataAnalytics #Coding #Developers #LearningSQL #SQLQueries #RelationalDatabase 
