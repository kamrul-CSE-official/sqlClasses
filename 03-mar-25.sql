-- Step 1: Create a new database named 'Ostad'
CREATE DATABASE Ostad;

-- Step 2: Use the 'Ostad' database for subsequent queries
USE Ostad;

-- Step 3: Create an Employees table with:
--   - 'emp_id' as the Primary Key (unique identifier for each employee)
--   - 'name' as a string with a maximum length of 100 characters
--   - 'email' as a UNIQUE field to prevent duplicate emails
CREATE TABLE Employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Step 4: Insert a new employee record
INSERT INTO Employees (emp_id, name, email)
VALUES (1, 'Kamrul', 'kamrul@gmail.com');

-- Step 5: Retrieve all records from Employees
SELECT * FROM Employees;

-- Step 6: Create a Products table with:
--   - 'product_id' as the Primary Key
--   - 'name' with a max length of 100 characters
--   - 'stock' with a default value of 10
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    stock INT DEFAULT 10
);

-- Step 7: Insert a product while letting 'stock' default to 10
INSERT INTO Products (product_id, name)
VALUES (1, 'Laptop');

-- Step 8: Retrieve all records from Products
SELECT * FROM Products;

-- Step 9: Drop the Products table to recreate it with better constraints
DROP TABLE Products;

-- Step 10: Recreate the Products table with:
--   - 'product_id' as an auto-incremented Primary Key
--   - 'stock' must be greater than 0 (CHECK constraint)
CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(100),
    stock INT CHECK(stock > 0)
);

-- Step 11: Insert a product without specifying 'product_id' (Auto-incremented)
INSERT INTO Products (name, stock)
VALUES ('TV', 20);

-- Step 12: Retrieve all products
SELECT * FROM Products;

-- Step 13: Create the Departments table
CREATE TABLE Departments (
    depart_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL -- Name cannot be NULL
);

-- Step 14: Create the Students table with:
--   - A Primary Key 'stu_id'
--   - A Foreign Key 'department_id' referencing 'Departments'
--   - If a department is deleted, set department_id in Students to NULL
CREATE TABLE Students (
    stu_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(depart_id) ON DELETE SET NULL
);

--DROP TABLE Students;

-- Step 15: Insert a department
INSERT INTO Departments (depart_id, name)
VALUES (2, 'EEE');

-- Step 16: Insert a student linked to the 'EEE' department
INSERT INTO Students (stu_id, name, department_id)
VALUES (2, 'Jamal', 2);

-- Step 17: Retrieve students with their department names using JOIN
SELECT s.stu_id, s.name AS Student_Name, d.name AS Department_Name
FROM Students s
JOIN Departments d ON s.department_id = d.depart_id;

-- Step 18: Delete a department
DELETE FROM Departments WHERE depart_id = 1;


CREATE TABLE Employees (
	emp_id INT PRIMARY KEY,
	email VARCHAR(100),
	name VARCHAR(150),
	salary INT
);

--DROP TABLE Employees;
-- Inserting multiple employee records
INSERT INTO Employees (emp_id, name, email, salary)
VALUES 
    (1, 'Kamrul', 'kamrul@gmail.com', 10000), 
    (2, 'Jamal', 'jamal@gmail.com', 20000), 
    (3, 'Rahim', 'rahim@gmail.com', 15000), 
    (4, 'Karim', 'karim@gmail.com', 18000), 
    (5, 'Ayesha', 'ayesha@gmail.com', 25000), 
    (6, 'Tania', 'tania@gmail.com', 22000);


SELECT * FROM Employees;

SELECT name, salary FROM Employees WHERE salary > (SELECT AVG(salary) FROM Employees);

SELECT AVG(salary) FROM Employees;


SELECT * FROM Students;
INSERT INTO Students (stu_id, name, department_id)
VALUES
	(1, 'Kamrul', 1),
	(2, 'Jamal', 2),
	(3, 'Fahim', 1),
	(4, 'Sadia', 1);

SELECT * FROM Departments;

SELECT name,department_id 
FROM Students 
WHERE department_id = (SELECT depart_id FROM Departments WHERE name = 'CSE');


WITH AVGSalary AS (
    SELECT AVG(salary) AS avg_salary 
    FROM Employees
)
SELECT * FROM AVGSalary;
