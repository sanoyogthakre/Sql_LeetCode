
-- Several friends at a cinema ticket office would like to reserve consecutive available seats.
-- Can you help to query all the consecutive available seats order by the seat_id using the following seatMap table?
-- | seat_id | free |
-- |---------|------|
-- | 1       | 1    |
-- | 2       | 0    |
-- | 3       | 1    |
-- | 4       | 1    |
-- | 5       | 1    |
 
-- Create the 'SeatMap' table
CREATE TABLE SeatMap (
    seat_id INT PRIMARY KEY,
    free INT
);
-- Insert data into the 'SeatMap' table
INSERT INTO SeatMap (seat_id, free)
VALUES
(1, 1),
(2, 0),
(3, 1),
(4, 1),
(5, 1);

-- Your query should return the following result for the sample case above.
 

-- | seat_id |
-- |---------|
-- | 3       |
-- | 4       |
-- | 5       |
-- Note:
-- The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.).
-- Consecutive available seats are more than 2(inclusive) seats consecutively available.


WITH ConsecutiveSeats AS (
    SELECT 
        seat_id,
        ROW_NUMBER() OVER (ORDER BY seat_id) - seat_id AS grp
    FROM SeatMap
    WHERE free = 1
)
SELECT seat_id
FROM ConsecutiveSeats
WHERE grp IN (
    SELECT grp
    FROM ConsecutiveSeats
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
ORDER BY seat_id;
