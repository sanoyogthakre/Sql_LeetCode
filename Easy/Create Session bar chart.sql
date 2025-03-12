
-- Table: Sessions

-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | session_id          | int     |
-- | duration            | int     |
-- +---------------------+---------+
-- session_id is the primary key for this table.
-- duration is the time in seconds that a user has visited the application.
 

-- You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.

-- Write an SQL query to report the (bin, total) in any order.

-- The query result format is in the following example.

-- Sessions table:
-- +-------------+---------------+
-- | session_id  | duration      |
-- +-------------+---------------+
-- | 1           | 30            |
-- | 2           | 199           |
-- | 3           | 299           |
-- | 4           | 580           |
-- | 5           | 1000          |
-- +-------------+---------------+
-- Create the 'Sessions' table
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY,
    duration INT
);
-- Insert data into the 'Sessions' table
INSERT INTO Sessions (session_id, duration)
VALUES
(1, 30),
(2, 199),
(3, 299),
(4, 580),
(5, 1000);

-- Result table:
-- +--------------+--------------+
-- | bin          | total        |
-- +--------------+--------------+
-- | [0-5>        | 3            |
-- | [5-10>       | 1            |
-- | [10-15>      | 0            |
-- | 15 or more   | 1            |
-- +--------------+--------------+

-- For session_id 1, 2 and 3 have a duration greater or equal than 0 minutes and less than 5 minutes.
-- For session_id 4 has a duration greater or equal than 5 minutes and less than 10 minutes.
-- There are no session with a duration greater or equial than 10 minutes and less than 15 minutes.
-- For session_id 5 has a duration greater or equal than 15 minutes.

-- Solution 2
(Select '[0-5>' as bin, 
 sum(case when duration/60 < 5 then 1 else 0 end) as total from Sessions)
 union
(Select '[5-10>' as bin, 
 sum(case when ((duration/60 >= 5) and (duration/60 < 10)) then 1 else 0 end) as total from Sessions)
 union
(Select '[10-15>' as bin, 
 sum(case when ((duration/60 >= 10) and (duration/60 < 15)) then 1 else 0 end) as total from Sessions)
 union
(Select '15 or more' as bin, 
 sum(case when duration/60 >= 15 then 1 else 0 end) as total from Sessions)
 
 
 --solution 2
 SELECT
    CASE 
        WHEN duration >= 0 AND duration < 300 THEN '[0-5>'   -- 0 to 5 minutes (0-300 seconds)
        WHEN duration >= 300 AND duration < 600 THEN '[5-10>'  -- 5 to 10 minutes (300-600 seconds)
        WHEN duration >= 600 AND duration < 900 THEN '[10-15>' -- 10 to 15 minutes (600-900 seconds)
        ELSE '15 or more'                                    -- 15 minutes or more (900+ seconds)
    END AS bin,  COUNT(*) AS total
FROM Sessions
GROUP BY bin
ORDER BY bin, '[0-5>', '[5-10>', '[10-15>', '15 or more';
