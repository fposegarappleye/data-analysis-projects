-- CREATE TABLE Sep2025JunkDB.francis_rappleye.planned_makes (
--     id INT PRIMARY KEY IDENTITY(1,1),
--     title VARCHAR(50) NOT NULL,
--     project_status VARCHAR(10),
--     notes VARCHAR(500),
--     deadline DATE
-- )

-- INSERT INTO Sep2025JunkDB.francis_rappleye.planned_makes 
-- VALUES ('Fall Landscape Painting', 'working','Trying to get the colors just right.','2025-11-29'),
--     ('100 Hands', 'waiting','Drawing 100 hands to get better.','2025-12-07'),
--     ('Yearly Budgeting', 'waiting','Waiting to fill out essentials + complete projects first.','2025-12-14')

-- UPDATE Sep2025JunkDB.francis_rappleye.planned_makes
-- SET project_status = 'finished'
-- WHERE project_status = 'working'

-- SELECT * FROM Sep2025JunkDB.francis_rappleye.planned_makes

-- DELETE FROM Sep2025JunkDB.francis_rappleye.planned_makes
-- WHERE title = '100 Hands'

-- DROP TABLE Sep2025JunkDB.francis_rappleye.planned_makes

-- SELECT * FROM Sep2025JunkDB.francis_rappleye.genre

-- SELECT title, isbn FROM Sep2025JunkDB.francis_rappleye.book
-- WHERE genre_id IN (
--     SELECT genre_id FROM Sep2025JunkDB.francis_rappleye.genre
--     WHERE genres = 'Mystery'
-- )

-- SELECT * FROM Sep2025JunkDB.francis_rappleye.author
-- SELECT * FROM Sep2025JunkDB.francis_rappleye.book

-- SELECT b.title, a.first_name, a.last_name
-- FROM Sep2025JunkDB.francis_rappleye.book AS b
-- JOIN Sep2025JunkDB.francis_rappleye.author AS a ON b.author_id = a.author_id
-- WHERE death_year IS NULL


-- Create your query that will loan out a book:
-- 1: Change available to 0 for book (in Book table)
UPDATE Sep2025JunkDB.francis_rappleye.book 
SET available = 0
WHERE book_id = @bookId

-- 2: Add new loan table with date out and patron id and book id (in Loan table)
INSERT INTO Sep2025JunkDB.francis_rappleye.loan
VALUES (10,GETDATE(),NULL,12)

-- 3: Update patron with loan id for new row in loan table (in patron table)
UPDATE Sep2025JunkDB.francis_rappleye.patron
SET loan_id = (
    SELECT loan_id
    FROM Sep2025JunkDB.francis_rappleye.loan
    WHERE patron_id = 10 
)
WHERE patron_id = 10





SELECT * FROM Sep2025JunkDB.francis_rappleye.loan
SELECT * FROM Sep2025JunkDB.francis_rappleye.patron

-- Change available to 1 for appropriate book (12)
UPDATE Sep2025JunkDB.francis_rappleye.book 
SET available = 1
WHERE book_id = 12

-- Set the loan 
UPDATE Sep2025JunkDB.francis_rappleye.loan
SET date_in = GETDATE()
WHERE book_id = 12

-- Update loan on patron's side
UPDATE Sep2025JunkDB.francis_rappleye.patron
SET loan_id = NULL
WHERE patron_id = 10

-- PART E
SELECT *
INTO #temploans
FROM Sep2025JunkDB.francis_rappleye.loan
WHERE patron_id = 10
SELECT * FROM #temploans

-- PART F
SELECT 
    p.first_name, 
    p.last_name,
    ( 
        SELECT STRING_AGG(genres, ', ')
        FROM Sep2025JunkDB.francis_rappleye.genre
        WHERE genre_id IN (
            SELECT b.genre_id
            FROM Sep2025JunkDB.francis_rappleye.book AS b
            JOIN Sep2025JunkDB.francis_rappleye.loan AS l
                ON b.book_id = l.book_id
            WHERE patron_id = 
        )
    )
FROM Sep2025JunkDB.francis_rappleye.patron AS p
WHERE patron_id IN (
    SELECT patron_id FROM Sep2025JunkDB.francis_rappleye.loan
    WHERE date_in IS NULL
)
-- g.genres
-- FROM Sep2025JunkDB.francis_rappleye.patron AS p
-- JOIN Sep2025JunkDB.francis_rappleye.book AS b ON book_id
-- JOIN Sep2025JunkDB.francis_rappleye.genre AS g