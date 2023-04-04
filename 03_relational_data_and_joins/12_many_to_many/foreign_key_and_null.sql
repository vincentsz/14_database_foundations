-- a query that retrieves all of te books that do have a category:

SELECT books.title FROM books
JOIN books_categories
ON books.id = books_categories.book_id
AND books_categories.category_id IS NOT NULL;

-- a query that retrieves all of the books that do'nt have a category

SELECT books.title FROM books
JOIN books_categories
ON books.id = books_categories.book_id
AND books_categories.category_id IS NULL;

-- can lead to same book being retrieved