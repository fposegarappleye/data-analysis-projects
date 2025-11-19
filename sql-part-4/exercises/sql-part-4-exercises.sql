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

SELECT tag_id, tag_name FROM BooksDB.dbo.tags
WHERE tag_id IN (
    SELECT tag_id
    FROM BooksDB.dbo.book_tags
    GROUP BY tag_id
    HAVING SUM(count) > 100000
)