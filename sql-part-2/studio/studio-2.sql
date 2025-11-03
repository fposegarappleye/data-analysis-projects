-- SELECT MAX(LEN(title))
-- FROM BooksDB.dbo.books

-- SELECT TOP 1 original_title AS 'Title'
-- FROM BooksDB.dbo.books
-- ORDER BY LEN(title) DESC

-- -- A
-- SELECT MIN(LEN(authors))
-- FROM BooksDB.dbo.books
--     -- 3

-- -- B
-- SELECT TOP 1 authors AS 'Author'
-- FROM BooksDB.dbo.books
-- ORDER BY LEN(authors) ASC
--     -- Avi

-- SELECT COUNT(*)
-- FROM BooksDB.dbo.books
-- WHERE title LIKE ':The %' 
--     OR title LIKE 'The %'
--     OR title LIKE '% the %'

-- SELECT DISTINCT authors
-- FROM BooksDB.dbo.books
-- WHERE authors LIKE 'Z%'

-- SELECT COUNT(*)
-- FROM BooksDB.dbo.books
-- WHERE SUBSTRING(language_code, 1,2) NOT LIKE 'en'

SELECT CONCAT(title, ' by ', authors, ' in ', ISNULL(language_code, 'unknown'))
FROM BooksDB.dbo.books
