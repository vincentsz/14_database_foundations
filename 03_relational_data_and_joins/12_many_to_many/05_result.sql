/*
0.Query
 -description

Write a SQL statement that will return the following result:

 -expected output
      name        | book_count |                                 book_titles
------------------+------------+-----------------------------------------------------------------------------
Biography         |          2 | Einstein: His Life and Universe, Sally Ride: America's First Woman in Space
Classics          |          2 | A Tale of Two Cities, Jane Eyre
Cookbook          |          1 | Vij's: Elegant and Inspired Indian Cuisine
Fantasy           |          1 | Harry Potter
Fiction           |          3 | Jane Eyre, Harry Potter, A Tale of Two Cities
Nonfiction        |          3 | Sally Ride: America's First Woman in Space, Einstein: His Life and Universe, Vij's: Elegant and Inspired Indian Cuisine
Physics           |          1 | Einstein: His Life and Universe
South Asia        |          1 | Vij's: Elegant and Inspired Indian Cuisine
Space Exploration |          1 | Sally Ride: America's First Woman in Space
 -returned output
        name        | book_count |                                                       book_titles                                                       
-------------------+------------+-------------------------------------------------------------------------------------------------------------------------
 Biography         |          2 | Einstein: His Life and Universe, Sally Ride: America's First Woman in Space
 Classics          |          2 | A Tale of Two Cities, Charlotte Brontë
 Cookbook          |          1 | Vij's: Elegant and Inspired Indian Cuisine
 Fantasy           |          1 | Harry Potter
 Fiction           |          3 | A Tale of Two Cities, Harry Potter, Charlotte Brontë
 Nonfiction        |          3 | Einstein: His Life and Universe, Sally Ride: America's First Woman in Space, Vij's: Elegant and Inspired Indian Cuisine
 Physics           |          1 | Einstein: His Life and Universe
 South Asia        |          1 | Vij's: Elegant and Inspired Indian Cuisine
 Space Exploration |          1 | Sally Ride: America's First Woman in Space
(9 rows)

1.Understand problem
 -input:
 --tables:
categories, books_categories, books
 --columns
categories.name, categories.id
books.title
 -return:

 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema
                                   Table "public.books"
 Column |         Type          | Collation | Nullable |              Default              
--------+-----------------------+-----------+----------+-----------------------------------
 id     | integer               |           | not null | nextval('books_id_seq'::regclass)
 title  | character varying(32) |           | not null | 
 author | character varying(32) |           | not null | 
Indexes:
    "books_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "books_categories" CONSTRAINT "books_categories_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE

                                       Table "public.categories"
 Column |         Type          | Collation | Nullable |                Default                 
--------+-----------------------+-----------+----------+----------------------------------------
 id     | integer               |           | not null | nextval('categories_id_seq'::regclass)
 name   | character varying(32) |           | not null | 
Indexes:
    "categories_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "books_categories" CONSTRAINT "books_categories_category_id_fkey" FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE

                Table "public.books_categories"
   Column    |  Type   | Collation | Nullable | Default 
-------------+---------+-----------+----------+---------
 book_id     | integer |           | not null | 
 category_id | integer |           | not null | 
Foreign-key constraints:
    "books_categories_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
    "books_categories_category_id_fkey" FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
 -tables

3.Data type

4.Algorithm
inner join categories, books_categories and categories
group by category id
select category names, count the category id,s, string aggregate the book titles
*/

SELECT categories.name, count(categories.id) AS book_count, string_agg(books.title, ', ') AS book_titles FROM categories
JOIN books_categories
ON categories.id = books_categories.category_id
JOIN books
ON books_categories.book_id = books.id
GROUP BY categories.id
ORDER BY name;