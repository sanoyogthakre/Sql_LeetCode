
-- Write a SQL query to find all duplicate emails in a table named Person.

-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+

CREATE TABLE Person_1 (
    Id INT PRIMARY KEY,
    Email VARCHAR(255)
);

INSERT INTO Person_1 (Id, Email)
VALUES
    (1, 'a@b.com'),
    (2, 'c@d.com'),
    (3, 'a@b.com');

-- For example, your query should return the following for the above table:

-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+

--Solution--

Select a.Emai
FROM
(Select COUNT(Email) as ac, Email as Emai
FROM Person_1 
GROUP BY Email having COUNT(Email) >1
) a
