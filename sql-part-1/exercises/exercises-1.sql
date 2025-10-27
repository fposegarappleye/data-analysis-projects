-- SELECT TOP 1000 *
-- FROM BooksDB.dbo.books

-- SELECT COUNT(id)
-- FROM BooksDB.dbo.books

-- SELECT COUNT(id)
-- FROM BooksDB.dbo.books
-- WHERE original_publication_year < 1800

-- SELECT DISTINCT authors
-- FROM BooksDB.dbo.books

-- SELECT * 
-- FROM BooksDB.dbo.books
-- WHERE language_code LIKE 'en%'

-- SELECT *
-- FROM BooksDB.dbo.books
-- WHERE original_publication_year >= 1914 AND original_publication_year <= 1921

-- SELECT TOP 1000 *
-- FROM BooksDB.dbo.tags
-- ORDER BY tag_id ASC

-- SELECT COUNT(DISTINCT goodreads_book_id) AS "Number of Books by Tag"
-- FROM BooksDB.dbo.book_tags
-- GROUP BY tag_id

-- SELECT TOP 1000 *
-- FROM BooksDB.dbo.ratings
-- ORDER BY rating DESC

-- SELECT COUNT(DISTINCT user_id)
-- FROM BooksDB.dbo.ratings
-- WHERE rating < 2

-- SELECT COUNT(DISTINCT book_id)
-- FROM BooksDB.dbo.ratings
-- WHERE rating >= 4

-- SELECT *
-- FROM BooksDB.dbo.tags
-- WHERE tag_name LIKE '%mystery%'

-- SELECT *
-- FROM BooksDB.dbo.tags
-- WHERE tag_name < 'd' AND tag_name >= 'c';

-- SELECT [user_id], COUNT(book_id) AS "Books to Read"
-- FROM BooksDB.dbo.to_read
-- GROUP BY [user_id] 
-- ORDER BY [user_id] ASC

-- SELECT [user_id], COUNT(book_id) AS 'Total Books to Read'
-- FROM BooksDB.dbo.to_read
-- GROUP BY [user_id] 
-- ORDER BY 'Total Books to Read' DESC