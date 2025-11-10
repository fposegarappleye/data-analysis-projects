
-- -- INNER JOIN
-- SELECT TOP 30 b.title, b.average_rating, tr.user_id, tr.book_id
-- FROM BooksDB.dbo.books AS b
-- INNER JOIN BooksDB.dbo.to_read AS tr
-- ON b.book_id = tr.book_id
-- ORDER BY book_id;

-- Q5
-- SELECT COUNT(title), title
-- FROM BooksDB.dbo.books AS b
-- JOIN BooksDB.dbo.book_tags AS bt
--     ON b.best_book_id = bt.goodreads_book_id
-- GROUP BY title


-- Query 1: LEFT JOIN
-- SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
-- FROM BooksDB.dbo.books AS b
-- LEFT JOIN BooksDB.dbo.to_read AS tr
-- ON b.best_book_id = tr.book_id
-- ORDER BY b.average_rating;

-- Query 2: LEFT JOIN USING 'IS NOT NULL'
-- SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
-- FROM BooksDB.dbo.books AS b
-- LEFT JOIN BooksDB.dbo.to_read AS tr
-- ON b.best_book_id = tr.book_id
-- --WHERE tr.user_id IS NOT NULL
-- ORDER BY b.average_rating;

-- SELECT TOP 300 b.title, b.average_rating, b.books_count, tr.user_id, tr.book_id
-- FROM BooksDB.dbo.books AS b
-- RIGHT JOIN BooksDB.dbo.to_read AS tr
-- ON b.best_book_id = tr.book_id;

-- -- FULL JOIN
-- SELECT TOP 1000 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
-- FROM BooksDB.dbo.books AS b
-- FULL JOIN BooksDB.dbo.to_read AS tr
-- ON b.book_id = tr.book_id;


-- SELECT TOP 1 b.title, SUM(bt.count)
-- FROM BooksDB.dbo.books AS b
-- JOIN BooksDB.dbo.book_tags AS bt
--     ON b.best_book_id = bt.goodreads_book_id
-- GROUP BY b.title
-- ORDER BY SUM(bt.count) DESC

-- SELECT * 
-- FROM BooksDB.dbo.books 
-- WHERE books.best_book_id = 3

-- book_id is 3


-- SELECT TOP 5 b.title, bt.tag_id, bt.count
-- FROM BooksDB.dbo.books AS b
-- RIGHT JOIN BooksDB.dbo.book_tags AS bt
--     ON b.best_book_id = bt.goodreads_book_id
-- WHERE b.best_book_id = 3
-- ORDER BY bt.count DESC

-- SELECT * from BooksDB.dbo.tags WHERE tags.tag_id = 11305


-- 30574
-- 11557
-- 11305


-- SELECT t.tag_name, t.tag_id 
-- FROM BooksDB.dbo.tags AS t
-- LEFT JOIN BooksDB.dbo.books AS b

-- SELECT t.tag_name, t.tag_id 
-- FROM BooksDB.dbo.tags AS t
-- WHERE tag_name LIKE '%-art%'
-- --7740
-- --7957, concept-art
-- --11319

-- SELECT TOP 1 b.title, bt.count
-- FROM BooksDB.dbo.book_tags AS bt
-- LEFT JOIN BooksDB.dbo.books AS b 
--     ON bt.goodreads_book_id = b.book_id
-- WHERE bt.tag_id = 7957
-- ORDER BY count DESC


-- Select counts of books by title
-- 
-- SELECT TOP 10 b.title as 'Title', COUNT(tr.book_id) as 'To-read count'
-- FROM BooksDB.dbo.books AS b
-- LEFT JOIN BooksDB.dbo.to_read AS tr
--     ON b.book_id = tr.book_id
-- GROUP BY b.title
-- ORDER BY COUNT(tr.book_id) DESC


-- SELECT *
-- FROM BooksDB.dbo.to_read

-- SELECT TOP 10 user_id AS 'User', COUNT(DISTINCT b.title) AS 'To-read count'
-- FROM BooksDB.dbo.to_read AS tr
-- LEFT JOIN BooksDB.dbo.books AS b
--     ON tr.book_id = b.book_id
-- GROUP BY tr.user_id
-- ORDER BY COUNT(DISTINCT b.title) DESC

