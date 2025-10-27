-- SELECT TOP 100 book_id AS 'ID', authors AS "Authors", title AS "Title", average_rating AS "Rating"
-- FROM BooksDB.dbo.books
-- ORDER BY 'Rating' DESC

-- SELECT TOP 1 title AS "Title", average_rating AS "Rating"
-- FROM BooksDB.dbo.books
-- ORDER BY average_rating ASC

-- SELECT TOP 10 COUNT(DISTINCT tag_id) AS "Number of Books by Tag"
-- FROM BooksDB.dbo.book_tags
-- GROUP BY tag_id
-- ORDER BY "Number of Books by Tag" ASC

-- SELECT tag_id, COUNT(tag_id) AS 'ct'
-- FROM BooksDB.dbo.book_tags
-- GROUP BY tag_id
-- ORDER BY count DESC

-- SELECT TOP 10 tag_id, COUNT(*) AS "Count"
-- FROM BooksDB.dbo.book_tags
-- GROUP BY tag_id
-- ORDER BY 'Count' DESC

-- SELECT TOP 10 t.tag_id, t.tag_name, COUNT(*) AS "Count"
-- FROM BooksDB.dbo.tags AS t
-- JOIN BooksDB.dbo.book_tags AS bt
--     ON t.tag_id = bt.tag_id
-- GROUP BY t.tag_id, t.tag_name
-- ORDER BY 'Count' DESC

-- SELECT COUNT(*)
-- FROM BooksDB.dbo.books
-- WHERE original_publication_year >= 2000 AND original_publication_year < 2010

-- SELECT COUNT(*)
-- FROM BooksDB.dbo.books
-- WHERE title LIKE '%happy%'

-- SELECT id, authors AS "Authors", title AS "Title", average_rating AS "Rating"
-- FROM BooksDB.dbo.books
-- WHERE authors LIKE 'Bill Watterson%'
--     OR authors LIKE 'Brandon Sanderson%'
--     OR authors LIKE 'J.K. Rowling%'
-- ORDER BY Authors, Rating DESC

-- SELECT DISTINCT(authors)
-- FROM BooksDB.dbo.books
-- WHERE authors > 'rock%' AND authors < 'roll%'

-- SELECT title AS "Title", authors AS "Authors", original_publication_year AS "Published in"
-- FROM BooksDB.dbo.books
-- WHERE language_code NOT LIKE 'en%' AND original_publication_year < 1914

SELECT *
FROM BooksDB.dbo.tags
WHERE tag_name LIKE 'art-%' 
    OR tag_name LIKE 'architecture%'
    OR tag_name LIKE 'art'
    OR tag_name LIKE 'arts%'