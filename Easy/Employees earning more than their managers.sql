
-- The Employee table holds all employees including their managers. 
-- Every employee has an Id, and there is also a column for the manager Id.

-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.


-- Create Employee Table
CREATE TABLE Employee_1 (
    Id INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary INT,
    ManagerId INT
);

-- Insert data into Employee Table
INSERT INTO Employee_1 (Id, Name, Salary, ManagerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);

-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+

--solution
Select E1.Name as Employee
FROM Employee_1 E1
JOIN Employee_1 E2 ON E1.ManagerId = E2.Id
WHERE E1.Salary > E2.Salary


-- Solution
select a.Name as Employee
from Employee_1 a, Employee_1 b
where a.salary>b.salary and a.managerid=b.id