-- To Create Database Online Bookstore
Create Database Bookstore;
Use Bookstore;
CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Price DECIMAL(8,2) CHECK (Price > 0)
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    BookID INTEGER,
    OrderDate DATE NOT NULL,
    Quantity INTEGER CHECK (Quantity > 0),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

ALTER TABLE Books
ADD CONSTRAINT UQ_ISBN UNIQUE (ISBN);

-- Insert records into Books table

INSERT INTO Books (BookID, Title, Author, ISBN, Price)
VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'ISBN1001', 499.99),
(2, 'Atomic Habits', 'James Clear', 'ISBN1002', 699.50),
(3, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'ISBN1003', 550.00),
(4, 'Think and Grow Rich', 'Napoleon Hill', 'ISBN1004', 450.75),
(5, 'Ikigai', 'Hector Garcia', 'ISBN1005', 399.00);


-- Insert records into Orders table

INSERT INTO Orders (OrderID, BookID, OrderDate, Quantity)
VALUES
(101, 1, '2026-05-01', 2),
(102, 3, '2026-05-02', 1),
(103, 5, '2026-05-03', 4);


-- Retrieve all records from Books

SELECT * FROM Books;


-- Retrieve all records from Orders

SELECT * FROM Orders;


-- Update Price in Books table

UPDATE Books
SET Price = 750.00
WHERE BookID = 2;


-- Update Quantity in Orders table

UPDATE Orders
SET Quantity = 3
WHERE OrderID = 101;

-- DELETE specific row from Orders table

DELETE FROM Orders
WHERE OrderID = 102;


-- View remaining records

SELECT * FROM Orders;


-- TRUNCATE all rows from Orders table

TRUNCATE TABLE Orders;


-- Verify table is empty

SELECT * FROM Orders;

