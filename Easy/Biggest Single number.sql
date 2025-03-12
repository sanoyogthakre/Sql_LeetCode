
-- Table my_numbers contains many numbers in column num including duplicated ones.
-- Can you write a SQL query to find the biggest number, which only appears once.

CREATE TABLE my_numbers
(
    num int
)

INSERT INTO my_numbers (num)
VALUES 
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

-- +---+
-- |num|
-- +---+
-- | 8 |
-- | 8 |
-- | 3 |
-- | 3 |
-- | 1 |
-- | 4 |
-- | 5 |
-- | 6 | 
-- For the sample data above, your query should return the following result:
-- +---+
-- |num|
-- +---+
-- | 6 |
-- Note:
-- If there is no such number, just output null.

;WITH maximum
AS(
    SELECT max(num) as num
FROM my_numbers 
group by num
Having count(*) = 1
)
SELECT max(num) as num
FROM maximum













