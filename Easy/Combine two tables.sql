-- Question 14
-- Table: Person

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | PersonId    | int     |
-- | FirstName   | varchar |
-- | LastName    | varchar |
-- +-------------+---------+
-- PersonId is the primary key column for this table.
-- Table: Address

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | AddressId   | int     |
-- | PersonId    | int     |
-- | City        | varchar |
-- | State       | varchar |
-- +-------------+---------+
-- AddressId is the primary key column for this table.
 
-- Create the 'Person' table
CREATE TABLE Person (
    PersonId INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);

-- Create the 'Address' table
CREATE TABLE Address (
    AddressId INT PRIMARY KEY,
    PersonId INT,
    City VARCHAR(100),
    State VARCHAR(100),
    FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);
-- Insert data into the 'Person' table
INSERT INTO Person (PersonId, FirstName, LastName)
VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Johnson');

-- Insert data into the 'Address' table
INSERT INTO Address (AddressId, PersonId, City, State)
VALUES
(1, 1, 'New York', 'NY'),
(2, 2, 'Los Angeles', 'CA'),
(3, 3, 'Chicago', 'IL'),
(4, 1, 'Boston', 'MA');

-- Write a SQL query for a report that provides the following information for each person in the Person table,
-- regardless if there is an address for each of those people:

-- FirstName, LastName, City, State

--Solution

SELECT p.FirstName,p.LastName,ad.City,ad.[State]
FROM Person p
LEFT OUTER JOIN Address ad ON p.PersonId = ad.PersonId








