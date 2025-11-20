-- SELECT COUNT(DISTINCT user_id)
-- FROM BooksDB.dbo.ratings AS r
-- WHERE rating > (
--     SELECT AVG(rating)
--     FROM BooksDB.dbo.ratings
-- )

-- SELECT * FROM BooksDB.dbo.ratings

-- SELECT book_id, COUNT(rating) AS ratings
-- FROM BooksDB.dbo.ratings
-- GROUP BY book_id
-- ORDER BY book_id

-- SELECT book_id
-- FROM BooksDB.dbo.books
-- WHERE ratings_1 > 1000

-- UNION 

-- SELECT book_id
-- FROM BooksDB.dbo.books
-- WHERE ratings_5 > 1000

-- SELECT book_id
-- FROM BooksDB.dbo.books
-- WHERE ratings_1 > 1000

-- INTERSECT 

-- SELECT book_id
-- FROM BooksDB.dbo.books
-- WHERE ratings_5 > 1000

-- SELECT book_id, language_code FROM BooksDB.dbo.books
-- WHERE language_code = 'en-US'

-- EXCEPT 

-- SELECT book_id, language_code FROM BooksDB.dbo.books
-- WHERE language_code = 'en-GB'

-- SELECT tag_id, tag_name FROM BooksDB.dbo.tags
-- WHERE tag_id IN (
--     SELECT tag_id
--     FROM BooksDB.dbo.book_tags
--     GROUP BY tag_id
--     HAVING SUM(count) > 100000
-- )

-- Referencing the Books db
-- SELECT title FROM BooksDB.dbo.books
-- WHERE authors LIKE '%,%'

-- SELECT title FROM BooksDB.dbo.books
-- WHERE book_id IN (
--     SELECT goodreads_book_id FROM BooksDB.dbo.book_tags
--     WHERE tag_id = (
--         SELECT tag_id FROM BooksDB.dbo.tags
--         WHERE tags.tag_name = 'Meditation'
--     )
-- )





-- Average rating of 4.2 or higher
-- Descending order by rating

-- SELECT title
-- FROM BooksDB.dbo.books 
-- WHERE title IN (
--     SELECT original_title
--     FROM (
--         SELECT original_title FROM BooksDB.dbo.books
--         WHERE original_title IS NOT NULL
--     )
--     WHERE average_rating > 4.2
-- )

-- (
--     SELECT title, average_rating
--     FROM BooksDB.dbo.books 
--     WHERE title IN (
--         SELECT original_title FROM BooksDB.dbo.books
--         WHERE average_rating > 4.2
--     )
--     EXCEPT

--     SELECT title, average_rating
--     FROM BooksDB.dbo.books WHERE original_title IS NULL
-- )
-- ORDER BY average_rating DESC


-- SELECT title,average_rating FROM BooksDB.dbo.books
-- WHERE average_rating > 4.2 (
--     SELECT book_id FROM BooksDB.dbo.books 
--     WHERE title = original_title
    
--     EXCEPT

--     SELECT book_id
--     FROM BooksDB.dbo.books
--     WHERE original_title IS NULL
-- )
-- ORDER BY average_rating DESC


-- SELECT title, average_rating
-- FROM BooksDB.dbo.books 
-- WHERE book_id IN (
--     SELECT book_id 
--     FROM BooksDB.dbo.books
--     WHERE average_rating >= 4.2
-- )

-- EXCEPT

-- SELECT title, average_rating
-- FROM BooksDB.dbo.books
-- WHERE original_title IS NULL

-- ORDER BY average_rating DESC

-- SELECT title FROM BooksDB.dbo.books
-- WHERE book_id IN (
--     SELECT goodreads_book_id FROM BooksDB.dbo.book_tags
--     WHERE tag_id = (
--         SELECT tag_id FROM BooksDB.dbo.tags
--         WHERE tags.tag_name = 'Meditation'
--     )
-- )





-- SELECT original_publication_year, average_rating
-- WHERE book_id IN (
--     SELECT AVG()
-- )
-- FROM BooksDB.dbo.books

-- SELECT book_id
-- FROM BooksDB.dbo.ratings
-- WHERE AVG(rating*1.0) > (
    
-- )


-- SELECT book_id,  FROM BooksDB.dbo.ratings
-- GROUP BY book_id

-- Compare publication time with average reader ratings
-- SELECT book_id, AVG(rating*1.0) FROM BooksDB.dbo.ratings
-- GROUP BY book_id
-- HAVING AVG(rating*1.0) > (
--     SELECT average_rating
--     FROM BooksDB.dbo.books
-- )
-- -- 






-- SELECT book_id, AVG(rating)
-- FROM BooksDB.dbo.ratings
-- GROUP BY book_id
-- HAVING AVG(rating*1.0) > (
--     SELECT average_rating 
--     FROM BooksDB.dbo.books
--     WHERE books.book_id = book_id
-- )

-- Select Publication time
SELECT 
    title AS "Title",
    original_publication_year AS "Year",
    average_rating AS "Original Reviews", 
    (
        SELECT CAST(AVG(rating*1.0) AS DECIMAL(3,2))
        FROM BooksDB.dbo.ratings AS r
        WHERE b.book_id = r.book_id
        GROUP BY book_id
    ) AS "Reader Reviews"
FROM BooksDB.dbo.books AS b
WHERE average_rating < (
    SELECT AVG(rating*1.0) AS 'avg'
    FROM BooksDB.dbo.ratings AS r
    WHERE b.book_id = r.book_id
    GROUP BY book_id
)
ORDER BY original_publication_year, title