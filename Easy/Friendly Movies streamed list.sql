
-- Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- TVProgram table:
-- +--------------------+--------------+-------------+
-- | program_date       | content_id   | channel     |
-- +--------------------+--------------+-------------+
-- | 2020-06-10 08:00   | 1            | LC-Channel  |
-- | 2020-05-11 12:00   | 2            | LC-Channel  |
-- | 2020-05-12 12:00   | 3            | LC-Channel  |
-- | 2020-05-13 14:00   | 4            | Disney Ch   |
-- | 2020-06-18 14:00   | 4            | Disney Ch   |
-- | 2020-07-15 16:00   | 5            | Disney Ch   |
-- +--------------------+--------------+-------------+

-- Content table:
-- +------------+----------------+---------------+---------------+
-- | content_id | title          | Kids_content  | content_type  |
-- +------------+----------------+---------------+---------------+
-- | 1          | Leetcode Movie | N             | Movies        |
-- | 2          | Alg. for Kids  | Y             | Series        |
-- | 3          | Database Sols  | N             | Series        |
-- | 4          | Aladdin        | Y             | Movies        |
-- | 5          | Cinderella     | Y             | Movies        |
-- +------------+----------------+---------------+---------------+
-- Create TVProgram Table
CREATE TABLE TVProgram (
    program_date DATETIME,
    content_id INT,
    channel VARCHAR(100)
);

-- Create Content Table
CREATE TABLE Content (
    content_id INT PRIMARY KEY,
    title VARCHAR(255),
    Kids_content CHAR(1),  -- 'Y' for Yes, 'N' for No
    content_type VARCHAR(50)
);
-- Insert data into TVProgram Table
INSERT INTO TVProgram (program_date, content_id, channel) VALUES
('2020-06-10 08:00', 1, 'LC-Channel'),
('2020-05-11 12:00', 2, 'LC-Channel'),
('2020-05-12 12:00', 3, 'LC-Channel'),
('2020-05-13 14:00', 4, 'Disney Ch'),
('2020-06-18 14:00', 4, 'Disney Ch'),
('2020-07-15 16:00', 5, 'Disney Ch');

-- Insert data into Content Table
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES
(1, 'Leetcode Movie', 'N', 'Movies'),
(2, 'Alg. for Kids', 'Y', 'Series'),
(3, 'Database Sols', 'N', 'Series'),
(4, 'Aladdin', 'Y', 'Movies'),
(5, 'Cinderella', 'Y', 'Movies');

-- Result table:
-- +--------------+
-- | title        |
-- +--------------+
-- | Aladdin      |
-- +--------------+
-- "Leetcode Movie" is not a content for kids.
-- "Alg. for Kids" is not a movie.
-- "Database Sols" is not a movie
-- "Alladin" is a movie, content for kids and was streamed in June 2020.
-- "Cinderella" was not streamed in June 2020.


---Solution--

SELECT Distinct C.title
FROM TVProgram TP
JOIN Content C ON TP.content_id = C.content_id
where C.Kids_content = 'Y' and C.content_type = 'Movies' and MONTH(TP.program_date) = 6