-- SELECT DISTINCT b.title, tr.user_id
-- FROM BooksDB.dbo.to_read AS tr
-- JOIN BooksDB.dbo.books AS b
--     ON tr.book_id = b.book_id
-- WHERE tr.user_id = 11932
-- 11932, 12483, 14771




-- STUDIO
-- SELECT 
--     bt.tag_id AS 'Tag ID', SUM(bt.count) AS 'Tag Occurrences', t.tag_name AS 'Tag Name'
-- FROM 
--     BooksDB.dbo.tags AS t
-- LEFT JOIN BooksDB.dbo.book_tags AS bt
--     ON t.tag_id = bt.tag_id
-- GROUP BY 
--     bt.tag_id, t.tag_name
-- HAVING t.tag_name LIKE '%women%'
--     OR t.tag_name LIKE '%woman%'
--     OR t.tag_name LIKE '%female%'
-- ORDER BY SUM(bt.count) DESC



-- SELECT 
--     authors AS 'Authors', 
--     --AVG(average_rating) AS "Ratings",
--     title AS 'Title',
--     COUNT(DISTINCT book_id) AS 'Books'
-- FROM BooksDB.dbo.book
-- FROM BooksDB.dbo.books AS b
-- INNER JOIN BooksDB.dbo.book_tags AS bt 
--     ON b.book_id = bt.goodreads_book_id
-- INNER JOIN BooksDB.dbo.tags AS t
--     ON bt.tag_id = t.tag_id
-- GROUP BY authors
-- HAVING COUNT(DISTINCT book_id) >= 5
-- ORDER BY Ratings DESC


-- SELECT b.authors AS 'Authors', b.average_rating AS 'Rating', b.title AS 'Title', t.tag_name
-- FROM BooksDB.dbo.books AS b
-- RIGHT JOIN BooksDB.dbo.book_tags AS bt ON bt.goodreads_book_id = b.id
-- RIGHT JOIN BooksDB.dbo.tags AS t ON t.tag_id = bt.tag_id
-- WHERE t.tag_name LIKE '%garden%'


--- ACTIVE SECTION
-- SELECT 
--     b.authors AS 'Authors', 
--     b.average_rating AS 'Rating', 
--     b.title AS 'Title', 
--     t.tag_name
-- FROM BooksDB.dbo.tags AS t
-- LEFT OUTER JOIN BooksDB.dbo.book_tags AS bt 
--     ON bt.tag_id = t.tag_id
-- LEFT OUTER JOIN BooksDB.dbo.books AS b
--     ON b.best_book_id = bt.goodreads_book_id
-- WHERE t.tag_name LIKE '%garden%'
--     OR t.tag_name LIKE '%sustainability%'
--     AND t.tag_name NOT LIKE '%lisa%'
--     AND t.tag_name NOT LIKE '%home%'
--     AND t.tag_name NOT LIKE '%julia%'
--     AND t.tag_name NOT LIKE '%mystery%'
--     AND t.tag_name NOT LIKE '%middle%'
--     AND t.tag_name NOT LIKE '%home%'
--     AND t.tag_name NOT LIKE '%nora%'
--     AND t.tag_name NOT LIKE '%teagarden%'
-- ORDER BY Rating DESC

-- JOIN 
-- JOIN BooksDB.dbo.tags AS t ON t.tag_id = bt.tag_id
-- WHERE t.tag_name LIKE '%garden%'

-- SELECT b.book_id, b.best_book_id, b.id, bt.goodreads_book_id
-- FROM BooksDB.dbo.books AS b
-- JOIN BooksDB.dbo.book_tags AS bt
--     ON b.book_id = bt.goodreads_book_id

SELECT TOP 150
    b.authors AS 'Authors', 
    b.average_rating AS 'Rating', 
    b.title AS 'Title'
FROM BooksDB.dbo.tags AS t
LEFT OUTER JOIN BooksDB.dbo.book_tags AS bt 
    ON bt.tag_id = t.tag_id
LEFT OUTER JOIN BooksDB.dbo.books AS b
    ON b.best_book_id = bt.goodreads_book_id
WHERE t.tag_name LIKE '%horror%' 
    AND bt.count > 100
    OR t.tag_name LIKE '%halloween%'
    AND bt.count > 50
ORDER BY Rating DESC
