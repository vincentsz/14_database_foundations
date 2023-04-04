SELECT reviews.book_id, reviews.content, reviews.rating, reviews.published_date, books.id, books.title, books.author
  FROM reviews
  RIGHT JOIN books
    ON reviews.book_id = books.id;