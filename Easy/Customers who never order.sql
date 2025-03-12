
-- Suppose that a website contains two tables, 
-- the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

-- Table: Customers.

-- +----+-------+
-- | Id | Name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- Table: Orders.

-- +----+------------+
-- | Id | CustomerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+

CREATE TABLE Customers (
    Id INT PRIMARY KEY,
    Name VARCHAR(100)
);

INSERT INTO Customers (Id, Name)
VALUES
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Sam'),
    (4, 'Max');



CREATE TABLE Orders (
    Id INT PRIMARY KEY,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
);

INSERT INTO Orders (Id, CustomerId)
VALUES
    (1, 3),
    (2, 1);

-- Using the above tables as example, return the following:

-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+


Select C.Name
FROM Customers C 
left join Orders O ON C.id = O.CustomerId
where O.CustomerId is NULL 

Select C.Name
FROM Customers C where C.id not in (Select O.CustomerId from Orders O)
