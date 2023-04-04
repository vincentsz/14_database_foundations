/*
0.Query
 -description
Write a SQL statement that will return the following result:

 -expected output
 id |     author      |           categories
----+-----------------+--------------------------------
  1 | Charles Dickens | Fiction, Classics
  2 | J. K. Rowling   | Fiction, Fantasy
  3 | Walter Isaacson | Nonfiction, Biography, Physics
(3 rows)
 -returned output
 id |     author      |           categories           
----+-----------------+--------------------------------
  1 | Charles Dickens | Fiction, Classics
  2 | J. K. Rowling   | Fiction, Fantasy
  3 | Walter Isaacson | Nonfiction, Biography, Physics
(3 rows)
(3 rows)
1.Understand problem
 -input:
 --tables:
books, categories, books_categories
 --columns
books.id, books.author
categories.name
 -return:
books.id, books.author
aggregate function, concatenating all categories names that belong to the same book with acomma
 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema
                    List of relations
 Schema |       Name        |   Type   |      Owner      
--------+-------------------+----------+-----------------
 public | books             | table    | vincentsijssens
 public | books_categories  | table    | vincentsijssens
 public | books_id_seq      | sequence | vincentsijssens
 public | categories        | table    | vincentsijssens
 public | categories_id_seq | sequence | vincentsijssens

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
return each book's id, it's author and the categories uit belongs to
inner join books with books categories on books.id = books_categories.book_id
inner join book_categories and categories on categories.id = books_categories.category_id

*/

SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories 
  FROM books
  JOIN books_categories
    ON books.id = books_categories.book_id
  JOIN categories
    ON books_categories.category_id = categories.id
  GROUP BY books.id
  ORDER BY books.id ASC;

-- book

SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY books.id ORDER BY books.id;
