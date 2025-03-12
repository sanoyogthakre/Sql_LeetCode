
-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Id is the primary key column for this table.
CREATE TABLE Emails (
    Id INT PRIMARY KEY,
    Email VARCHAR(255)
);

INSERT INTO Emails (Id, Email)
VALUES
    (1, 'john@example.com'),
    (2, 'bob@example.com'),
    (3, 'john@example.com');


-- For example, after running your query, the above Person table should have the following rows:

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+
--Solution




Select MIN(Id) as Id,Email
FROM Emails 
GROUP BY Email order by Id ASC


-- Solution
With t1 as
(
 Select *,
    row_number() over(partition by email order by id) as rk
    from Emails
)
DELETE from Emails
where id in (Select t1.id from t1 where t1.rk>1)